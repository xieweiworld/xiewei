# 初始化数据

# 2017-02-11

# 微信扫码付款功能初始化数据：可反复运行

# 1. 会员关注标识，有 wid_wxid 的都初台化为 1

# select * from member_base where wid_wxid != '' and wid_wxid is not null and wid > 0 and is_subscribe = 0;
update member_base
set is_subscribe = 1
where wid_wxid != '' and wid_wxid is not null and is_subscribe = 0;

# 2. 初始化扫码记录到新表: dsqgrecord (payment=6) => customer_scancode_payinfo
# 先备份dsqgrecord扫码付款记录
create table if not exists customer_scancode_backups
select * 
from dsqgrecord
where payment = 6;

# 转入旧数据(含标记为删除的及负wid的)到新数据表中
# 先加索引
ALTER TABLE `dsqgrecord` ADD INDEX `idx_dsqgrecord_orderid` USING BTREE (`orderid` ASC);
ALTER TABLE `customer_scancode_payinfo`  ADD INDEX `idx_customer_scancode_payinfo_ordercode` USING BTREE (`order_code` ASC);
# 转入
insert into  customer_scancode_payinfo(
	id, wid, lbsid, wid_wxid, mid, name, mobile, cpai, 
	wxid, nickname, headimgurl, 
	order_code, out_trade_no, wx_trade_no, pay_price, is_callback, paid_at, 
	state, remark, is_delete, 
	add_date, add_by, update_date, update_by)
select
	d.id, d.wid, d.lbsid, m.wid_wxid as wid_wxid, d.mid, ifnull(d.name, m.name) as name, d.tel as mobile, d.cpai,
	d.wxid, m.nickname, m.headimgurl, 
	d.orderid as order_code, d.out_trade_no, '' as wx_trade_no, 
	d.actual_price as pay_price, 1 as is_callback, d.pay_time as paid_at,
	d.state, d.remark, d.isdelete as is_delete, 
	from_unixtime(ctime) as add_date, 'transfer' as add_by, now() as update_date, 'transfer' as update_by
# from dsqgrecord d left join member_base m on abs(d.wid) = abs(m.wid) and abs(d.mid) = abs(m.id)
from dsqgrecord d left join member_base m on d.wid = m.wid and d.mid = m.id
left join customer_scancode_payinfo p on d.wid = p.wid and d.orderid = p.order_code
where d.payment = 6 and p.id is null and d.wid > 0;
# 移除索引
ALTER TABLE `dsqgrecord` DROP INDEX `idx_dsqgrecord_orderid`;
ALTER TABLE `customer_scancode_payinfo`  DROP INDEX `idx_customer_scancode_payinfo_ordercode`;

# 新表中状态为3(已核销)的值修改为状态值为1(已支付)：新表不再定义已核销状态
update customer_scancode_payinfo set state = 1 where state = 3;

# 将旧数据标记为删除状态
update dsqgrecord
set wid = -wid, mid = -mid, isdelete = 1
where payment = 6 and wid > 0;
 
select '03_update_data_scancode Finished' as 'DONE';

# 2017-02-11
