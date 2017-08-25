
# 用 MySQL-Front 无法执行经脚本
# 需要通过 MySQLWorkbench 或 通过 phpMyAdmin 在线站点 执行此脚本

# 取消国寿机构充值积分额度业务

# call __proc__chinalife_agency_credit_disable(_wid, _lbsid);

drop procedure if exists __proc__chinalife_agency_credit_disable;

DELIMITER //; 
# _wid:  国寿商户id(pubs.id)。
# _lbsid: 国寿机构id(lbs.id)。

CREATE PROCEDURE __proc__chinalife_agency_credit_disable(in _wid int, in _lbsid int)
PROC_START_POINT: BEGIN

	declare chinalife_wid int;
	declare _credits, _total_credits, _import_credits int;
	declare _ratio int;
	declare _id int;
	declare _error varchar(30);

	set chinalife_wid = 1142;

	############ 参数基本判定
	if _wid != chinalife_wid then
		select '参数错误(wid)：与国寿商户ID不匹配' as ERROR, _wid as WID;
		LEAVE PROC_START_POINT;
	end if;

	if _lbsid is null or _lbsid = '' or _lbsid < 1 then
		select '参数错误(lbsid)：机构ID值无效' as ERROR, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;

	############ wid不是国寿的商户ID
	set _id = ifnull((select max(id) from pubs where id = _wid limit 0, 1), 0);
	if _id = 0 then
		select '参数错误(wid)：给定的参数值并不是国寿商户WID或不存在该商户' as ERROR, _wid as WRONG_WID, chinalife_wid as RIGHT_WID;
		LEAVE PROC_START_POINT;
	end if;

	############ lbsid不是国寿的机构ID
	set _id = ifnull((select max(id) from lbs where wid = _wid and id = _lbsid and is_delete = 0 limit 0, 1), 0);
	if _id = 0 then
		select '参数错误(lbsid)：给定的机构ID参数值不是国寿商户的机构，或是该机构被标记为删除状态' as ERROR, _wid as WID, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;

	############ wid+lbsid: 是否存在积分额度记录
	set _id = ifnull((select max(id) from chinalife_agency_creditlimit where wid = _wid and lbsid = _lbsid limit 0, 1), 0);
	if _id = 0 then
		select '参数错误(lbsid)：不存在该机构的积分提额记录(该机构从来没有开通过机构积分提额业务)' as ERROR, _wid as WID, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;
	
	############################################################
	############ 所有参数都有效，且wid+lbsid也是有效的，则可以关闭此业务。
	set _error = '无';
	# 获取现有可用积分额度：不能直接取，需要汇总
	set _total_credits = ifnull((select sum(credit) from chinalife_agency_credit where wid = _wid and lbsid = _lbsid), 0);
	set _import_credits = ifnull((select sum(total_credit) from chinalife_car_credit where wid = _wid and lbsid = _lbsid and is_branch = 1), 0);
	set _credits = _total_credits - _import_credits;
	if _credits > 0 then
		set _ratio = ifnull((select integral from chinalife_integral limit 0, 1), 1);
		# 写入积分扣减记录
		insert into chinalife_agency_credit(wid, lbsid, type, amount, credit, charged_at, add_date, add_by)
		value(_wid, _lbsid, 2, 0 - _credits / _ratio, 0 - _credits, now(), now(), 'init');
	else
		if _credits < 0 then
			set _error = concat('超额消费：', _credits);
		end if;
	end if;

	# 关闭提额业务,清除可用积分：只有在开启的情况下才会停用
	update chinalife_agency_creditlimit
	set
		use_credits = 0,
		is_branch = 0,
		update_date = now(),
		update_by = 'disable'
	where wid = _wid and lbsid = _lbsid and is_branch = 1;

	# 查询当前额度
	select * from chinalife_agency_creditlimit where wid = _wid and lbsid = _lbsid;

	# 关闭业务完成
	select concat('已关闭机构积分提额业务') as STATUS, _error as ERROR, _wid as WID, _lbsid as LBSID;
	############################################################

END //; 
DELIMITER ;

