# 初始化数据

####################################
## 本文件整体允许连续重复执行
####################################


set @business = '多门店业务';
set @wid_zunxi = 3297;     # 广州尊熹，两个门店都有业务数据，也是按此逻辑初始化业务数据的门店ID

# 2017-06-13

####################################  初始化：转换数据前先备份下数据
create table if not exists wmall_order_201707272001_new select * from  wmall_order;
create table if not exists crm_contract_201707272001_new select * from  crm_contract;
create table if not exists customer_set_201707272001_new select * from  customer_set;
create table if not exists lbs_201707272001_new select * from  lbs;
create table if not exists customer_role_201707272001_new select * from  customer_role;
create table if not exists user_staff_dep_201707272001_new select * from  user_staff_dep;
create table if not exists customer_product_type_201707272001_new select * from  customer_product_type;
create table if not exists wmall_product_201707272001_new select * from  wmall_product;
create table if not exists order_supplier_201707272001_new select * from  order_supplier;
create table if not exists order_brand_201707272001_new select * from  order_brand;
create table if not exists customer_carkeys_201707272001_new select * from  customer_carkeys;
create table if not exists order_charge_repay_201707272001_new select * from  order_charge_repay;
create table if not exists customer_money_in_201707272001_new select * from  customer_money_in;
create table if not exists customer_money_out_201707272001_new select * from  customer_money_out;
create table if not exists order_product_201707272001_new select * from  order_product;
create table if not exists order_product_in_201707272001_new select * from  order_product_in;
create table if not exists order_product_in_detail_201707272001_new select * from  order_product_in_detail;
create table if not exists order_product_indetail_barcode_201707272001_new select * from  order_product_indetail_barcode;
create table if not exists order_product_out_201707272001_new select * from  order_product_out;
create table if not exists order_product_out_detail_201707272001_new select * from  order_product_out_detail;
create table if not exists order_product_outdetail_batchno_201707272001_new select * from  order_product_outdetail_batchno;
create table if not exists order_product_return_201707272001_new select * from  order_product_return;
create table if not exists order_product_change_201707272001_new select * from  order_product_change;
create table if not exists order_charge_201707272001_new select * from  order_charge;
create table if not exists order_charge_detail_201707272001_new select * from  order_charge_detail;
create table if not exists customer_message_content_201707272001_new select * from  customer_message_content;
create table if not exists order_billing_201707272001_new select * from  order_billing;
create table if not exists order_product_expense_201707272001_new select * from  order_product_expense;
create table if not exists order_product_expense_code_201707272001_new select * from  order_product_expense_code;
create table if not exists member_card_201707272001_new select * from  member_card;
create table if not exists member_card_chongzhi_201707272001_new select * from  member_card_chongzhi;
create table if not exists member_card_xiaofei_201707272001_new select * from  member_card_xiaofei;

####################################  初始化：先添加索引，后面再删除
alter table wmall_product add index `idx_wmall_product_add_by` USING BTREE (`add_by` ASC);
alter table order_supplier add index `idx_order_supplier_add_by` USING BTREE (`add_by` ASC);
alter table order_brand add index `idx_order_brand_add_by` USING BTREE (`add_by` ASC);
alter table customer_carkeys add index `idx_customer_carkeys_add_by` USING BTREE (`add_by` ASC);
alter table order_charge_repay add index `idx_order_charge_repay_add_by` USING BTREE (`add_by` ASC);
alter table customer_money_in add index `idx_customer_money_in_add_by` USING BTREE (`add_by` ASC);
alter table customer_money_out add index `idx_customer_money_out_add_by` USING BTREE (`add_by` ASC);
alter table order_product add index `idx_order_product_add_by` USING BTREE (`add_by` ASC);
alter table order_product_in add index `idx_order_product_in_add_by` USING BTREE (`add_by` ASC);
alter table order_product_in_detail add index `idx_order_product_in_detail_add_by` USING BTREE (`add_by` ASC);
alter table order_product_indetail_barcode add index `idx_order_product_indetail_barcode_add_by` USING BTREE (`add_by` ASC);
alter table order_product_out add index `idx_order_product_out_add_by` USING BTREE (`add_by` ASC);
alter table order_product_out_detail add index `idx_order_product_out_detail_add_by` USING BTREE (`add_by` ASC);
alter table order_product_outdetail_batchno add index `idx_order_product_outdetail_batchno_add_by` USING BTREE (`add_by` ASC);
alter table order_product_return add index `idx_order_product_return_add_by` USING BTREE (`add_by` ASC);
alter table order_product_change add index `idx_order_product_change_add_by` USING BTREE (`add_by` ASC);
alter table order_charge add index `idx_order_charge_add_by` USING BTREE (`add_by` ASC);
alter table order_product_expense add index `idx_order_product_expense_add_by` USING BTREE (`add_by` ASC);
alter table order_product_expense_code add index `idx_order_product_expense_code_add_by` USING BTREE (`add_by` ASC);
alter table member_card_chongzhi add index `idx_member_card_chongzhi_add_by` USING BTREE (`add_by` ASC);
alter table member_card_xiaofei add index `idx_member_card_xiaofei_add_by` USING BTREE (`add_by` ASC);

