# 调整数据

# 单次升级的过程中，允许多次执行本脚本

# 从新版商城开始到新版商城正式发布前，已发布到正式库中的脚本汇总

# 2017-05-18

##################################

# 2016-10-20

# 初始化 service_detail
update order_billing o inner join
(select wid, order_id, group_concat(distinct service_name) as detail
from order_service 
group by wid, order_id
having detail is not null and detail != '') t
on o.wid = t.wid and o.id = t.order_id
set o.service_detail = t.detail
where t.detail != '' and t.detail is not null;

# 初始化 product_detail
update order_billing o inner join
(select o.id,
group_concat(concat(s.product_name, '(', case when s.product_code is null or s.product_code = '' then '无' else s.product_code end, ')', '*', s.amount) separator '\r') as detail
from order_billing o
left join (
select wid, order_id, product_code, product_name, product_model, sum(amount) as amount
from order_product_expense
group by wid, order_id, product_code, product_name, product_model
) s on o.wid = s.wid and o.id = s.order_id
group by o.id
having detail is not null and detail != '') t on o.id = t.id
set o.product_detail = t.detail
where t.detail != '' and t.detail is not null;


##################################


# 2016-12-02

# 一、配件编码为空的：按 id+wid 补上
update order_product set product_code = concat(id, wid) where wid > 0 and (product_code is null or product_code = '');
update order_product_in_detail set product_code = concat(id, wid) where wid > 0 and (product_code is null or product_code = '');
update order_product_out_detail set product_code = concat(id, wid) where wid > 0 and (product_code is null or product_code = '');
update order_product_return_detail set product_code = concat(id, wid) where wid > 0 and (product_code is null or product_code = '');
update order_product_change_detail set product_code = concat(id, wid) where wid > 0 and (product_code is null or product_code = '');

# 二、清除319的数据 => -319，但是配件表库存清0，正式平台，wid=319的是公司的测试商户(ycf测试号),登录账号: test0
# 319-开始

set @wid_clear = 319;

update order_product_in
set wid = -wid, supplier_id = -supplier_id, is_delete = 1
where wid = @wid_clear;

update order_product_in_detail
set wid = -wid, product_id = -product_id, product_brand = -product_brand, is_delete = 1
where wid = @wid_clear;

update order_product_out
set wid = -wid, is_delete = 1
where wid = @wid_clear;

update order_product_out_detail
set wid = -wid, out_order_id = -out_order_id, product_id = -product_id, product_brand = -product_brand, is_delete = 1
where wid = @wid_clear;

update order_product_return
set wid = -wid, in_order_id = -in_order_id, supplier_id = -supplier_id
where wid = @wid_clear;

update order_product_return_detail
set wid = -wid, return_id = -return_id, /*in_detail_id = -in_detail_id,*/ product_ID = -product_ID
where wid = @wid_clear;

update order_product_change
set wid = -wid
where wid = @wid_clear;

update order_product_change_detail
set wid = -wid, check_id = -check_id, product_id = -product_id, product_brand = -product_brand
where wid = @wid_clear;

update order_billing
set wid = -wid, mid = -mid, is_delete = 1
where wid = @wid_clear;

update order_service
set wid = -wid, is_delete = 1
where wid = @wid_clear;

update order_product_expense
set wid = -wid, is_delete = 1, product_id = -product_id
where wid = @wid_clear;

update order_charge
set wid = -wid, mid = -mid, is_delete = 1
where wid = @wid_clear;

update order_charge_detail
set wid = -wid, mid = -mid, is_delete = 1, order_id = -order_id
where wid = @wid_clear;

update order_charge_repay
set wid = -wid, mid = -mid, is_delete = 1
where wid = @wid_clear;

### update order_supplier set is_delete = 1,  wid = -@wid_clear where wid = @wid_clear;

update customer_money_out
set is_delete = 1,  wid = -@wid_clear
where wid = @wid_clear and out_type in (1,2);

update order_product
set amount = 0, usable_amount = 0
where wid = @wid_clear;

# 319-结束

# 三、更新 out_detail_id 为 0 的配件消费表中 out_detail_id 值

# 初始化 out_detail_id，基本条件：配件表(out_detail_id=0,未删除[0])，开单表(消费开单类型[1],已出库[1],未删除[0])
# 购买商品(4)的另行处理
# 查询需要填充 out_detail_id 的数据：order_product_expense
select * from order_product_expense pe inner join order_billing ob on pe.wid = ob.wid and pe.order_id = ob.id
where 
    pe.wid > 0 and pe.out_detail_id = 0 and pe.is_delete = 0
