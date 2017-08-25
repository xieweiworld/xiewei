# 资金收入实收表视图: v_customer_finance_in_all
# 按支付方式列出各订单涉及到的支付方式的对应价格行数据

# 主体结构与 v_customer_money_in_all 表结构是一致的, 除扩充字段

# 实收价格统一以 actual_price 字段为准

###### [START] v_customer_finance_in_all

/*
修改历史：
[获取数据的前提条件] 来源于 v_customer_money_in_all 视图中的定义
[新业务类型(in_type)]定义: 来源于 v_customer_money_in_all 视图中的定义
[新支付方式(payment)]定义： 来源于 v_customer_money_in_all 视图中的定义

# 20161201：将开单表中的混合支付的各类价格，由列字段数据 转为 行数据
*/

create or replace view v_customer_finance_in_all as

# 商城类订单(ishyk:商城订单(0))
select token as wid,
ifnull(introducer, 0) as receive_by,
ifnull(finished_by,0) as lbsid,
CASE
 WHEN payment = 3 or payment = 7 THEN '现金'
 WHEN payment = 4 THEN '储值卡'
 WHEN payment = 5 or payment = 6 THEN '微信'
 ELSE '微信'
 END as payment,
'商城商品' as item_name,
truename as name, tel as mobile, cpai,
5 as in_type, id as type_id, orderid as order_id,
price as order_price,
coupon_price, 
(CASE WHEN payment = 4 then 0 ELSE actual_price END) actual_price,
(CASE WHEN payment = 3 or payment = 7 then actual_price ELSE 0 END) as cash_price, 
(CASE WHEN payment = 4 then actual_price ELSE 0 END) as vcard_price,
0 as mcard_price,
0 as bcard_price, 
(CASE WHEN payment = 5 or payment = 6 or payment is null or payment = '' or payment < 3 or payment > 7 then actual_price ELSE 0 END) as weixin_price, 
0 as alipay_price, 
0 as debt_price,
from_unixtime(time) as order_time, remark, 0 as sort_no, isdel as is_delete, from_unixtime(time) as add_date, '' as add_by, '' as update_date, '' as update_by
from ai9me_product_cart
where ishyk = 0 and status = 3 and payment != 8   # 余额转存的不计

union all
# 会员办卡类订单(从充值表中取)
select c.wid,
ifnull(c.sale,0) as receive_by,
0 as lbsid,
CASE
 WHEN payment = 1 THEN '现金'
 WHEN payment = 2 THEN '银行卡'
 WHEN payment = 3 THEN '支付宝'
 WHEN payment = 4 THEN '微信'
 ELSE '现金'
 END as payment,
c.service_name as item_name,
c.name, c.number as mobile, c.cpai,
2 as in_type, c.id as type_id, c.order_id,
c.price as order_price,
0 as coupon_price,
c.price as actual_price,
(CASE WHEN payment = 1 or payment is null or payment = '' or payment > 4 then c.price ELSE 0 END) as cash_price, 
0 as vcard_price,
0 as mcard_price,
(CASE WHEN payment = 2 then c.price ELSE 0 END) as bcard_price, 
(CASE WHEN payment = 4 then c.price ELSE 0 END) as weixin_price, 
(CASE WHEN payment = 3 then c.price ELSE 0 END) as alipay_price, 
0 as debt_price,
c.time as order_time, '' as remark, 0 as sort_no, 0 as is_delete, c.add_date, c.add_by, '' as update_date, '' as update_by
from member_card_chongzhi c inner join member_base m on c.wid = m.wid and c.mid = m.id and m.status != 1
where c.source != 1 and c.source != 23 and c.is_main = 1 and c.price > 0

union all
# 抢购类订单(抢购订单(!6)、扫码付款订单(6))
select d.wid,
0 as receive_by,
ifnull(finished_by,0) as lbsid,
CASE
 WHEN payment = 0 or payment = 2 or payment = 6 THEN '微信'
 WHEN payment = 1 or payment = 7 THEN '现金'
 WHEN payment = 3 THEN '储值卡'
 # WHEN payment = 7 THEN '国寿积分'
 ELSE '微信'
 END as payment,