alter table wmall_order add index `idx_wmall_order_order_shop` USING BTREE (`order_shop` ASC);
alter table wmall_order add index `idx_wmall_order_verified_id` USING BTREE (`verified_id` ASC);


####################################  初始化：门店前的相关数据：名称，将无名的标记为删除
update user_staff set lbsid = 0 where lbsid is null;
# 门店数据 - 只初始化 type, short_name
update lbs set type = 2 where wid > 0 and type = 0;
update lbs set short_name = `name` where wid > 0 and (short_name is null or short_name = '') and name is not null and name != '';

# 存储下最小门店数据临时表
# select * from __tmp_min_store_ids_from_lbs__;
drop table if exists __tmp_min_store_ids_from_lbs__;
create table if not exists __tmp_min_store_ids_from_lbs__
select wid, min(id) as min_id, count(id) as total
from lbs
where type = 2 and wid > 0 /*and wid != @wid_zunxi*/ and is_delete = 0
group by wid;

# 将无名的门店，尽可能更新到名称
# 将 crm_customer.customer_name => pubs.mp_name
# select p.mp_name, r.customer_name, r.short_name, p.id, r.uid, r.wid from 
update
pubs p inner join crm_customer r on r.wid = p.id
set p.mp_name = (case when r.short_name = '' or r.short_name is null then r.customer_name else r.short_name end)
where r.wid > 0 and r.customer_name != '' and r.customer_name is not null
and (p.mp_name is null or p.mp_name = '');
# 将 pubs.mp_name => lbs.name
#select l.name, l.wid, p.id, p.mp_name from 
update
lbs l inner join pubs p on l.wid = p.id
set l.name = p.mp_name
where l.wid > 0 and (l.name = '' or l.name is null) and p.mp_name != '' and p.mp_name is not null;

# 将无名lbs，标记删除（门店名称为空的且有活跃的登录记录的：只有一个商户(113)有一次：2017-03-15 09:49:41；  但 crmm_customer 表中无记录）
update lbs set is_delete = 1 where wid > 0 and (name is null or name = '') and is_delete = 0 and type = 2;

####################################  初始化：虚拟总店，现有门店所属店 及 系统管理员账号所属店
# 初始化门店表中的商户的虚拟总点记录(type=1)
# select t.*, l.*
insert into lbs(pid, uid, wid, type, code, full_path, name, short_name, is_enable, is_master, is_delete, add_date, add_by)
select 0 as pid, t.uid, t.wid, 1 as type, '' as code, '' as full_path, t.lbs_name as name, t.lbs_name as short_name, 1 as is_enable, 0 as is_master, 0 as is_delete, now() as add_date, 'init' as add_by
#, l.id
from (
	select wid, uid, max(lbs_name) as lbs_name from (
		select distinct wid, min(uid) as uid, min(name) as lbs_name from lbs where wid > 0 and type = 2 and is_delete = 0 group by wid
		union
		select distinct s.wid, p.uid, ifnull(r.customer_name, ifnull(u.short_name, concat('(', u.un, ')'))) as lbs_name 
		from user_staff s 
		inner join pubs p on s.wid = p.id and s.is_system = 1 
		inner join user u on p.uid = u.id
		left join crm_customer r on s.wid = r.wid
	) m group by wid, uid
) t
#inner join pubs p on t.wid = p.id
#inner join user u on p.uid = u.id
left join lbs l on t.wid = l.wid and l.type = 1
where l.id is null;

