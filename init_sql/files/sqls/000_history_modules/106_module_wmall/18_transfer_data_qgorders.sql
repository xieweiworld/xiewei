# 初始化数据

# 商城新版业务

# 写入到 wmall_order_product (595.023 sec)、wmall_order_service (590.847 sec) 将耗费各 近10分钟 时间
# 2017-03-31

# 服务项目类商品: fuwulist => wmall_product + wmall_product_image + wmall_product_service
  #  此部分应由 14_transfer_data_services.sql 文件完成服务项目类商品的转换: dsqgrecord.dsqgid <==> fuwulist.id
# 抢购订单: dsqgrecord => wmall_order + wmall_order_payinfo + wmall_order_product + wmall_order_service

# 1、dsqgrecord => wmall_order (order_type=13)
# source_id 先记为 dsqgrecord.id
# type_id 先记为 dsqgrecord.dsqgid = fuwulist.id
# buy_from_sid 不转
# introducer_id 抢购订单无此数据
# statue=2的 # 按22处理，无订单号，无支付信息, 全是2015年9月23日前的订单；最后用99表示未知状态(应该要无此数据的)
# state=3 => is_verified = 1

#   先初始化下无订单号的 orderid 生成 18 位订单号
update dsqgrecord
set orderid = concat(date_format(from_unixtime(ctime),'%y%m%d%H%i%s'), lpad(substring(round(rand() * (pow(10, 20))), 1, 6), 6, 0))
where wid > 0 and shift_status = 0 and (orderid is null or orderid = '');
# 再转入订单主数据
set @order_type = 1; # 1商品,13是服务项目类商品 商城订单
insert into wmall_order(wid, source_id, order_code, order_type, type_id, wxid, wid_wxid, mid, is_chinalife, name, mobile, cpai, address, remark, is_expired, expiring_at, expired_at, expire_reason, service_id, shop_id, reserve_date, reserve_state, period1, period2, is_paid, verify_code, is_verified, verified_id, verified_at, verified_by, introducer_id, is_bill, billing_id, billing_time, is_discuss, status, is_pmall, order_date, duration, finished_at, is_arrived_shop, arrived_shop_at, express_mode, express_at, express_name, express_code, pick_date, pick_remark, is_delete, add_date, add_by)
select 
wid, id as source_id, orderid as order_code, @order_type as order_type, ifnull(dsqgid, 0) as type_id, 
ifnull(wxid, '') as wxid, '' as wid_wxid, mid, (case when payment = 7 then 1 else 0 end) as is_chinalife, ifnull(name, '') as name, ifnull(tel, '') as mobile, ifnull(cpai, '') as cpai,  '' as address, ifnull(remark, '') as remark, 
(case when state = -1 then 1 else 0 end) as is_expired, (case when expiring_at > 0 then from_unixtime(expiring_at) else NULL end) as expiring_at, expired_at, (case when state = -1 then 3 else 0 end) as expire_reason, ifnull(ser2, 0) as service_id, ifnull(lbsid, 0) as shop_id, 
null as reserve_date, 0 as reserve_state, null as period1, null as period2, (case when state > 0 then 1 else 0 end) as is_paid, 
ifnull(code, '') as verify_code, (case when state = 3 then 1 else 0 end) is_verified, ifnull(finished_by, 0) as verified_id, finished_at as verified_at, 0 as verified_by, 
0 as introducer_id, 0 as is_bill, 0 as billing_id, null as billing_time, 0 as is_discuss, 
(case when state = -1 then -1 when state = 0 then 0 when state = 1 then 1 when state = 2 then 22 when state = 3 then 9 when state = 4 then 6 else 99 end) as status, 0 as is_pmall,
from_unixtime(ctime) as order_date, 0 as duration, finished_at, (case when state = 3 then 11 else 0 end) as is_arrived_at, finished_at as arrived_shop_at,
0 as express_mode, null as express_at, '' as express_name, '' as express_code, null as pick_date, '' as pick_remark, isdelete as is_delete, from_unixtime(ctime) as add_date, 'transfer' as add_by
from dsqgrecord
where wid > 0 and shift_status = 0;

# 5、要先更新数据，然后转其他的数据？？？：mid => name, mid => cpai, dsqgid => ser2
# 无wxid，有mid: wid > 0 and mid > 0 and state > 0 and isdelete = 0 and (wxid is null or wxid = '') 3条左右2015年10月数据
# 无tel, 有mid:  wid > 0 and state > 0 and isdelete = 0 and mid > 0 and (tel is null or tel = '') 3条左右2015年11月数据
# 无name，有mid： wid > 0 and state > 0 and isdelete = 0 and mid > 0 and (name is null or name = '') >1289条
# 无cpai, 有mid: wid > 0 and state > 0 and isdelete = 0 and mid > 0 and (cpai is null or cpai = '')  >2739条,2017年3月的也有数据
# 无ser2, 有dsqgid: wid > 0 and state > 0 and isdelete = 0 and ser2 = 0 and dsqgid != 0  >6132条，还有2017年3月的数据
# 无wid_wxid字段: 旧数据不处理


