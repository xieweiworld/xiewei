# 初始化数据

# 商城新版业务

# 2017-04-01

# 抢购订单: 旧商城首页设置(ai9me_product_set) => wmall_set_banner

# 转换图片1
insert into wmall_set_banner(wid,name,image,link_type,is_more,enabled_at,expired_at,is_delete,add_date,add_by)
select
token as wid , ifnull(name, '') as name, newhaibao as image, 99 as link_type, 0 as is_more, '2017-01-01 00:00:00' as enabled_at,
'2027-01-01 00:00:00' as expired_at, 0 as is_delete, now() as add_date , 'transfer' as add_by
from ai9me_product_set
where token > 0 and shift_status = 0 and newhaibao is not null and newhaibao != '';

# 转换图片2
insert into wmall_set_banner(wid,name,image,link_type,is_more,enabled_at,expired_at,is_delete,add_date,add_by)
select
token as wid , ifnull(name, '') as name, newhaibao1 as image, 99 as link_type, 0 as is_more, '2017-01-01 00:00:00' as enabled_at,
'2027-01-01 00:00:00' as expired_at, 0 as is_delete, now() as add_date , 'transfer' as add_by
from ai9me_product_set
where token > 0 and shift_status = 0 and newhaibao1 is not null and newhaibao1 != '';

# 转换图片3
insert into wmall_set_banner(wid,name,image,link_type,is_more,enabled_at,expired_at,is_delete,add_date,add_by)
select
token as wid , ifnull(name, '') as name, newhaibao2 as image, 99 as link_type, 0 as is_more, '2017-01-01 00:00:00' as enabled_at,
'2027-01-01 00:00:00' as expired_at, 0 as is_delete, now() as add_date , 'transfer' as add_by
from ai9me_product_set
where token > 0 and shift_status = 0 and newhaibao2 is not null and newhaibao2 != '';


# 6、更新旧表：转换完成，更新旧表标记
update ai9me_product_set
set shift_status = 2
where token > 0 and shift_status = 0;


# 2017-04-01

select '15' as 'Index', 'Transfer Banners' as 'Title', 'Done' as 'Status';