# 更新虚拟总店(type=1)的 code, full_path
update lbs l
set l.code = l.id
where type = 1 and l.code = '';
update lbs l
set l.full_path = concat('/', l.id, '/')
where type = 1 and l.full_path = '';

# 将无门店的虚拟总店，初始化一个门店 - 不初始化


# 将最小门店初始化为总店(is_master=1)
#select * from 
update
lbs m inner join __tmp_min_store_ids_from_lbs__ t on m.wid = t.wid and m.id = t.min_id
set is_master = 1, update_date = now(), update_by = 'master'
where m.wid > 0 and is_master = 0;

# 更新虚拟总店(type=1)的 地区、联系信息
# 查询
/*
select l.wid, l.type, l.name, l.short_name, l.l_sheng, l.l_shi, l.l_xianqu, l.l_address, l.address, l.tel, l.mtel, 
r.prov_code, r.city_code, r.region_code, r.area_code, r.district_name, r.address from
lbs l inner join crm_customer r on l.wid = r.wid
where l.type = 1 and l.is_delete = 0;
*/
# 更新
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_sheng = r.prov_code
where l.type = 1 and l.is_delete = 0 and l.l_sheng is null and r.prov_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_shi = r.city_code
where l.type = 1 and l.is_delete = 0 and l.l_shi is null and r.city_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_xianqu = r.region_code
where l.type = 1 and l.is_delete = 0 and l.l_xianqu is null and r.region_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.address = r.address
where l.type = 1 and l.is_delete = 0 and l.address is null and r.address is not null;

# 将商户下原有门店(type=2)全挂到虚拟总店(type=1)下面
#select c.id, c.pid, c.wid, c.type, c.code, c.full_path, p.id, p.type, p.code, p.full_path from 
update
lbs c inner join lbs p on c.wid = p.wid and c.type = 2 and p.type = 1
set c.pid = p.id, c.code = c.id, c.full_path = concat(p.full_path, c.id, '/')
where c.wid > 0 and c.pid = 0;

# 将商户的系统管理员挂到虚拟总店(type=1)下面(不含虚拟员工)，有默认商户帐号但无门店(因为从未登录过)
#select u.*, l.full_path, l.type from 
update
user_staff u left join lbs l on u.wid = l.wid and l.type = 1
set u.lbsid = l.id
where u.is_system = 1 and u.is_init = 0 and u.deleted = 0 and u.lbsid = 0 and l.type = 1;

############## 初始化：员工 user_staff.lbsid
# [先最小门店]
# select * from user_staff where wid > 0 and lbsid = 0;
#select w.id, w.wid, w.lbsid, t.* from
update 
user_staff w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.lbsid = t.min_id
where w.wid > 0 and w.lbsid = 0 and t.min_id > 0;
# [后虚拟总店]
#select d.wid, d.id,  d.lbsid, t.* from
update
user_staff d left join lbs t 
on d.wid = t.wid and t.type = 1
set d.lbsid = t.id
where d.wid > 0 and d.lbsid = 0 and t.wid is not null;


############## 初始化：部门 user_staff_dep.store_id
# [先员工门店] 部门下的第一个员工的id对应的门店
# select s.wid, s.id, s.lbsid, s.dept_id, d.id, d.wid, d.store_id from
update
user_staff_dep d
inner join user_staff s on d.wid = s.wid and d.id = s.dept_id
inner join
(
	# 商户的部门下第一个有效员工
	select min(id) as min_usid, wid, dept_id
	from user_staff
	where is_system = 0 and deleted = 0 and dept_id is not null and dept_id != 0
	group by wid, dept_id
) t on s.id = t.min_usid and s.wid = t.wid
set d.store_id = s.lbsid
where s.lbsid is not null and s.lbsid != 0 and d.store_id = 0;
# [后最小门店] 剩下部门挂到第一个门店下
#select d.wid, d.id,  d.store_id, t.* from
update
user_staff_dep d left join __tmp_min_store_ids_from_lbs__ t 
on d.wid = t.wid
set d.store_id = t.min_id
where d.wid > 0 and d.store_id = 0 and t.wid is not null;

