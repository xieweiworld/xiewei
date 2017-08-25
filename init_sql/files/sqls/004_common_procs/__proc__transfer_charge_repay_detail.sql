
# 用 MySQL-Front 可能无法执行此脚本

# 需要通过 MySQLWorkbench(推荐) 或 NavicatForMySql 或 SQLPro Studio 或 通过 phpMyAdmin 在线站点 执行此脚本


# call __proc__transfer_charge_repay_detail();

drop procedure if exists __proc__transfer_charge_repay_detail;

DELIMITER //; 

CREATE PROCEDURE __proc__transfer_charge_repay_detail()
PROC_START_POINT: BEGIN

DECLARE  detail_id int;
DECLARE  detail_wid int;
DECLARE  detail_lbsid int;
DECLARE  detail_mid int;
DECLARE  detail_current_amount decimal(10,2);

DECLARE  repay_id int;
DECLARE  repay_wid int;
DECLARE  repay_lbsid int;
DECLARE  repay_mid int;
DECLARE  repay_current_amount decimal(10,2);

DECLARE  no_more_record INT DEFAULT 0;
DECLARE  current_repay_amount decimal(10,2);		/* 当前还款的数额 */
DECLARE  repay_total_amount decimal(10,2);			/* 单个会员累计还款额 */

DECLARE  nop int;

DECLARE  detail_cursor CURSOR FOR  
	select id, wid, store_id, mid, charge_amount from order_charge_detail 
	where wid > 0 
	and is_shift = 0
	and charge_amount > unpay_amount 
	order by wid, store_id, mid, charge_time;  /*首先这里对游标进行定义*/

DECLARE  repay_cursor CURSOR FOR  
	select id, wid, store_id, mid, repay_amount from order_charge_repay
	where wid > 0 
	and is_shift = 0
	and wid = detail_wid and store_id = detail_lbsid and mid = detail_mid   /* 当前会员的还款记录 */
	order by wid, store_id, mid, repay_time;  /*首先这里对游标进行定义*/


DECLARE  CONTINUE HANDLER FOR NOT FOUND  SET no_more_record = 1; /*这个是个条件处理,针对NOT FOUND的条件,当没有记录时赋值为1*/

set @shift_flag = 2;   /* 用于标记已处理的数据 */


set @detail_rows = ifnull((select min(id) from order_charge_repay_detail limit 0,1), 0);
if @detail_rows > 0 then
	select '不再转换数据' as STATUS, '还款明细表中已存在数据' as REASON; /* 否则会产生重复数据 */
	LEAVE PROC_START_POINT;
end if;

set no_more_record = 0;
set current_repay_amount = 0;
set repay_total_amount = 0;

drop table if exists __tmp__repays__;
create table __tmp__repays__ select distinct wid, store_id, mid, id as pay_id, 0 as repay_total from order_charge_repay where wid > 0;


drop table if exists __tmp__repay_messages__;
create table __tmp__repay_messages__ select distinct 0 as wid, 0 as store_id, 0 as mid, space(20) as message,  0 as amount from order_charge_detail where wid = 0 ;


