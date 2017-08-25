# 初始化数据

# 2016-10-18

# 将开单表中mcard_price为null的更新为0
update order_billing set mcard_price = 0 where mcard_price is null;


# 2016-10-19

# 初始化上述amount，为0的才更新
update order_billing b inner join 
(select o.id, o.amount, sum(ifnull(s.price,0) + ifnull(e.total_price,0)) as price
from order_billing o
left join order_service s on o.id = s.order_id
left join order_product_expense e on o.id = e.order_id
where o.amount = 0
group by o.id) t on b.id = t.id
set b.amount = t.price
where b.amount = 0;

# 2016-10-27

# 初始化 service prices
update order_billing o inner join
(select wid, order_id, sum(ifnull(price,0)) as price, sum(ifnull(discount_price,0)) as discount
from order_service
group by wid, order_id) t on o.wid = t.wid and o.id = t.order_id
set o.service_price = t.price, o.discount_price1 = t.discount;

# 初始化 product prices
update order_billing o inner join
(select wid, order_id, sum(ifnull(total_price,0)) as price, sum(ifnull(discount_price,0)) as discount
from order_product_expense
group by wid, order_id) t on o.wid = t.wid and o.id = t.order_id
set o.product_price = t.price, o.discount_price2 = t.discount;

# 2016-10-27


# 2016-11-08

# select * from member_card where wid > 0 and type < 2 and is_no_expire = 0 and status = 0;
# select * from ai9me_product_card where duration = 999 and is_no_expire = 0;

# 将充值卡全设置为永久有效(is_no_expire = 1)
update member_card set is_no_expire = 1 where wid > 0 and type < 2 and is_no_expire = 0 and status = 0;
# 将会员卡片有效期为999的设置为永久有效(is_no_expire = 1)
update ai9me_product_card set is_no_expire = 1 where duration = 999 and is_no_expire = 0;

# 2016-11-08


# 3、新增菜单（待出库列表、待施工列表、待收银列表、精品销售列表、）
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Billings/WaitOuts','待出库列表','Billing002','3','billings/waitouts','1',692);

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/WaitOuts',3 ;

select '31--done';

-- insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
-- value(now(),'init','Billings/WaitWorks','待施工列表','Billing001','3','billings/waitworks','1',694);

-- INSERT into sys_level_right(level_id,right_code,right_levels)
-- SELECT 7,'Billings/WaitWorks',3 ;

-- select '32--done';

-- 去掉 待出库列表
-- delete from sys_right where right_code= 'Billings/WaitOuts';

-- 去掉 应付货款
-- delete from sys_right where right_code= 'Billings/TradePay';


# 4、服务项目增加 is_fast字段

# alter table customer_services add column is_fast int(11) default '0' comment '是否快捷开单';



insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Billings/WaitCashs','待收银列表','Billing001','3','billings/waitCashs','1',696);

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/WaitCashs',3 ;

select '33--done';

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Billings/Sales','精品销售列表','Billing001','3','billings/sales','1',698);

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/Sales',3 ;

select '34--done';

# 4、新增菜单（提成设置、员工业绩提成）
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/StaffPerformance','员工业绩统计','Data001','3','billings/StaffPerformance','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','WSY/SetBonus','提成设置','Setting002','3','wsy/SetBonus','1');
update sys_right set right_name='库存查询' where right_code='Billings/Stores';
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProductSet','配件库设置','Billing004','3','billings/ProductSet','1');

-- 删除之前的提成设置
delete from sys_right where right_code= 'WSY/Commission-xs';

-- 开单管理 修改为 开单收银
update sys_right set right_name='开单收银' where right_code='Billing001';

-- 去掉 待施工列表
delete from sys_right where right_code= 'Billings/WaitWorks';