# [后虚拟总店] 如果还有部门无对应门店,则本无有效门店, 挂虚拟总店下
#select d.wid, d.id,  d.store_id, t.* from
update
user_staff_dep d left join lbs t 
on d.wid = t.wid and t.type = 1
set d.store_id = t.id
where d.wid > 0 and d.store_id = 0 and t.wid is not null;


####################################  初始化：办理门店关系、消费门店关系
# 会员卡可消费的门店表：初始化会员卡的可办理门店记录
insert into member_card_consume_stores(wid, card_id, type, type_id, add_date, add_by)
select distinct c.wid, c.id as card_id, 1 as type, 0 as type_id, now() as add_date, 'init' as add_by
#, s.id as ss_id
from member_card c left join member_card_consume_stores s on c.wid = s.wid and c.id = s.card_id and s.type = 1
where c.wid > 0 /*and c.is_main = 1 and c.is_enable = 1*/ and s.id is null;

# 卡片可办理的门店表：初始化卡片的可办理门店记录
insert into wmall_product_handle_stores(wid, product_id, type, type_id, add_date, add_by)
select distinct p.wid, p.id as product_id, 1 as type, 0 as type_id, now() as add_date, 'init' as add_by
#, p.*
from wmall_product p left join wmall_product_handle_stores s on p.wid = s.wid and p.id = s.product_id and s.type = 1
where p.wid > 0 and p.type = 1 and s.id is null;

# 卡片可消费的门店表：初始化卡片的可消费门店记录
insert into wmall_product_consume_stores(wid, product_id, type, type_id, add_date, add_by)
select distinct p.wid, p.id as product_id, 1 as type, 0 as type_id, now() as add_date, 'init' as add_by
#, p.*
from wmall_product p left join wmall_product_consume_stores s on p.wid = s.wid and p.id = s.product_id and s.type = 1
where p.wid > 0 and p.type = 1 and s.id is null;

#################################### 初始化：最大门店数
# CRM合同表	crm_contract.max_stores - 不用初始化
# 商户设置表	customer_set.max_stores - 只初始化有数据的，并且数量不匹配的
#select cs.id, cs.wid, cs.max_stores, t.wid, t.total from
update
customer_set cs left join __tmp_min_store_ids_from_lbs__ t on cs.wid = t.wid
set cs.max_stores = t.total
where cs.wid > 0 and cs.max_stores < t.total;


####################################  初始化：业务数据所属门店 => 以新增人优先，后最小门店id
# 商品表: wmall_product.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
wmall_product w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
wmall_product w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 /*and w.add_by != 'transfer'*/ and w.store_id = 0 and t.min_id > 0;
# [虚拟总店]
#select d.wid, d.id,  d.store_id, t.* from
update
wmall_product d left join lbs t 
on d.wid = t.wid and t.type = 1
set d.store_id = t.id
where d.wid > 0 and d.store_id = 0 and t.wid is not null;


# 供应商表: order_supplier.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_supplier w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_supplier w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 配件品牌表: order_brand.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_brand w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_brand w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 钥匙号设置表: customer_carkeys.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
customer_carkeys w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
customer_carkeys w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 还款表: order_charge_repay.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_charge_repay w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_charge_repay w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 资金收入表: customer_money_in.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
customer_money_in w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
customer_money_in w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 资金支出表: customer_money_out.store_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
customer_money_out w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
customer_money_out w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