and ob.wid > 0 and ob.order_type = 1 and ob.is_cash = 1 and ob.is_out = 1 and ob.is_delete = 0
and date(now()) = '2016-12-06'
;

# 更新 order_product_expense.out_detail_id
update order_product_expense pe 
#
# select distinct pe.id, pe.wid, pe.product_id, pe.out_detail_id, pe.order_id, po.out_typeid, pod.out_order_id, pod.id as outdetailid, pod.product_id from order_product_expense pe 
#
inner join order_billing ob on pe.wid = ob.wid and pe.order_id = ob.id
inner join order_product_out po on pe.wid = po.wid and pe.order_id = po.out_typeid
inner join order_product_out_detail pod on po.wid = pod.wid and po.id = pod.out_order_id and pe.product_id = pod.product_id
set pe.out_detail_id = pod.id
where
    pe.wid > 0 and pe.out_detail_id = 0 and pe.is_delete = 0
and ob.wid > 0 and ob.order_type = 1 and ob.is_out = 1 and ob.is_delete = 0
and po.out_type = 1
and pod.out_order_id is not null and pod.is_delete = 0
and date(now()) = '2016-12-06'
;

##################################

# 2017-01-07

# 国寿新业务需要求 - 2017-01-07 新增脚本

# 多辆车数据？暂以记在第一车辆上面为主   <=  目前没有会员是多辆车的数据 [2017-01-07]

# 1. 补上车辆的保险时间：bx_time, next_bxtime，以导入时间为主
# 源表: member_auto
# 目标表: member_auto

update member_auto
set bxtime = add_date
where wid = 1142 and bxtime is null;

update member_auto
set next_bxtime =  date_add(bxtime, interval 1 year)
where wid = 1142 and next_bxtime is null and bxtime is not null;

# 2. 原会员积分数据 转入到 车辆年度积分表中
# 源表: chinalife_member, member_auto
# 目标表: chinalife_car_credit
# 注意：不加上会员表，因会员表中的车牌是冗余的多车牌信息
insert into chinalife_car_credit(wid, mid, car_id, year, cpai, enabled_at, expired_at, total_price, total_credit, remain_price, remain_credit, add_date, add_by, update_date, update_by)
select 
	c.wid, c.mid, a.id as car_id, year(a.bxtime) as year, a.cpai,
	c.enabled_at, c.expired_at,
	total_amount as total_price,
	total_credits as total_credit,
	amount as remain_price,
	credits as remain_credit,
    c.add_date, a.add_by, c.update_date, a.update_by
from chinalife_member c
inner join member_auto a on c.wid = a.wid and c.mid = a.mid
# inner join member_base m on m.wid = c.wid and m.cpai = a.cpai
where c.wid = 1142;


# 3. 车辆年度积分 转入到 消费记录表中（导入）
# 源表: chinalife_car_credit, member_base, chinalife_member
# 目标表: chinalife_credit_history
insert into chinalife_credit_history(wid, lbsid, mid, type, year, credit_id, order_id, order_code, cpai, mobile, name, price, credit, add_date, add_by)
select
     c.wid, cm.agency as lbsid, c.mid, 1 as type, c.year, c.id as credit_id, 
	 0 as order_id, '' as order_code, c.cpai as cpai, m.tel as mobile, m.name, 
	 cm.total_amount as price, cm.total_credits as credit, c.add_date, c.add_by
 from chinalife_car_credit c
	inner join member_base m on c.wid = m.wid and c.mid = m.id
	inner join chinalife_member cm on cm.wid = m.wid and cm.mid = m.id
 where c.wid = 1142;


# 4. 订单消费积分 转入到 消费记录表中（消费）
# 源表: dsqgrecord, chinalife_car_credit, member_base, chinalife_member
# 目标表: chinalife_credit_history
insert into chinalife_credit_history(wid, lbsid, mid, type, year, credit_id, order_id, order_code, cpai, mobile, name, price, credit, add_date, add_by)
select
     m.wid, cm.agency as lbsid, d.mid, 2 as type, c.year, c.id as credit_id, 
	 d.id as order_id, d.orderid as order_code, d.cpai as cpai, d.tel as mobile, d.name, 
	 d.actual_price as price, d.actual_credits as credit, d.pay_time as add_date, '' as add_by
 from dsqgrecord d
	inner join member_base m on m.wid = 1142 and d.mid = m.id
	inner join chinalife_member cm on cm.wid = m.wid and cm.mid = m.id
	inner join chinalife_car_credit c on c.wid = m.wid and c.mid = m.id and d.cpai = c.cpai
 where c.wid = 1142;



