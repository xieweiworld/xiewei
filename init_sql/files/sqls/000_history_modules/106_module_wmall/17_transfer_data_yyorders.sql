# 初始化数据

# 商城新版业务

# 2017-04-01

# 不用转服务项目，预约已经是使用的商户统一管理的服务项目了

# 预约订单: 预约项目订单(yyfw_records) => 新版商城预约类订单(wmall_order.type=2)
# order_code 按 以下规则计算
# concat(date_format(created_at,'%y%m%d%H%i%s'), lpad(substring(round(rand() * (pow(10, 20))), 1, 6), 6, 0))
# 先更新 order_code
/*
update yyfw_records
set order_code = concat(date_format(created_at,'%y%m%d%H%i%s'), lpad(substring(round(rand() * (pow(10, 20))), 1, 6), 6, 0))
where wid > 0 and shift_status = 0 and order_code = '';
*/

# 转入数据
insert into wmall_order(source_id, wid, order_code, order_type, type_id, wxid, wid_wxid, mid, is_chinalife, name, mobile, cpai, address, remark, is_expired, expiring_at, expired_at, expire_reason, service_id, shop_id, reserve_date, reserve_state, period1, period2, is_paid, verify_code, is_verified, verified_id, verified_at, verified_by, introducer_id, is_bill, billing_id, billing_time, is_discuss, status, is_pmall, order_date, duration, finished_at, is_arrived_shop, arrived_shop_at, express_mode, express_at, express_name, express_code, pick_date, pick_remark, is_delete, add_date, add_by)
select
id as source_id, wid, 
concat(date_format(created_at,'%y%m%d%H%i%s'), lpad(substring(round(rand() * (pow(10, 20))), 1, 6), 6, 0)) as order_code,
2 as order_type, 0 as type_id, ifnull(wxid, '') as wxid, ifnull(wid_wxid, '') as wid_wxid, ifnull(mid, 0) as mid, 
0 as is_chinalife, ifnull(name, '') as name, ifnull(mobile, '') as mobile, ifnull(cpai, '') as cpai, '' as address, remark, 
0 as is_expired, null as expiring_at, null as expired_at, 0 as expire_reason, ifnull(ser2, 0) as service_id, ifnull(lbsid, 0) as shop_id, date_format(dated_at, '%Y-%m-%d') as reserve_date, 
(case when status in (1,2) then 1 when status = -1 then 2 else 0 end) as reserve_state, 
'09:00:00' as period1, '18:00:00' as period2, 0 as is_paid, '' as verify_code, 
#(case when status in (1,2) then lpad(substring(round(rand() * (pow(10, 20))), 1, 8), 8, 0) else '' end) as verify_code, 
# (lpad(substring(round(rand() * (pow(10, 20))), 1, 8), 8, 0)) as verify_code, 
(case when status = 2 then 1 else 0 end) as is_verified, 
(case when status = 2 then lbsid else 0 end) as verified_id, 
(case when status = 2 then date_add(dated_at, interval 5 day) else null end) as verified_at, 0 as verified_by, 
0 as introducer_id, 0 as is_bill, 0 as billing_id, null as billing_time, 0 as is_discuss, 
(case when status = 1 then 1 when status = 2 then 9 else 0 end) as status, 0 as is_pmall, created_at as order_date, 0 as duration, 
(case when status = 2 then date_add(dated_at, interval 5 day) else null end) as finished_at, 
(case when status = 2 then 1 else 0 end) as is_arrived_shop, 
(case when status = 2 then date_add(dated_at, interval 5 day) else null end) as arrived_shop_at, 
0 as express_mode, null as express_at, '' as express_name, 0 as express_code,  null as pick_date,  '' as pick_remark,
(case when status < 0 then 1 else 0 end) as is_delete, created_at as add_date, 'transfer' as add_by
from yyfw_records
where wid > 0 and shift_status = 0;

# 预约服务：转入到预约订单服务表中： yyfw_records => wmall_order_service
insert into wmall_order_service(wid, order_id, order_code, product_id, service_id, service_name, sale_price, add_date, add_by)
select
y.wid, o.id as order_id, o.order_code, 0 as product_id, ifnull(ser2, 0) as service_id, ifnull(y.service, '') as service_name, ifnull(s.sale_price, 0) as sale_price, created_at as add_date, 'transfer' as add_by
from yyfw_records y inner join wmall_order o on y.wid = o.wid and y.id = o.source_id
left join customer_services s on y.wid = s.wid and y.ser2 = s.id
where y.wid > 0 and y.shift_status = 0;


# 、更新旧表：转换完成，更新旧表标记
update yyfw_records
set shift_status = 2
where wid > 0 and shift_status = 0;


# 2017-04-01

select '17' as 'Index', 'Transfer YY Orders' as 'Title', 'Done' as 'Status';