####################################  初始化：业务数据所属门店 => 以业务人优先，新增人其次，后最小门店id
# 配件表	order_product.store_id
# [先业务人]
#select p.id, p.wid, p.store_id, pi.in_man, us.lbsid from 
update
order_product p
inner join order_product_in pi on p.wid = pi.wid
inner join order_product_in_detail pid on pi.wid = pid.wid and pi.id = pid.in_order_id and p.id = pid.product_id
inner join user_staff us on us.wid = p.wid and us.id = pi.in_man and us.is_system = 0
set p.store_id = us.lbsid
where p.wid > 0 and p.store_id = 0 and us.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 入库单	order_product_in.store_id
# [先业务人]
#select pi.id, pi.wid, pi.store_id, pi.in_man, us.lbsid from 
update
order_product_in pi
inner join user_staff us on us.wid = pi.wid and us.id = pi.in_man and us.is_system = 0
set pi.store_id = us.lbsid
where pi.wid > 0 and pi.store_id = 0 and us.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_in w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_in w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 入库单明细	order_product_in_detail.store_id
# [先业务人]
#select pid.id, pid.wid, pid.store_id, pi.in_man, pi.store_id/*, us.lbsid*/ from 
update
order_product_in_detail pid 
inner join order_product_in pi on pi.wid = pid.wid and pi.id = pid.in_order_id
## inner join user_staff us on us.wid = pi.wid and us.id = pi.in_man
set pid.store_id = pi.store_id
where pid.wid > 0 and pid.store_id = 0 and pi.store_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_in_detail w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_in_detail w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 入库明细条码表	order_product_indetail_barcode.store_id
#select pid.id, pid.wid, pid.store_id, pi.in_man, pi.store_id/*, us.lbsid*/ from 
update
order_product_indetail_barcode pid 
inner join order_product_in pi on pi.wid = pid.wid and pi.id = pid.in_order_id
## inner join user_staff us on us.wid = pi.wid and us.id = pi.in_man
set pid.store_id = pi.store_id
where pid.wid > 0 and pid.store_id = 0 and pi.store_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_indetail_barcode w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_indetail_barcode w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 出库单	order_product_out.store_id
# [先业务人]
#select po.id, po.wid, po.store_id, po.out_man, us.lbsid from 
update
order_product_out po
inner join user_staff us on us.wid = po.wid and us.id = po.out_man and us.is_system = 0
set po.store_id = us.lbsid
where po.wid > 0 and po.store_id = 0 and us.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_out w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_out w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 出库明细	order_product_out_detail.store_id
# [先业务人]
#select pod.id, pod.wid, pod.store_id, po.out_man, po.store_id/*, us.lbsid*/ from 
update
order_product_out_detail pod 
inner join order_product_out po on po.wid = pod.wid and po.id = pod.out_order_id
## outner join user_staff us on us.wid = po.wid and us.id = po.out_man
set pod.store_id = po.store_id
where pod.wid > 0 and pod.store_id = 0 and po.store_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_out_detail w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_out_detail w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 出库明细批次	order_product_outdetail_batchno.store_id
# [先业务人]
#select pod.id, pod.wid, pod.store_id, po.out_man, po.store_id/*, us.lbsid*/ from 
update
order_product_outdetail_batchno pod 
inner join order_product_out po on po.wid = pod.wid and po.id = pod.out_order_id
## outner join user_staff us on us.wid = po.wid and us.id = po.out_man
set pod.store_id = po.store_id
where pod.wid > 0 and pod.store_id = 0 and po.store_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_outdetail_batchno w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_outdetail_batchno w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 退货单	order_product_return.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, w.return_by, u.id, u.wid, u.lbsid from
update 
order_product_return w inner join user_staff u on w.wid = u.wid and w.return_by = u.id and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_return w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_return w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 盘点单	order_product_change.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, w.return_by, u.id, u.wid, u.lbsid from
update 
order_product_change w inner join user_staff u on w.wid = u.wid and w.change_by = u.id and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_change w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_change w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 开单表	order_billing.lbs_id
# [先业务人]
#select w.id, w.wid, w.lbs_id, u.id, u.wid, u.lbsid from
update 
order_billing w inner join user_staff u on w.wid = u.wid and w.receive_by = u.id and u.is_system = 0
set w.lbs_id = u.lbsid
where w.wid > 0
and w.lbs_id = 0 and u.lbsid > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_billing w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.lbs_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.lbs_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_billing w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.lbs_id = t.min_id
where w.wid > 0 and w.lbs_id = 0 and t.min_id > 0;



