# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-18
########### 商城核销门店优化
################################# END   - 2017-08-18
*/

# 1、将未核销的订单的会员卡消费记录状态重置为0(未生效)
# select x.id, x.wid, x.lbs_id, x.status, x.order_id, d.id, d.wid, d.verified_id, d.is_verified, d.order_code from 
update 
member_card_xiaofei x inner join wmall_order d on x.wid = d.wid and x.order_id = d.order_code
set x.status = 0
where d.order_type = 1 
and d.is_paid = 1 
and d.is_verified = 0
and x.status = 1
;

# 2、会员卡消费记录的 消费门店 与 相应的商城订单的 核销门店 的一致性（只处理已核销的订单时的情况）
# select x.id, x.wid, x.lbs_id, x.order_id, x.status, d.id as d_id, d.wid as d_wid, d.order_code, d.verified_id, d.is_verified, verified_at from 
update
member_card_xiaofei x inner join wmall_order d on x.wid = d.wid and x.order_id = d.order_code
set x.lbs_id = d.verified_id
where x.wid > 0 
and x.lbs_id != d.verified_id
and d.is_verified = 1
;


select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';