ifnull(cs2.name,'平台抢购') as item_name,
d.name, tel as mobile, cpai, 
(case when payment = 6 then 7 else 6 end) as in_type, d.id as type_id, orderid as order_id,
jiage as order_price,
coupon_price, 
(CASE WHEN payment = 3 then 0 ELSE actual_price END) as actual_price, 
(CASE WHEN payment = 1 or payment = 7 then actual_price ELSE 0 END) as cash_price, 
(CASE WHEN payment = 3 then actual_price ELSE 0 END) as vcard_price,
0 as mcard_price,
0 as bcard_price, 
(CASE WHEN payment = 0 or payment = 2 or payment = 6 or payment is null or payment = '' or payment > 7 then actual_price ELSE 0 END) as weixin_price, 
0 as alipay_price, 
0 as debt_price,
from_unixtime(ctime) as order_time, remark, 0 as sort_no, isdelete as is_delete, from_unixtime(ctime) as add_date, '' as add_by, '' as update_date, '' as update_by
from dsqgrecord d 
# left join customer_services cs1 on d.wid = cs1.wid and d.ser1 = cs1.id
left join customer_services cs2 on d.wid = cs2.wid and d.ser2 = cs2.id
where state = 3

union all
# 收银类订单【收银状态为1，且没有作废】- 行数据
select b.wid, receive_by, u.lbsid, payment, item_name, b.name, b.mobile, b.cpai, in_type, type_id, order_id, 
order_price, coupon_price, actual_price, cash_price, vcard_price, mcard_price, bcard_price, weixin_price, alipay_price, debt_price,
order_time, b.remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from v_order_billing_in_all b
left join user_staff u on b.wid = u.wid and b.receive_by = u.id

#union all
# 退货表数据 2016-11-17 不查询本表数据
#select opr.wid,
#'现金' as payment, 
#return_detail as item_name,
#'N/A' as name, 'N/A' as mobile, 'N/A' as cpai, 
#8 as in_type, opr.id as type_id, opo.out_code as order_id, opr.return_price as order_price, 0 as coupon_price, opr.return_price as actual_price, return_time as order_time, return_remark as remark, 0 as sort_no, opi.is_delete as is_delete,
#opr.add_date, opr.add_by, '无' as update_date, '无' as update_by
#from order_product_return opr
#inner join order_product_in opi on opr.in_order_id = opi.id
#inner join order_product_out opo on opr.id = opo.out_typeid 
#where opi.is_settlement = 1 and opo.out_type = 4

union all
# 新增收入类 2016-11-17 启用本表数据
select wid,
0 as receive_by,
0 as lbsid,
CASE
WHEN pay_type = 1 THEN '现金'
WHEN pay_type = 2 THEN '银行卡'
WHEN pay_type = 3 THEN '支付宝'
WHEN pay_type = 4 THEN '微信'
# WHEN pay_type = 9 THEN '其他'
ELSE '现金'
END as payment,
remark as item_name,
'' as name, '' as mobile, '' as cpai,
in_type, type_id, order_id, order_price, coupon_price, actual_price,
(CASE WHEN pay_type = 1 or pay_type is null or pay_type = '' or pay_type > 4 then actual_price ELSE 0 END) as cash_price, 
0 as vcard_price,
0 as mcard_price,
(CASE WHEN pay_type = 2 then actual_price ELSE 0 END) as bcard_price, 
(CASE WHEN pay_type = 4 then actual_price ELSE 0 END) as weixin_price, 
(CASE WHEN pay_type = 3 then actual_price ELSE 0 END) as alipay_price, 
0 as debt_price,
order_time, remark, sort_no, is_delete,
add_date, add_by, update_date, update_by
from customer_money_in

union all

# in_type: 9 => 挂帐还款明细
# 加上挂帐的还款明细数据 2016-11-30
select o.wid, 
0 as receive_by, 
0 as lbsid,
CASE
WHEN o.pay_type = 1 THEN '现金'
WHEN o.pay_type = 2 THEN '银行卡'
WHEN o.pay_type = 3 THEN '支付宝'
WHEN o.pay_type = 4 THEN '微信'
# WHEN pay_type = 9 THEN '其他'
ELSE '现金'
END as payment, 
repay_remark as item_name,
m.name, m.tel as mobile, m.cpai,
10 as in_type, '/' as type_id, '/' as order_id, repay_amount as order_price, 0 as coupon_price, repay_amount as actual_price,
(CASE WHEN pay_type = 1 or pay_type is null or pay_type = '' or pay_type > 4 then repay_amount ELSE 0 END) as cash_price, 
0 as vcard_price,
0 as mcard_price,
(CASE WHEN pay_type = 2 then repay_amount ELSE 0 END) as bcard_price, 
(CASE WHEN pay_type = 4 then repay_amount ELSE 0 END) as weixin_price, 
(CASE WHEN pay_type = 3 then repay_amount ELSE 0 END) as alipay_price, 
0 as debt_price,
repay_time as order_time, repay_remark as remark, o.sort_no, o.is_delete,
o.add_date, o.add_by, o.update_date, o.update_by
from order_charge_repay o inner join member_base m on o.wid = m.wid and o.mid=m.id
;

###### [FINISH] v_customer_finance_in_all

# select * from v_customer_finance_in_all;

select 'v_customer_finance_in_all Finished' as 'DONE';