# 开单配件消耗表	order_product_expense.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, u.id, u.wid, u.lbs_id from
update 
order_product_expense w inner join order_billing u on w.wid = u.wid and w.order_id = u.id
set w.store_id = u.lbs_id
where w.wid > 0
and w.store_id = 0 and u.lbs_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_expense w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_expense w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 开单配件消耗条码表	order_product_expense_code.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, u.id, u.wid, u.lbs_id from
update 
order_product_expense_code w inner join order_billing u on w.wid = u.wid and w.order_id = u.id
set w.store_id = u.lbs_id
where w.wid > 0
and w.store_id = 0 and u.lbs_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_product_expense_code w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_product_expense_code w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 挂帐表	order_charge.store_id
# [先业务人] - 无
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_charge w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_charge w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 挂帐明细表	order_charge_detail.store_id
# [先业务人]
#select w.id, w.wid, w.store_id, u.id, u.wid, u.lbs_id from
update 
order_charge_detail w inner join order_billing u on w.wid = u.wid and w.order_id = u.id
set w.store_id = u.lbs_id
where w.wid > 0
and w.store_id = 0 and u.lbs_id > 0;
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_charge_detail w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_charge_detail w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;



# 还款明细表	order_charge_repay.store_id
# [先业务人] - 无
# [再新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
order_charge_repay w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.store_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.store_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
order_charge_repay w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;

# 商户配件分类表	customer_product_type.store_id
# [按最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
customer_product_type w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.store_id = t.min_id
where w.wid > 0 and w.store_id = 0 and t.min_id > 0;


# 会员卡充值记录表: member_card_chongzhi.lbs_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
member_card_chongzhi w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.lbs_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.lbs_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
member_card_chongzhi w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.lbs_id = t.min_id
where w.wid > 0 and w.lbs_id = 0 and t.min_id > 0;

# 会员卡消费记录表: member_card_xiaofei.lbs_id
# [先新增人]
#select w.id, w.wid, w.store_id, w.add_by, u.id, u.wid, u.lbsid from
update 
member_card_xiaofei w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.lbs_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.lbs_id = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
member_card_xiaofei w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.lbs_id = t.min_id
where w.wid > 0 and w.lbs_id = 0 and t.min_id > 0;

# 商城订单表: wmall_order.order_shop
# [先新增人]
#select w.id, w.wid, w.order_shop, w.add_by, u.id, u.wid, u.lbsid from
update 
wmall_order w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.order_shop = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.order_shop = 0 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
wmall_order w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.order_shop = t.min_id
where w.wid > 0 and w.order_shop = 0 and t.min_id > 0;

# 商城订单表: wmall_order.verified_id
# [先新增人]
#select w.id, w.wid, w.verified_id, w.add_by, u.id, u.wid, u.lbsid from
update 
wmall_order w inner join user_staff u on w.wid = u.wid and w.add_by = u.mobile and u.is_system = 0
set w.verified_id = u.lbsid
where w.wid > 0 and u.is_system = 0 and u.deleted = 0
and w.verified_id = 0 and w.is_verified = 1 and u.lbsid > 0;
# [后最小ID]
#select w.id, w.wid, w.store_id, t.* from
update 
wmall_order w inner join __tmp_min_store_ids_from_lbs__ t on w.wid = t.wid
set w.verified_id = t.min_id
where w.wid > 0 and w.verified_id = 0 and w.is_verified = 1 and t.min_id > 0;



########################################################################################################################

# 有很多不同店的人，在同一个部门里面
# select * from __tmp_customer_department_more_stores__;
drop table if exists __tmp_customer_department_more_stores__;
create table if not exists __tmp_customer_department_more_stores__
select c.customer_name, t.* from (
	select wid, dept_name, dept_id, count(distinct lbsid) as store_count, group_concat(distinct lbsid) as store_ids
	from user_staff
	where wid > 0 and deleted = 0
	# and wid not in (319, 211, 148, 689, 286, 3283, 2400, 2713, 3059, 3185)
	group by wid, dept_name, dept_id
	having store_count > 1
) t inner join crm_customer c on t.wid = c.wid;

