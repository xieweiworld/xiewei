# 2016-12-03 17:49

###### ！！！！！！！只是按18位目标长度处理，请不要修改为其他长度！！！！！！！ ######

set @order_length = 18;  # 处理其他非18位订单号的单号数据

# 【商城】 ai9me_product_cart - 旧业务，本为 18 位
# 非 18 位的订单: 无
select distinct length(orderid) from ai9me_product_cart where orderid is not null and orderid != '' and length(orderid) != @order_length;
# 为 null 或 '' 的订单: 无
select * from ai9me_product_cart where orderid is null and orderid = '';

# 【抢购】 dsqgrecord - 旧业务，本为 18 位
# 非 18 位的订单: 无
select distinct length(orderid) from dsqgrecord where orderid is not null and orderid != '' and length(orderid) != @order_length;
# 为 null 或 '' 的订单: 无
select * from dsqgrecord where orderid is null and orderid = '';

# 【商户短信充值业务】: 新业务-无须处理
# 非 18 位的订单: 无
select distinct length(orderid) from customer_sms_recharge where orderid is not null and orderid != '' and length(orderid) != @order_length;
# 为 null 或 '' 的订单: 无
select * from customer_sms_recharge where orderid is null and orderid = '';



# 【开单】 order_billing
#### 处理有 28 位的开单数据
select distinct length(order_code) from order_billing where order_code is not null and order_code != '' and length(order_code) != @order_length;
#### 更新
update order_billing
set order_code = concat(substring(order_code,3, 12), substring(order_code, length(order_code)-8+1, 6))
where length(order_code) = 28;
# 为 null 或 '' 的订单: 无
select * from order_billing where order_code is null and order_code = '';

# 【入库】 order_product_in
#### 处理有 26、28 位的入库数据
select distinct length(in_code) from order_product_in where in_code is not null and in_code != '' and length(in_code) != @order_length;
#### 更新
update order_product_in
set in_code = concat(substring(in_code,1, 12), substring(in_code, length(in_code)-8+1, 6))
where length(in_code) = 26;
update order_product_in
set in_code = concat(substring(in_code,3, 12), substring(in_code, length(in_code)-8+1, 6))
where length(in_code) = 28;
# 为 null 或 '' 的订单: 无
select * from order_product_in where in_code is null and in_code = '';

# 【出库】  order_product_out
#### 处理有 24、26、28 位的出库数据
select distinct length(out_code) from order_product_out where out_code is not null and out_code != '' and length(out_code) != @order_length;
#### 更新
update order_product_out
set out_code = concat(substring(out_code,1, 12), substring(out_code, length(out_code)-8+1, 6))
where length(out_code) = 24;
update order_product_out
set out_code = concat(substring(out_code,1, 12), substring(out_code, length(out_code)-8+1, 6))
where length(out_code) = 26;
update order_product_out
set out_code = concat(substring(out_code,3, 12), substring(out_code, length(out_code)-8+1, 6))
where length(out_code) = 28;
# 为 null 或 '' 的订单: 无
select * from order_product_out where out_code is null and out_code = '';

# 【采购退货】 - 无 订单号 字段

# 【库存盘点】 - order_product_change
#### 处理有 26、28 位的盘点数据
select distinct length(check_code) from order_product_change where check_code is not null and check_code != '' and length(check_code) != @order_length;
#### 更新
update order_product_change
set check_code = concat(substring(check_code,1, 12), substring(check_code, length(check_code)-8+1, 6))
where length(check_code) = 26;
update order_product_change
set check_code = concat(substring(check_code,3, 12), substring(check_code, length(check_code)-8+1, 6))
where length(check_code) = 28;
# 为 null 或 '' 的订单: 无
select * from order_product_change where check_code is null and check_code = '';

# 【新增收入】 - customer_money_in
#### 处理有 26 位的收入数据
select distinct length(order_id) from customer_money_in where length(order_id) != @order_length;
#### 更新
update customer_money_in
set order_id = concat(substring(order_id,1, 12), substring(order_id, length(order_id)-8+1, 6))
where length(order_id) = 26;
# 为 null 或 '' 的订单: 无
select * from customer_money_in where order_id is null and order_id = '';

# 【新增支出】 - customer_money_out
#### 处理有 26、28 位的支出数据
select distinct length(order_id) from customer_money_out where length(order_id) != @order_length;
#### 更新
update customer_money_out
set order_id = concat(substring(order_id,1, 12), substring(order_id, length(order_id)-8+1, 6))
where length(order_id) = 26;
update  customer_money_out
set order_id = concat(substring(order_id,3, 12), substring(order_id, length(order_id)-8+1, 6))
where length(order_id) = 28;
# 为 null 或 '' 的订单: 无
select * from customer_money_out where order_id is null and order_id = '';


# 【会员卡消费】 - member_card_xiaofei
#### 处理有 15 位的支出数据
select distinct length(consume_code) from member_card_xiaofei where length(consume_code) != @order_length;
#### 更新
update member_card_xiaofei
set consume_code = concat(consume_code, substring(consume_code, length(consume_code)-3+1, 3))
where length(consume_code) = 15;

# 2016-12-03 17:49

########  是否还有未处理的数据 - start

/*

set @order_length = 18;
select distinct length(orderid) from ai9me_product_cart where orderid is not null and orderid != '' and length(orderid) != @order_length;
select distinct length(orderid) from dsqgrecord where orderid is not null and orderid != '' and length(orderid) != @order_length;
select distinct length(orderid) from customer_sms_recharge where orderid is not null and orderid != '' and length(orderid) != @order_length;
select distinct length(order_code) from order_billing where order_code is not null and order_code != '' and length(order_code) != @order_length;
select distinct length(in_code) from order_product_in where in_code is not null and in_code != '' and length(in_code) != @order_length;
select distinct length(out_code) from order_product_out where out_code is not null and out_code != '' and length(out_code) != @order_length;
select distinct length(check_code) from order_product_change where check_code is not null and check_code != '' and length(check_code) != @order_length;
select distinct length(order_id) from customer_money_in where length(order_id) != @order_length;
select distinct length(order_id) from customer_money_out where length(order_id) != @order_length;
select distinct length(consume_code) from member_card_xiaofei where length(consume_code) != @order_length;



set @order_length = 18;
select * from ai9me_product_cart where orderid is null and orderid = '';
select * from dsqgrecord where orderid is null and orderid = '';
select * from customer_sms_recharge where orderid is null and orderid = '';
select * from order_billing where order_code is null and order_code = '';
select * from order_product_in where in_code is null and in_code = '';
select * from order_product_out where out_code is null and out_code = '';
select * from order_product_change where check_code is null and check_code = '';
select * from customer_money_in where order_id is null and order_id = '';
select * from customer_money_out where order_id is null and order_id = '';
select * from member_card_xiaofei where consume_code is null and consume_code = '';

*/

########  是否还有未处理的数据 - end
