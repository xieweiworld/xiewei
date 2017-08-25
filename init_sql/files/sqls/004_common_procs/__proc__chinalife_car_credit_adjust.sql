
# 用 MySQL-Front 无法执行经脚本
# 需要通过 MySQLWorkbench 或 通过 phpMyAdmin 在线站点 执行此脚本

# 调整车主的车辆年度积分数据

# call __proc__chinalife_car_credit_adjust(wid, lbsid, mobile, cpai, insured_at, price);

drop procedure if exists __proc__chinalife_car_credit_adjust;

DELIMITER //; 
# _wid:  国寿商户id(pubs.id)。
# _lbsid: 国寿机构id(lbs.id)。
# _prices:  国寿机构积分提额价格。

CREATE PROCEDURE __proc__chinalife_car_credit_adjust(in _wid int, in _lbsid int, _mobile varchar(12), _cpai varchar(10), insured_at datetime, in _prices int)
PROC_START_POINT: BEGIN

	declare chinalife_wid int;
	declare max_price int;
	# declare _credits int;
	declare _ratio int;
	declare _id int;

	set chinalife_wid = 1142;
	set max_price = 100000;

	select '功能暂未实现' as ERROR;
	LEAVE PROC_START_POINT;

	############ 数据有效性判断：如果wid,lbsid,mobile,cpai,year,credit都有效，则可继续
	if _wid != chinalife_wid then
		select '参数错误(wid)：与国寿商户ID不匹配' as ERROR, _wid as WID;
		LEAVE PROC_START_POINT;
	end if;

	if _lbsid is null or _lbsid = '' or _lbsid < 1 then
		select '参数错误(lbsid)：机构ID值无效' as ERROR, _lbsid as LBSID;
		LEAVE PROC_START_POINT;
	end if;

	############ 数据关系判断：wid与lbsid一致；mobile与lbsid一致；cpai与mobile一致，则可继续


	############################################################
	############ 积分额度判断

	############ 添加积分调整记录

	# 调整完成
	select '已调整' as STATUS,  _prices * _ratio as '原积分', _prices * _ratio as '已消费积分', _prices * _ratio as '新积分', _prices * _ratio as '剩余积分', _wid as WID, _lbsid as LBSID;
	############################################################

END //; 
DELIMITER ;

