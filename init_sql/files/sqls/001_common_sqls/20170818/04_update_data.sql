# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-14
########### 门店结算统计 [转入此次更新]
################################# END   - 2017-08-14
*/

# 1、添加权限
# 门店结算统计
call __proc__add_right_to_all_sys_levels('Reports/StoreSettlement');

# 2、更新会员卡消费表 type
# select distinct xc.wid, xc.type, xc.card_id, mc.id, mc.type from
update 
member_card_xiaofei xc left join member_card mc on xc.wid = mc.wid and xc.card_id = mc.id
set xc.type = mc.type
where xc.wid > 0 
and (xc.type is null or xc.type = 0 or xc.type = 11 or xc.type = 12 or xc.type = 13 or xc.type = 14)
and mc.type is not null
and mc.type != 0;

# 再更新剩下的
update member_card_xiaofei set type = 1 where wid > 0 and (type = 0 or type = 11);
update member_card_xiaofei set type = 2 where wid > 0 and type = 12;
update member_card_xiaofei set type = 3 where wid > 0 and type = 13;
update member_card_xiaofei set type = 4 where wid > 0 and type = 14;


/*
################################# START - 2017-08-18
########### SCRM优化二[高]
################################# END   - 2017-08-18
*/

# 添加权限：部门业绩统计、工单成本统计
call __proc__add_right_to_all_sys_levels('Reports/DeptPerformance');
call __proc__add_right_to_all_sys_levels('Reports/OrderCostDetail');

# call __proc__add_right_to_customer_role_rights_by_right_code('Data001', 'Reports/DeptPerformance');  # 单独设置给某个商户角色

# 有 数据中心 权限的，添加上
call __proc__add_right_to_customer_role_rights_by_right_code('Data001', 'Reports/OrderCostDetail');

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';

# 将会员卡中的办卡门店不正确的，从充值记录中有门店的最早一笔更新过来
#select mc.id, mc.wid, mc.lbs_id, ts.id, ts.wid, ts.card_id, ts.lbs_id from 
update
member_card mc inner join 
(
	select cc.id, cc.wid, cc.lbs_id, cc.card_id from member_card_chongzhi cc inner join (
		select wid, card_id, min(id) as min_id
		from member_card_chongzhi
		where wid > 0 and card_id > 0 and lbs_id > 0
		group by wid, card_id
	) t on cc.wid = t.wid and cc.id = min_id
) ts on mc.source = 32 and mc.wid = ts.wid and mc.id = ts.card_id
set mc.lbs_id = ts.lbs_id
where mc.wid > 0
# and mc.lbs_id > 0	# 原会员卡中为0的，表示无办卡门店
and mc.lbs_id != ts.lbs_id
;