##################################


# 将CRM客户中有合同或有联系记录的网络注册客户，将 is_approve 设置为 1   --  已发布
# SELECT cc.id, s.customer_code, s.uid, s.wid, s.t_id, s.r_id FROM
update 
crm_customer cc inner join
(
	SELECT c.customer_code,c.uid,c.wid, count(t.id) t_id , count(r.id) r_id
	FROM crm_customer c
	left JOIN crm_contract t ON c.customer_code = t.customer_id
	left JOIN crm_contact_record r on c.customer_code = r.customer_id 
	WHERE c.customer_level = 8 and c.is_approve = 0
	GROUP BY customer_code
	having t_id > 0 or r_id > 0
) s on cc.customer_code = s.customer_code
set cc.is_approve = 1
WHERE cc.is_approve = 0;


##################################

# 同步下数据
update user set mp_name = short_name where mp_name is null or mp_name = '';

# 添加上默认的合作协议积分值：90000
# update chinalife_integral set maxcredit = 90000 where maxcredit < 90000;

# 2017-02-09
# 单次升级的过程中，允许多次执行本脚本

# 2017-03-17

# 0、车之翼（3035）、深荣昌（1789） 要关闭 无配件开单 开关，发布后手动调整
# 0、车之翼（3035） 要开启 扣卡开单 开关，发布后手动调整


# 1、初始化退货单号: return_code，按退货时间(12位) + 随机数(6位)来初始化成 18 位
update order_product_return
set return_code = concat(date_format(return_time,'%y%m%d%H%i%s'), lpad(substring(round(rand() * (pow(10, 20))), 1, 6), 6, 0))
where return_code is null or return_code = '';


# 2、初始化(车之翼)服务项目：是否支持流程控制
update customer_services
set is_process = 1, process_steps = 2
where is_process = 0
and wid = 3035 and id in (25678, 25722, 25740, 25796);  	## 正式的
#and wid = 236 and name like '%流程%';	## 开发的(以含'流程‘字样为准)
#and wid = 500 and name like '%流程%';	## 测试的(以含'流程‘字样为准)


# 3、初始化车之翼的服务项目流程：流程提成使用默认值(0)（单服务多列流程）
set @process_name10 = '洗车';
set @process_name20 = '干车';
insert into customer_services_process(wid, service_id, process_name10, process_name20, reward_amount10, reward_amount20, add_date, add_by)
select cs.wid, cs.id as service_id, @process_name10 as process_name10, @process_name20 as process_name20, 0 as reward_amount10, 0 as reward_amount20, now() as add_date, 'init' as add_by
#, csp.id
from customer_services cs left join customer_services_process csp
on cs.wid = csp.wid and cs.id = csp.service_id
where 
pid = 451 and cs.is_delete = 0 and (csp.id is null or csp.id = 0)
and cs.wid = 3035 and cs.id in (25678, 25722, 25740, 25796);  	## 正式的
#and cs.wid = 236 and cs.name like '%流程%';	## 开发的(以含'流程‘字样为准)
#and cs.wid = 500 and cs.name like '%流程%';	## 测试的(以含'流程‘字样为准)

# select * from customer_services cs where  cs.wid = 500 and cs.name like '%流程%';


# 因开单表添加source字段，做数据初始化
# order_type: 1,2,3,4，直接用 order_type 初始化到 source
update order_billing
set `source` = order_type
where wid > 0 and `source` = 0;


# 2017-04-12
#1、已有商户级别添加上权限：'Billings/CustomerServices','服务项目管理'
update sys_level_right set right_code = 'Billings/CustomerServices' where right_code = 'Billings/ServiceList';

#2、已经添加了旧权限的，经统一更新为新的权限： 'Billings/ServiceList','服务项目设置'  =>  'Billings/CustomerServices','服务项目管理'
update customer_role_right set right_code = 'Billings/CustomerServices' where right_code = 'Billings/ServiceList';


##################################

# 单次升级的过程中，允许多次执行本脚本

