# 资金收入流水表视图: v_customer_money_in_all
# 按订单涉及到的支付方式的对应价格列出各支付方式的列数据

# 主体结构与 customer_money_in 表结构是一致的, 除扩充字段

# 实收价格统一以 actual_price 字段为准

###### [START] v_customer_money_in_all

/*
[获取数据的前提条件]
+城商品订单： 非会员卡; 状态为已完成; 会员卡支付的：计流水，不计实收;
+会员卡充值记录：
	非删除的会员;非历史数据导入、非余额转存的记录;是主卡的记录 且 实际支付金额大于0;
+项目抢购类订单：
	状态为已完成的;会员卡支付的：计流水，不计实收;
+开单收银类订单：
	已收银的订单;状态为不等于9的，(已无这类数据); 未作废的 且 未返单的
	订单类型为这三类的：1A单,3项目消费,4购买商品 (不含B单的);
+新增收入类数据： 全表数据： customer_money_in;
+挂帐还款明细记录： 全表记录： order_charge_repay;

[新业务类型(in_type)]定义:
2:会员办卡
1:维修开单
3:美容开单
4:购买商品
5:商城订单
6:抢购订单
7:扫码付款
8:采购退货
9:其他收入
10:挂帐还款
11:会员卡消费

[新支付方式(payment)]定义：
1：现金
2：银行卡
3：支付宝
4：微信
5：储值卡
6：会员卡
7：挂帐
8：国寿积分

修改历史：
# 20161015: 添加商品/项目名称定义: item_name
# 20161016: 增加显示列: 支付方式（文本）， 车主姓名（当时信: name, mobile, cpai）
# 20161017: 抢购订单、商城订单可直接排除'会员卡支付'的订单，该类订单只能使用一种支付
# 20161018：收银开单，实际支付价是五项汇总
# 20161020：收银开单，明细字段调整
# 20161129：充值记录中的已删除的会员：需要排除掉。
# 20161130：扩展显示列：cash_price, vcard_price, mcard_price, bcard_price, weixin_price, alipay_price, debt_price
# 20161205: 加入会员卡消费记录信息(资金收入视图中暂不添加)
*/


create or replace view v_customer_money_in_all as

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
(CASE WHEN payment = 5 or payment = 6 or payment is null or payment < 3 or payment > 7 then actual_price ELSE 0 END) as weixin_price, 
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
(CASE WHEN payment = 1 or payment is null or payment > 4 then c.price ELSE 0 END) as cash_price, 
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
(CASE WHEN payment = 0 or payment = 2 or payment = 6 or payment is null or payment > 7 then actual_price ELSE 0 END) as weixin_price, 
0 as alipay_price, 
0 as debt_price,
from_unixtime(ctime) as order_time, remark, 0 as sort_no, isdelete as is_delete, from_unixtime(ctime) as add_date, '' as add_by, '' as update_date, '' as update_by
from dsqgrecord d 
# left join customer_services cs1 on d.wid = cs1.wid and d.ser1 = cs1.id
left join customer_services cs2 on d.wid = cs2.wid and d.ser2 = cs2.id
where state = 3

union all
# 收银类订单【收银状态为1，且没有作废】- 列数据
select b.wid,
ifnull(receive_by, 0) as receive_by,
u.lbsid as lbsid,
concat_ws(',',
case when mcard_price = 0 then NULL else '会员卡' end,
case when vcard_price = 0 then NULL else '储值卡' end,
case when cash_price = 0 then NULL else '现金' end,
case when bcard_price = 0 then NULL else '银行卡' end,
case when weixin_price = 0 then NULL else '微信' end,
case when alipay_price = 0 then NULL else '支付宝' end,
case when debt_price = 0 then NULL else '挂帐' end) as payment,
trim('/' from concat(b.service_detail, '/', b.product_detail)) as item_name,
member_name as name, member_mobile as mobile, cpai, 
order_type as in_type,
b.id as type_id, order_code as order_id, 
order_amount as order_price, 
(order_amount - settle_price) as coupon_price,  
(cash_price + bcard_price + weixin_price + alipay_price + preget_price) as actual_price, 
(cash_price + preget_price) as cash_price, vcard_price, mcard_price, bcard_price, weixin_price, alipay_price, debt_price,
b.settle_time as order_time, b.remark, b.sort_no, b.is_delete, b.add_date, b.add_by, b.update_date, b.update_by
from order_billing b
left join user_staff u on b.wid = u.wid and b.receive_by = u.id
where is_cash = 1 and status != 9 and is_cancel = 0 and order_type != 2 # is_revert = 0

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
10 as in_type, '/' as type_id, '/' as order_id, 0 as order_price, 0 as coupon_price, repay_amount as actual_price,
(CASE WHEN pay_type = 1 or pay_type is null or pay_type > 4 then repay_amount ELSE 0 END) as cash_price, 
0 as vcard_price,
0 as mcard_price,
(CASE WHEN pay_type = 2 then repay_amount ELSE 0 END) as bcard_price, 
(CASE WHEN pay_type = 4 then repay_amount ELSE 0 END) as weixin_price, 
(CASE WHEN pay_type = 3 then repay_amount ELSE 0 END) as alipay_price, 
0 as debt_price,
repay_time as order_time, repay_remark as remark, o.sort_no, o.is_delete,
o.add_date, o.add_by, o.update_date, o.update_by
from order_charge_repay o inner join member_base m on o.wid = m.wid and o.mid=m.id

union all

# in_type: 11 => 会员卡消费
# 会员卡消费记录: 必须存在会员id，且会员未标记为删除
select x.wid,
0 as receive_by,
x.lbs_id as lbsid,
CASE
	WHEN type is null or type = 0 or type = 1 or type = 11 THEN '储值卡'
	WHEN type = 12 or type = 13 or type = 14 THEN '会员卡'
	ELSE 0
END as payment,
x.content as item_name,
m.name, x.number as mobile, x.cpai,
11 as in_type, x.id as type_id, x.consume_code as order_id,
(
case
	when type is null or type = 0 or type = 1 or type = 11 then x.amount
	when type = 12 or type = 13 or type = 14 then x.amount * ifnull(s.sale_price,0)
	else 0
end
) as order_price,
0 as coupon_price,
0 as actual_price,
0 as cash_price, 
(case when type is null or type = 0 or type = 1 or type = 11 then x.amount else 0 end) as vcard_price,
(case when type = 12 or type = 13 or type = 14 then x.amount * ifnull(s.sale_price,0) ELSE 0 END) as mcard_price,
0 as bcard_price, 
0 as weixin_price, 
0 as alipay_price, 
0 as debt_price,
x.time as order_time, x.content as remark, 0 as sort_no, 0 as is_delete, x.add_date, x.add_by, '' as update_date, '' as update_by
from member_card_xiaofei x
inner join member_base m on x.wid = m.wid and x.mid = m.id and m.status != 1
left join customer_services s on x.wid = s.wid and x.service_id = s.id
where (x.source = 22 or x.source = 36) and ((type = 12 and is_main = 0) or (type != 14 and is_main = 1))
;

###### [FINISH] v_customer_money_in_all

# select * from v_customer_money_in_all;

select 'v_customer_money_in_all Finished' as 'DONE';
