# 初始化数据

# 商城新版业务

# 2017-03-31

# 转换商户的商品分类: ai9me_product_cat => wmall_category
################## 使用的默认图片转换为新的图片，如果提供了新的图片的话
################## 客户自行设置的图片保持不变。

# select * from ai9me_product_cat where token < 0; # 无此类数据

# select * from ai9me_product_cat where token > 0; # total >= 3448 数据

# select * from wmall_category;

# 1、将分类数据转入到新表中
insert into wmall_category (id, wid, source_id, code, name, icon, remark, is_system, is_enable, is_delete, sort_no, add_date, add_by)
select
pc.id,
#wc.id as category_id,
token as wid, pc.id as source_id, 
(case when ishyk = 1 then 'MemberCard' else concat('ProductCategory', lpad(pc.id, 5, '0')) end) as code,
pc.name, logourl as icon,
(case when ishyk = 1 then '系统定义分类' else des end) as remark, 
(case when ishyk = 1 then 1 else 0 end) as is_system, 
visible as is_enable, !visible as is_delete, ord as sort_no, from_unixtime(time) as add_date, 'transfer' as add_by
from ai9me_product_cat pc
left join wmall_category wc on pc.token = wc.wid and pc.id = wc.source_id
where token > 0 and wc.id is null and pc.name not like '%救援%';

# 2、初始化抢购服务项目商户的 服务项目 分类
set @serviceItem = 'ServiceItem';
insert into wmall_category (wid, source_id, code, name, icon, remark, is_system, is_enable, is_delete, sort_no, add_date, add_by)
select distinct fl.wid, 0 as source_id, @serviceItem as code, '服务项目' as name, '/res/wmalls/type/Maintenance.png' as icon, '系统定义分类' as remark, 1 as is_system, 1 as is_enable, 0 as is_delete, 1 as sort_no, now() as add_date, 'transfer' as add_by
from fuwulist fl left join wmall_category wc on fl.wid = wc.wid and wc.code = @serviceItem
where fl.wid > 0 and (wc.id is null or wc.id = 0);

# 3、将商品分类id调整为从 6000 开始
ALTER TABLE `wmall_category` AUTO_INCREMENT = 6000 ;

# 3、各商品的对应分类，将在转换商品表数据后再转入到新表中: wmall_product_category

# 4、将旧的商品分类图片，替换为新的商品分类图片
/*
新图存储为：
static|category/res/wmalls/type/boutique.png
新图定义:
<img src="/res/wmalls/type/boutique.png"> 精品
*/
update wmall_category set icon = '/res/wmalls/type/car-wash.png' where icon = '/res/wsc/xiche.png';
update wmall_category set icon = '/res/wmalls/type/extra-val.png' where icon = '/res/wsc/dala.png';
update wmall_category set icon = '/res/wmalls/type/spray.png' where icon = '/res/wsc/weixiu.png'; 
update wmall_category set icon = '/res/wmalls/type/nursing.png' where icon = '/res/wsc/meirong.png';
update wmall_category set icon = '/res/wmalls/type/boutique.png' where icon = '/res/wsc/yinxiang.png';
update wmall_category set icon = '/res/wmalls/type/boutique.png' where icon = '/res/wsc/peijian.png';
update wmall_category set icon = '/res/wmalls/type/member.png' where icon = '/res/wsc/huiyuanka.png' or code = 'MemberCard';
update wmall_category set icon = '/res/wmalls/type/nursing.png' where icon = '/res/wsc/jiuyuan.png'; # 就一个是 救援，其他转为 护理

# 2017-03-31

select '11' as 'Index', 'Transfer Categories' as 'Title', 'Done' as 'Status';