# 2017-03-28

###################################################
################# 电话、营业时间初始化
###################################################

# customer_contact.mobile 是必填的，但也会有空的数据

# 1. 初始化: 商户电话(uer.telephone)，来源CRM联系人手机(crm.customer_contact.phone,无值则取mobile)
# select t.id, (case when t.phone is null or t.phone = '' then  replace(replace(t.mobile, '?', ''), '无', '') else t.phone end) as mobile, t.phone, c.wid, c.uid, u.telephone, u.tel from
 update
user u
inner join crm_customer c on c.uid = u.id
inner join crm_customer_contact t on t.customer_code = c.customer_code
inner join (select min(id) as id, customer_code from crm_customer_contact group by customer_code) tt on t.id = tt.id
 set u.telephone =  (case when t.phone is null or t.phone = '' then  replace(replace(t.mobile, '?', ''), '无', '') else t.phone end)
where c.uid > 0 and t.mobile is not null and replace(replace(t.mobile, '?', ''), '无', '') != '' and (u.telephone is null or u.telephone = '');

# 2、 初始化: 门店电话(lbs.tel)，来源CRM联系人手机(crm.customer_contact.mobile)
# select t.id, (case when t.phone is null or t.phone = '' then  replace(replace(t.mobile, '?', ''), '无', '') else t.phone end) as mobile, t.phone, l.wid, l.uid, l.tel, l.mtel from
 update
lbs l
inner join crm_customer c on c.uid = l.uid
inner join crm_customer_contact t on t.customer_code = c.customer_code
inner join (select min(id) as id, customer_code from crm_customer_contact group by customer_code) tt on t.id = tt.id
 set l.tel =  (case when t.phone is null or t.phone = '' then  replace(replace(t.mobile, '?', ''), '无', '') else t.phone end)
where c.uid > 0 and t.mobile is not null and replace(replace(t.mobile, '?', ''), '无', '') != '' and (l.tel is null or l.tel = '');


# 2. 初始化: 营业时间
# 开始时间 => 09:00
update user set start_at = '09:00' where start_at is null;
# 结束时间 => 18:00
update user set end_at = '18:00' where end_at is null;

# 2017-03-28


##################################

# 2017-04-25

# 删除商户的旧的会员积分权限

set @publish_day = '2017-04-25';

delete from sys_level_right where right_code = 'HYCredit' and date_format(now(), '%Y-%m-%d') = @publish_day;
delete from customer_role_right where right_code = 'HYCredit' and date_format(now(), '%Y-%m-%d') = @publish_day;

select '03_update_data Finished' as 'DONE';

# 2017-04-25


##################################


# 2017-04-26

# 修改订单服务表operator默认值
update order_service set operator = '' where operator = '0';

# 车之翼(3035)、深荣昌(1789)添加新领料人: 商场部
# call __proc__add_virtual_user_staff(3035, '商场部');
# call __proc__add_virtual_user_staff(1789, '商场部');


##################################


# 单次升级的过程中，可重复运行此文件

# 2017-05-10

# 1、初始化会员车辆积分表的lbsid: chinalife_member.agency => chinalife_car_credit.lbsid
update 
chinalife_car_credit c inner join chinalife_member m on c.wid = m.wid and c.mid = m.mid
set c.lbsid = m.agency
where c.lbsid = 0;

# 2、初始化会员车辆积分历史表lbsid: chinalife_car_credit.lbsid => chinalife_credit_history.lbsid
update
chinalife_credit_history h inner join chinalife_car_credit c on h.wid = c.wid and h.mid = c.mid
set h.lbsid = c.lbsid
where h.lbsid = 0;

# 2017-05-10

##################################


# 单次升级的过程中，可重复运行此文件

# 2017-05-11

# 将商户中相同订单，相同项目，相同类型的人员合并后更新到同组人员字段中（只处理未删除的数据）
#select * from
	update
order_service_operator s inner join (
select wid, order_service_id, service_id, operator_type, group_concat(operator_id) as operator_ids
from order_service_operator
where is_delete = 0
group by wid, order_service_id, service_id, operator_type) t
on s.wid = t.wid and s.order_service_id = t.order_service_id and s.service_id = t.service_id and s.operator_type = t.operator_type
	set s.operator_ids = t.operator_ids
where s.is_delete = 0 and s.operator_ids = '';

# 2017-05-11


##################################


# 2017-05-18

select '03' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';
