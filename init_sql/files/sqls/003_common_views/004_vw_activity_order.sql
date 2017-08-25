
# 1、统计活动期间抢购订单的营业额
# 2、统计活动期间车主扫码付款给商户的营业额

# ERROR 1349: View's SELECT contains a subquery in the FROM clause!
# DIRECT-SQL: select wid, sum(`order`) as 'order', sum(price) as 'price' from vw_activity_order group by wid order by price desc;

CREATE OR REPLACE VIEW `vw_activity_order` AS

select wid, count(id) as 'order', sum(jiage) as 'price'
from dsqgrecord
where 
(state != 0 or payment = 1) 
and ctime >= UNIX_TIMESTAMP('2016-01-15 00:00:00') and ctime < UNIX_TIMESTAMP('2016-02-01 00:00:00')
group by wid
union
select token as wid, count(id) as 'order', sum(price) as 'price'
from ai9me_product_cart
where payment = 6
and time >= UNIX_TIMESTAMP('2016-01-15 00:00:00') and time < UNIX_TIMESTAMP('2016-02-01 00:00:00')
group by token;

