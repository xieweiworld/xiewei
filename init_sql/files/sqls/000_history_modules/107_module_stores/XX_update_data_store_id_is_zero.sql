# 初始化数据

####################################
## 本文件整体允许连续重复执行
####################################


set @business = '处理门店ID为0的数据';
set @start_at = '2017-07-28 20:20:00';

####################################  备份数据：先查询下本次的数据
create table if not exists order_supplier_201708011930 select * from order_supplier where wid > 0 and store_id = 0 and add_date > @start_at;
create table if not exists order_brand_201708011930 select * from order_brand where wid > 0 and store_id = 0 and add_date > @start_at;

create table if not exists order_product_in_201708011930 select * from order_product_in where wid > 0 and store_id = 0 and add_date > @start_at;
create table if not exists order_product_in_detail_201708011930 select * from order_product_in_detail where wid > 0 and store_id = 0 and add_date > @start_at;

create table if not exists order_billing_201708011930 select * from order_billing where wid > 0 and lbs_id = 0 and add_date > @start_at;
create table if not exists order_product_expense_201708011930 select * from order_product_expense where wid > 0 and store_id = 0 and add_date > @start_at;
create table if not exists order_product_expense_code_201708011930 select * from order_product_expense_code where wid > 0 and store_id = 0 and add_date > @start_at;

create table if not exists customer_money_out_201708011930 select * from customer_money_out where wid > 0 and store_id = 0 and add_date > @start_at;

####################################  查询数据：先查询下本次的数据
select * from order_supplier where wid > 0 and store_id = 0 and add_date > @start_at;
select * from order_brand where wid > 0 and store_id = 0 and add_date > @start_at;

select * from order_product_in where wid > 0 and store_id = 0 and add_date > @start_at;
select * from order_product_in_detail where wid > 0 and store_id = 0 and add_date > @start_at;

select * from order_billing where wid > 0 and lbs_id = 0 and add_date > @start_at;
select * from order_product_expense where wid > 0 and store_id = 0 and add_date > @start_at;
select * from order_product_expense_code where wid > 0 and store_id = 0 and add_date > @start_at;

select * from customer_money_out where wid > 0 and store_id = 0 and add_date > @start_at;


# 2017-08-01

####################################  加索引：先添加索引，后面再删除
alter table order_supplier add index `idx_order_supplier_add_by` USING BTREE (`add_by` ASC);
alter table order_brand add index `idx_order_brand_add_by` USING BTREE (`add_by` ASC);

alter table order_billing add index `idx_order_billing_receive_by` USING BTREE (`receive_by` ASC);
alter table order_billing add index `idx_order_billing_add_by` USING BTREE (`add_by` ASC);
alter table order_product_in add index `idx_order_product_in_add_by` USING BTREE (`add_by` ASC);
alter table order_product_in_detail add index `idx_order_product_in_detail_add_by` USING BTREE (`add_by` ASC);

alter table order_product_expense add index `idx_order_product_expense_add_by` USING BTREE (`add_by` ASC);
alter table order_product_expense_code add index `idx_order_product_expense_code_add_by` USING BTREE (`add_by` ASC);


####################################  查询数据：存储下最小门店数据
# 存储下最小门店数据临时表
# select * from __tmp_min_store_ids_from_lbs__;
drop table if exists __tmp_min_store_ids_from_lbs__;
create table if not exists __tmp_min_store_ids_from_lbs__
select wid, min(id) as min_id, count(id) as total
from lbs
where type = 2 and wid > 0 and is_delete = 0
group by wid;


####################################  初始化：更新相关数据表中的门店ID为0的记录
####################################  初始化：业务数据所属门店 => 以新增人优先，后最小门店id
# 供应商表: order_supplier.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_supplier w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_supplier w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;


# 配件品牌表: order_brand.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_brand w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_brand w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;


# 资金支出表: customer_money_out.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
customer_money_out w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
customer_money_out w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;


####################################  初始化：业务数据所属门店 => 以业务人优先，新增人其次，后最小门店id
# 入库单	order_product_in.store_id
# [先业务人]
#select pi.id, pi.wid, pi.store_id, pi.in_man, us.lbsid from 
update
order_product_in w
inner join user_staff us on us.wid = w.wid and us.id = w.in_man and us.is_system = 0
set w.store_id = us.lbsid
where w.wid > 0 and w.store_id = 0 and us.lbsid > 0
and w.add_date > @start_at;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_in w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_in w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;


# 入库单明细	order_product_in_detail.store_id
# [先业务人]
#select pid.id, pid.wid, pid.store_id, pi.in_man, pi.store_id/*, us.lbsid*/ from 
update
order_product_in_detail w 
inner join order_product_in pi on pi.wid = w.wid and pi.id = w.in_order_id
## inner join user_staff us on us.wid = pi.wid and us.id = pi.in_man
set w.store_id = pi.store_id
where w.wid > 0 and w.store_id = 0 and pi.store_id > 0
and w.add_date > @start_at;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_in_detail w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_in_detail w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;



# 开单表	order_billing.lbs_id
# [先业务人]
#select w.id, w.wid, w.lbs_id, u.id, u.wid, u.lbsid from
update 
order_billing w inner join user_staff u on w.wid = u.wid and w.receive_by = u.id and u.is_system = 0
set w.lbs_id = u.lbsid
where w.wid > 0
and w.lbs_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_billing w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.lbs_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.lbs_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_billing w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.lbs_id = t.min_id
where w.wid > 0 and w.lbs_id = 0 and t.min_id > 0
and w.add_date > @start_at;



# 开单配件消耗表	order_product_expense.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, u.id, u.wid, u.lbs_id from
update 
order_product_expense w inner join order_billing u on w.wid = u.wid and w.order_id = u.id
set w.store_id = u.lbs_id
where w.wid > 0
and w.store_id = 0 and u.lbs_id > 0
and w.add_date > @start_at;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_expense w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_expense w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;


# 开单配件消耗条码表	order_product_expense_code.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, u.id, u.wid, u.lbs_id from
update 
order_product_expense_code w inner join order_billing u on w.wid = u.wid and w.order_id = u.id
set w.store_id = u.lbs_id
where w.wid > 0
and w.store_id = 0 and u.lbs_id > 0
and w.add_date > @start_at;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_expense_code w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0
and w.add_date > @start_at;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_expense_code w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0
and w.add_date > @start_at;



####################################  删除临时表
drop table if exists __tmp_min_store_ids_from_lbs__;


####################################  删索引：先添加索引，后面再删除
alter table order_supplier drop index `idx_order_supplier_add_by`;
alter table order_brand drop index `idx_order_brand_add_by`;

alter table order_billing drop index `idx_order_billing_receive_by`;
alter table order_billing drop index `idx_order_billing_add_by`;
alter table order_product_in drop index `idx_order_product_in_add_by`;
alter table order_product_in_detail drop index `idx_order_product_in_detail_add_by`;

alter table order_product_expense drop index `idx_order_product_expense_add_by`;
alter table order_product_expense_code drop index `idx_order_product_expense_code_add_by`;

# 2017-08-01

select '04' as 'Index', @business as 'Type', 'Update Data' as 'Title', 'Done' as 'Status';