# 将部门复制到另一个店
insert into user_staff_dep(wid, store_id, name, remark, sort_no, is_enable, is_delete, add_date, add_by)
#select t.*, l.*, d.id as fromid, d.name as fromname, d.is_enable, my.id as myid, my.name as myname from (
select t.wid, t.store_id, d.name, d.remark, d.sort_no, d.is_enable, d.is_delete, now() as add_date, 'copy' as add_by from (
	SELECT
		distinct m.wid, m.dept_name,
		SUBSTRING_INDEX(
		SUBSTRING_INDEX(m.store_ids, ',', s.sequence),
			',' , -1) as 'store_id'
		#s.sequence
	FROM __cross__join__sequences__ s CROSS JOIN __tmp_customer_department_more_stores__ m # 使用含多项逗号分隔数据的列
	WHERE
	s.sequence BETWEEN 1 AND (SELECT LENGTH(m.store_ids) - LENGTH(REPLACE(m.store_ids, ',', '')) + 1) 
) t
left join __tmp_min_store_ids_from_lbs__ l on t.wid = l.wid and t.store_id = l.min_id
left join user_staff_dep d on t.wid = d.wid and t.dept_name = d.name and t.store_id != d.store_id and d.is_delete = 0
left join user_staff_dep my on t.wid = my.wid and t.dept_name = my.name and t.store_id = my.store_id and my.is_delete = 0
where l.wid is null and l.min_id is null and d.id is not null and my.id is null
;

# 更新部门不匹配的员工部门
#select u.id, u.wid, u.lbsid, u.dept_id, u.dept_name, d.id, d.name, d.add_by from 
update
user_staff u 
inner join user_staff_dep d on u.wid = d.wid and u.lbsid = d.store_id and u.dept_name = d.name and u.dept_id != d.id
set u.dept_id = d.id
where u.wid > 0 and d.add_by = 'copy';


drop table if exists __tmp_customer_department_more_stores__;


########################################################################################################################


# 最后再更新下门店简称数据
update lbs set short_name = `name` where wid > 0 and (short_name is null or short_name = '') and name is not null and name != '';

####################################  初始化：系统公告
# 公告内容表	customer_message_content.terminal
update customer_message_content set terminal = 2 where terminal = 0;


####################################  更新虚拟总店名称
#select l.wid, l.name, l.short_name, p.uid, u.id, u.short_name from 
update
lbs l 
inner join pubs p on l.wid = p.id
inner join user u on p.uid = u.id
set l.short_name = u.short_name, l.name = u.short_name
where l.wid > 0 and type = 1
and u.short_name != '' and u.short_name is not null
and l.short_name != u.short_name
# and length(u.short_name) < length(l.short_name)
# order by length(u.short_name) desc
;


drop table if exists __tmp_min_store_ids_from_lbs__;

####################################  初始化：先添加索引，后面再删除
alter table wmall_product drop index `idx_wmall_product_add_by`;
alter table order_supplier drop index `idx_order_supplier_add_by`;
alter table order_brand drop index `idx_order_brand_add_by`;
alter table customer_carkeys drop index `idx_customer_carkeys_add_by`;
alter table order_charge_repay drop index `idx_order_charge_repay_add_by`;
alter table customer_money_in drop index `idx_customer_money_in_add_by`;
alter table customer_money_out drop index `idx_customer_money_out_add_by`;
alter table order_product drop index `idx_order_product_add_by`;
alter table order_product_in drop index `idx_order_product_in_add_by`;
alter table order_product_in_detail drop index `idx_order_product_in_detail_add_by`;
alter table order_product_indetail_barcode drop index `idx_order_product_indetail_barcode_add_by`;
alter table order_product_out drop index `idx_order_product_out_add_by`;
alter table order_product_out_detail drop index `idx_order_product_out_detail_add_by`;
alter table order_product_outdetail_batchno drop index `idx_order_product_outdetail_batchno_add_by`;
alter table order_product_return drop index `idx_order_product_return_add_by`;
alter table order_product_change drop index `idx_order_product_change_add_by`;
alter table order_charge drop index `idx_order_charge_add_by`;
alter table order_product_expense drop index `idx_order_product_expense_add_by`;
alter table order_product_expense_code drop index `idx_order_product_expense_code_add_by`;
alter table member_card_chongzhi drop index `idx_member_card_chongzhi_add_by`;
alter table member_card_xiaofei drop index `idx_member_card_xiaofei_add_by`;

alter table wmall_order drop index `idx_wmall_order_order_shop`;
alter table wmall_order drop index `idx_wmall_order_verified_id`;

# 2017-06-13

select '04' as 'Index', @business as 'Type', 'Update Data' as 'Title', 'Done' as 'Status';

