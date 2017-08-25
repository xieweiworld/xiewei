# 初始化数据

# 商城新版业务

# 2016-12-01

# 1、将 会员卡充值记录表(member_card_chongzhi) 中的订单号 => 会员卡充值赠送服务表(member_card_chongzhi_service) 中的订单号：条件 id = cz_id
#select cs.*, cz.* from 
update 
member_card_chongzhi_service cs inner join member_card_chongzhi cz
on /* cs.wid = cz.wid and*/ cs.cz_id = cz.id
set cs.order_id = cz.order_id
where cz.wid > 0 and (cs.order_id is null or cs.order_id = '');

# 2016-12-01

select '10' as 'Index', 'Update Cards' as 'Title', 'Done' as 'Status';