# 2、dsqgrecord => wmall_order_payinfo
# payment:  # 0, 1, 2, 3, 7
# 转入时积分比例是按1:1计算的
insert into wmall_order_payinfo(wid, order_id, order_code, receiver, out_trade_no, wx_attach, product_price, paid_credits, credit_price, weixin_price, order_price, paid_price, discount_price, reward_price, coupon_price, coupon_id, vcard_price, mcard_price, express_price, payment, is_paid, paid_at, is_delete, add_date, add_by)
select 
wo.wid, wo.id as order_id, wo.order_code, ifnull(receiver, 0) as receiver, ifnull(out_trade_no, '') as out_trade_no, '' as wx_attach, 
jiage as product_price, actual_credits as paid_credits, actual_credits as credit_price,
(case when dr.payment = 0 or dr.payment = 6 then actual_price else 0 end) as weixin_price,
jiage as order_price, actual_price as paid_price, coupon_price as discount_price, coupon_price as reward_price, coupon_price as coupon_price, 0 as coupon_id, 
(case when dr.payment = 3 then actual_price else 0 end) as vcard_price, 0 as mcard_price, 0 as express_price, 
(case when dr.payment = 0 or dr.payment = 6 then 4 when dr.payment = 1 or dr.payment = 2 then 9 when dr.payment = 3 then 5 when dr.payment = 7 then 8 else 99 end) as payment, 
(case when dr.state > 0 then 1 else 0 end) is_paid, 
ifnull(pay_time, (case when dr.state > 0 then from_unixtime(dr.ctime) else NULL end)) as paid_at, 
dr.isdelete as is_delete, from_unixtime(dr.ctime) as add_date, 'transfer' as add_by 
from wmall_order wo
inner join dsqgrecord dr on wo.wid = dr.wid and wo.order_code = dr.orderid and wo.source_id = dr.id
# left join wmall_product wp on wo.wid = wp.wid and dr.dsqgid = wp.source_id
where wo.order_type = @order_type and dr.wid > 0 and dr.shift_status = 0;

# 3、dsqgrecord => wmall_order_product
set @order_type = 1; # 1商品,13是服务项目类商品 商城订单
insert into wmall_order_product(source_id, wid, order_id, order_code, product_id, product_name, product_type, main_pic, has_service, has_attach, sale_price, origin_price, amount, car_brand, car_model, is_install, express_mode, add_date, add_by)
select 
dr.id as source_id, wo.wid, wo.id as order_id, wo.order_code, ifnull(wp.id, 0) as product_id, ifnull(wp.name, ifnull(cs.name, '')) as product_name, ifnull(wp.type, 3) as product_type, ifnull(wp.main_pic, '') as main_pic,
1 as has_service, 0 as has_attach, dr.jiage as sale_price, ifnull(wp.origin_price, dr.jiage) as origin_price, 1 as amount, 
0 as car_brand, 0 as car_model, 0 as is_install, 0 as express_mode, from_unixtime(ctime) as add_date, 'transfer' as add_by
from wmall_order wo
inner join dsqgrecord dr on wo.wid = dr.wid and wo.order_code = dr.orderid and wo.source_id = dr.id
left join wmall_product wp on wo.wid = wp.wid and dr.dsqgid = wp.source_id
left join customer_services cs on wo.wid = cs.wid and dr.ser2 = cs.id
where wo.order_type = @order_type and dr.wid > 0 and dr.shift_status = 0;

# 2017-05-02 接下一个文件

# 2017-05-02 接上一个文件

# 4、dsqgrecord => wmall_order_service
insert into wmall_order_service(wid, order_id, order_code, product_id, service_id, service_name, origin_price, sale_price, add_date, add_by)
select
wo.wid, wo.id as order_id, wo.order_code, ifnull(wp.id, 0) as product_id, ifnull(wp.attach_id, 0) as service_id, ifnull(wp.name, ifnull(cs.name, '')) as service_name, 
dr.jiage as origin_price, dr.jiage as sale_price, from_unixtime(ctime) as add_date, 'transfer' as add_by
from wmall_order wo
inner join dsqgrecord dr on wo.wid = dr.wid and wo.order_code = dr.orderid and wo.source_id = dr.id
left join wmall_product wp on wo.wid = wp.wid and dr.dsqgid = wp.source_id
left join customer_services cs on wo.wid = cs.wid and dr.ser2 = cs.id
where wo.order_type = @order_type and dr.wid > 0 and dr.shift_status = 0;


# 6、把服务项目类商品的 attach_id 置为0
update wmall_product
set attach_id = 0
where wid > 0 and attach_id > 0 and type = 3;

# 7、更新服务项目类商品的库存数量（ctime/add_date, 2017-04-01 00:00:00）
#1、今年4月份之后没有抢购订单的(非国寿积分商品)抢购商品，库存初始为0；
#2、今年4月份之后有抢购订单的(非国寿积分商品)抢购商品。库存初始为99；
#3、凡是国寿积分商品，库存都初始为999；
#4、其他的为0
#汇总后即：默认库存为0，国寿积分类商品为999(转商品时直接写入)，4-1后有抢购订单的非积分类项目商品库存为99。
set @product_type = 3;
set @start_date = '2017-04-01 00:00:00';
set @product_amount = 99;
# 更新库存
update wmall_product p
inner join
(select distinct wp.id, wp.wid
from wmall_product wp
inner join wmall_order_product wop on wp.wid = wop.wid and wp.id = wop.product_id
where wp.type = @product_type and wp.is_chinalife = 0 and wp.add_date >= @start_date) t 
on p.wid = t.wid and p.id = t.id
set p.amount = @product_amount
where p.amount = 0;

# 更新转换字段状态
update dsqgrecord
set shift_status = 2
where wid > 0 and shift_status = 0;

# 2017-03-31

select '18' as 'Index', 'Transfer QG Records' as 'Title', 'Done' as 'Status';