OPEN  detail_cursor; /* outer cursor*/
BEGIN
	/* first */
	FETCH  detail_cursor INTO detail_id, detail_wid, detail_lbsid, detail_mid, detail_current_amount; 

	WHILE no_more_record != 1 DO
		set current_repay_amount = 0;
		open repay_cursor;	/* inner cursor */
		BEGIN
			fetch repay_cursor into repay_id, repay_wid, repay_lbsid, repay_mid, repay_current_amount;

			while no_more_record != 1 do
				
				set repay_total_amount = ifnull((select repay_total from __tmp__repays__ where wid = repay_wid and store_id = repay_lbsid and mid = repay_mid and pay_id = repay_id limit 0,1), 0);

				if repay_current_amount <= detail_current_amount then
					/* 一笔挂帐，一次或多次还款 */
					set current_repay_amount = repay_current_amount - repay_total_amount;

					if current_repay_amount > 0 then
						insert into order_charge_repay_detail(wid, store_id, mid, charge_detail_id, repay_id, repay_amount, add_date, add_by)
						value(detail_wid, detail_lbsid, detail_mid, detail_id, repay_id, current_repay_amount, now(), 'transfer1');
					end if;

					/* 此笔还款是挂帐的某一次还款 */
					update order_charge_repay set is_shift = @shift_flag where wid > 0 and is_shift = 0 and id = repay_id;

					set detail_current_amount = detail_current_amount - current_repay_amount;
					/* go inner next */
				else
					/* 多笔挂帐，一次还款 */
					set current_repay_amount = detail_current_amount;

					/*if detail_mid = 135777 then
						select detail_current_amount, detail_mid, detail_id, repay_id, repay_mid, repay_current_amount, repay_total_amount;
					end if;*/

					set @remain_repay_amount = (repay_current_amount - repay_total_amount);
					if (@remain_repay_amount >= current_repay_amount) then
						/* 一次还款中的剩余款，还可还完一笔挂帐款 */
						if current_repay_amount > 0 then
							insert into order_charge_repay_detail(wid, store_id, mid, charge_detail_id, repay_id, repay_amount, add_date, add_by)
							value(detail_wid, detail_lbsid, detail_mid, detail_id, repay_id, current_repay_amount, now(), 'transfer2');
						end if;

						update order_charge_detail set is_shift = @shift_flag where wid > 0 and is_shift = 0 and id = detail_id;

						if @remain_repay_amount = current_repay_amount then
							/* 一次还款中的剩余款，刚好还完一笔挂帐款 */
							update order_charge_repay set is_shift = @shift_flag where wid > 0 and is_shift = 0 and id = repay_id;
						end if;

						/* get outer's next one */
						set no_more_record = 1;
					else
						/* 当前单个挂帐款未被还完，还需要其他还款记录来还款 */
						if repay_current_amount - repay_total_amount > detail_current_amount then
							set current_repay_amount = detail_current_amount;
						else
							set current_repay_amount = repay_current_amount - repay_total_amount;
						end if;

						if current_repay_amount > 0 then
							insert into order_charge_repay_detail(wid, store_id, mid, charge_detail_id, repay_id, repay_amount, add_date, add_by)
							value(detail_wid, detail_lbsid, detail_mid, detail_id, repay_id, current_repay_amount, now(), 'transfer3');
						end if;

						update order_charge_repay set is_shift = @shift_flag where wid > 0 and is_shift = 0 and id = repay_id;
					end if;

				end if;

				update __tmp__repays__ set repay_total = repay_total + current_repay_amount where wid = repay_wid and store_id = repay_lbsid and mid = repay_mid and pay_id = repay_id;
				
				if no_more_record != 1 then
					/* get next one */
					fetch repay_cursor into repay_id, repay_wid, repay_lbsid, repay_mid, repay_current_amount;
				end if;
			end while;
		END;
		close repay_cursor;

		/* 如果此时 detail_current_amount > 0 则表明仍有欠款未还清，可以写入临时表 */
		if detail_current_amount > 0 then
			set nop = 0;
			# insert into __tmp__repay_messages__(wid, store_id, mid, message, amount) value(detail_wid, detail_lbsid, detail_mid, '欠款未还', detail_current_amount);
		end if;
		
		/* 如果此时 (@remain_repay_amount - current_repay_amount) > 0 则表明有多余的还款数额 */
		if (@remain_repay_amount - current_repay_amount) > 0 then
			set nop = 0;
			# insert into __tmp__repay_messages__(wid, store_id, mid, message, amount) value(detail_wid, detail_lbsid, detail_mid, '多余还款', @remain_repay_amount - current_repay_amount);
		end if;

		update order_charge_detail set is_shift = @shift_flag where wid > 0 and is_shift = 0 and id = detail_id;

		set no_more_record = 0;

		/* get next one */
		FETCH  detail_cursor INTO detail_id, detail_wid, detail_lbsid, detail_mid, detail_current_amount; 

	END WHILE;
END;
CLOSE  detail_cursor;  /* release */

# select * from __tmp__repays__;
# select * from __tmp__repay_messages__;

/* 不需要还原字段 */
#update order_charge_detail set is_shift = 0 where wid > 0 and is_shift = @shift_flag;
#update order_charge_repay set is_shift = 0 where wid > 0 and is_shift = @shift_flag;

drop table if exists __tmp__repays__;
drop table if exists __tmp__repay_messages__;

/* MUST DROP MYSELF in order to be executed more times */
/* BUT: Error Code: 1357. Can't drop or alter a PROCEDURE from within another stored routine */
# drop procedure if exists __proc__transfer_charge_repay_detail;

END //; 
DELIMITER ;

/*


#--dupdate order_charge_detail set is_shift = 0 where is_shift = 2;
#--dupdate order_charge_repay set is_shift = 0 where is_shift = 2;
#--ddelete from order_charge_repay_detail;

# call __proc__transfer_charge_repay_detail();

select * from order_charge_detail where wid > 0 and charge_amount > unpay_amount order by wid, store_id, mid, charge_time;
select * from order_charge_repay where wid > 0 order by wid, store_id, mid, repay_time;
select * from order_charge_repay_detail order by wid, store_id, mid, charge_detail_id, repay_id, id;


*/
# 删除proc
# drop procedure if exists __proc__transfer_charge_repay_detail;

select 'Done for __proc__transfer_charge_repay_detail.sql' as 'STATUS';
