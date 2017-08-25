# 开单资金收入实收表视图: v_order_billing_in_all
# 按支付方式列出开单的订单涉及到的各支付方式的对应价格行数据，即由 列字段数据 转换为 行数据，且均以 actual_price 输出

# 主体结构与 v_customer_finance_in_all 表结构是一致的, 除扩充字段

# 实收价格统一以 actual_price 字段为准

###### [START] v_order_billing_in_all

/*
修改历史：
[获取数据的前提条件] 来源于 v_customer_money_in_all 视图中的定义
[新业务类型(in_type)]定义: 来源于 v_customer_money_in_all 视图中的定义
[新支付方式(payment)]定义： 来源于 v_customer_money_in_all 视图中的定义

# 20161201：将开单表中的混合支付的各类价格，由列字段数据 转为 行数据
# 20161202：两类卡(会员卡、储值卡)支付，不能计算实际收
*/

create or replace view v_order_billing_in_all as

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'会员卡' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price,
0 as actual_price, 
0 as cash_price, 0 as vcard_price, mcard_price, 0 as bcard_price, 0 as weixin_price, 0 as alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where mcard_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

UNION ALL

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'储值卡' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price,
0 as actual_price, 
0 as cash_price, vcard_price, 0 as mcard_price, 0 as bcard_price, 0 as weixin_price, 0 as alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where vcard_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

UNION ALL

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'现金' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price,
(cash_price + preget_price) as actual_price, 
(cash_price + preget_price) as cash_price, 0 as vcard_price, 0 as mcard_price, 0 as bcard_price, 0 as weixin_price, 0 as alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where (cash_price > 0 or preget_price > 0) and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

UNION ALL

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'银行卡' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price, bcard_price as actual_price, 
0 as cash_price, 0 as vcard_price, 0 as mcard_price, bcard_price, 0 as weixin_price, 0 as alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where bcard_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

UNION ALL

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'微信' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price, weixin_price as actual_price, 
0 as cash_price, 0 as vcard_price, 0 as mcard_price, 0 as bcard_price, weixin_price, 0 as alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where weixin_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

UNION ALL

select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'支付宝' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price, alipay_price as actual_price, 
0 as cash_price, 0 as vcard_price, 0 as mcard_price, 0 as bcard_price, 0 as weixin_price, alipay_price, 0 as debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where alipay_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

/*
UNION ALL
# 挂帐的金额不是实收的金额，而是在还款明细中体现出来的
select b.wid,
ifnull(receive_by, 0) as receive_by,
0 as lbsid,
'挂帐' as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price, debt_price as actual_price, 
0 as cash_price, 0 as vcard_price, 0 as mcard_price, 0 as bcard_price, 0 as weixin_price, 0 as alipay_price, debt_price,
b.settle_time as order_time, remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
where debt_price > 0 and is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0
*/

;

###### [FINISH] v_order_billing_in_all

# select * from v_order_billing_in_all;

select 'v_order_billing_in_all Finished' as 'DONE';
