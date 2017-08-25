
# 用 MySQL-Front 无法执行经脚本
# 需要通过 MySQLWorkbench 或 通过 phpMyAdmin 在线站点 执行此脚本

# 启用国寿机构充值积分额度业务并充值

# call __proc__chinalife_agency_credit_recharge(wid, lbsid, price);

drop procedure if exists __proc__chinalife_agency_credit_recharge;

DELIMITER //; 
# _wid:  国寿商户id(pubs.id)。
# _lbsid: 国寿机构id(lbs.id)。
# _prices:  国寿机构积分提额价格。

CREATE PROCEDURE __proc__chinalife_agency_credit_recharge(in _wid int, in _lbsid int, in _prices int)
PROC_START_POINT: BEGIN

	declare chinalife_wid int;
	declare max_price int;
	# declare _credits int;
	declare _ratio int;
	declare _id int;

	set chinalife_wid = 1142;
	set max_price = 100000;

	############ 参数基本判定
	if _wid != chinalife_wid then
		select '参数错误(wid)：与国寿商户ID不匹配' as ERROR, _wid as WID;
		LEAVE PROC_START_POINT;
	end if;

	if _lbsid is null or _lbsid = '' or _lbsid < 1 then
		select '参数错误(lbsid)：机构ID值无效' as ERROR, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;

	if _prices is null or _prices = '' or _prices <= 1 or _prices > max_price then
		select '参数错误(prices)：机构积分价格额度必须界于1和100000之间' as ERROR, _prices as PRICES;
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
		select '参数错误(lbsid)：给定的机构ID参数值不是国寿商户的机构，或是该机构被标记为删除状态' as ERROR, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;

	############################################################
	############ 所有参数都有效，且wid+lbsid也是有效的，则可以充值。
	############ wid+lbsid: 是否存在积分额度记录
	set _id = ifnull((select max(id) from chinalife_agency_creditlimit where wid = _wid and lbsid = _lbsid limit 0, 1), 0);
	if _id = 0 then
		### 创建默认记录
		insert into chinalife_agency_creditlimit(wid, lbsid, total_credits, use_credits, is_branch, add_date, add_by)
		value(_wid, _lbsid, 0, 0, 0, now(), 'init');
		select '创建记录' as STATUS, '机构积分额度' as TITLE, _wid as WID, _lbsid as LBSID;
	end if;
	
	# 查询当前额度
	select '充值前' as Title, t.*  from chinalife_agency_creditlimit t where wid = _wid and lbsid = _lbsid;

	# 进行充值提额
	set _ratio = ifnull((select integral from chinalife_integral limit 0, 1), 1);
	update chinalife_agency_creditlimit
	set
		total_credits = total_credits + _prices * _ratio, 
		# use_credits = use_credits + _prices * _ratio, # 不再使用此字段，页面上会汇总
		is_branch = 1,
		update_date = now(),
		update_by = 'recharge'
	where wid = _wid and lbsid = _lbsid;

	# 写入充值记录
	insert into chinalife_agency_credit(wid, lbsid, type, amount, credit, charged_at, add_date, add_by)
	value(_wid, _lbsid, 1, _prices, _prices * _ratio, now(), now(), 'init');

	# 查询当前额度
	select '充值后' as Title, t.* from chinalife_agency_creditlimit t where wid = _wid and lbsid = _lbsid;

	# 充值完成
	select '已充值' as STATUS, concat('积分：',  _prices * _ratio) as PRICE, _wid as WID, _lbsid as LBSID;
	############################################################

END //; 
DELIMITER ;

