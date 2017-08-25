# 初始化数据

# 商城新版业务

# 2017-03-31

# A、旧的抢购项目定价(fuwulist) 在新版商城中 按 服务项目类商品(type=3)处理
# B、旧的预约项目信息(yyfw_set) 在新版商城中 按 服务项目类商品(type=3)处理 <= 不用处理，因原预约功能已经是按商户服务项目预约的

# 商户的抢购服务项目定价信息: fuwulist => wmall_product 商城服务项目类商品(type=3) , wmall_product_image
# 商户的上述商品的服务项目信息: fuwulist+wmall_product => wmall_product_service

# (暂不按这个处理)抢购项目定价商品信息: fuwulist+wmall_product => wmall_snapup_set, wmall_snapup_periods

# 1、调整旧表：旧表增加一个字段：在 02_alter_tables 处理

# 2、转入数据：开始转入数据到新表（wmall_product）中(按type=3处理)
set @product_type = 3;
insert into wmall_product(source_id, source_desc, source_notice, wid, type, is_chinalife, is_internal, code, name, main_pic, pinyin, chars, attach_id, warning, description, template_id, sale_price, origin_price, chinalife_price, is_show_op, each_limit, amount, view_amount, is_recommend, showinshops, showinventory, showsoldcount, origin_amount, sale_count, is_sale_now, saled_at, expired_at, durations, is_install, express_mode, express_fee, car_brand, car_model, status, sort_no, is_delete, add_date, add_by)
# type:1会员卡类商品,2精品类商品,3服务项目类商品,0:旧商城非会员卡类商品(但按2精品处理),4:抢购服务项目(隐含商品),5:卡券(隐含商品)
# 用 source_id 存储 fuwulist.id = dsqgrecord.dsqgid
# 此时的id应为自增长，否则与商城商品的重复
# 暂用 attach_id 存储为 服务小类id(ser2)
select 
fl.id as source_id, ifnull(discrible, '') as source_desc, ifnull(notice, '') as source_notice, wid, @product_type as type, 
(case when (activity & 2048) = 2048 then 1 else 0 end) as is_chinalife, 
0 as is_internal, concat('CS', lpad(id, 6, '0')) code, ifnull(name, '') as name, ifnull(pic, '') as main_pic, '' as pinyin, '' as chars, 
ifnull(ser2, 0) as attach_id, 0 as warning, '' as description, 0 as template_id, 
price as sale_price, ifnull(yuanjia, price) as origin_price,  
(case when (activity & 2048) = 2048 then price else 0 end) as chinalife_price,
1 as is_show_op, 0 as each_limit, 
(case when (activity & 2048) = 2048 then 999 else 0 end) as amount,
0 as view_amount, 0 as is_recommend, !is_online as showinshops,
0 as showinventory, 0 as showsoldcount, 0 as origin_amount, ifnull(t.total, 0) as sale_count, 
!is_online as is_sale_now, NULL as saled_at,  
NULL as expired_at, 7 as durations, 0 as is_install, 0 as express_mode, 0 as express_fee, 
0 as car_brand, 0 as car_model, !is_online as status, ifnull(sort, 0) as sort_no, 
is_online as is_delete, ifnull(add_date, created_at) as add_date, ifnull(add_by, 'transfer') as add_by
from fuwulist fl
left join (select wid as twid, dsqgid, count(id) as total from dsqgrecord where wid > 0 group by wid, dsqgid) t
on fl.wid = t.twid and fl.id = t.dsqgid
where wid > 0 and shift_status = 0;
# 3、转换商品的banner图片数据 -- 与上述要先后转入，因为 product_id 变化了 => （wmall_product_image）
insert into wmall_product_image(source_id, wid, product_id, qiniu_pic, big_pic, sort_no, is_delete, add_date, add_by)
select distinct fl.id as source_id, fl.wid, wp.id as product_id, ifnull(pic, '') as qiniu_pic, ifnull(pic, '') as big_pic, 1 as sort_no, is_online as is_delete, created_at as add_date, 'transfer' as add_by
from fuwulist fl inner join wmall_product wp on fl.wid = wp.wid 
and fl.id = wp.source_id 
# and fl.ser2 = wp.attach_id
where fl.wid > 0 and shift_status = 0 and wp.type = @product_type
and length(fl.pic) > 0;
# 4、将抢购服务项目数据转入到 商品服务项目表中: wmall_product_service (新商品对应的服务项目)
insert into wmall_product_service(wid, product_id, service_id, service_name, sale_price, sort_no, is_delete, add_date, add_by)
select wp.wid, wp.id as product_id, attach_id as service_id, name as service_name, wp.sale_price, 1 as sort_no, wp.is_delete, wp.add_date, wp.add_by
from wmall_product wp left join wmall_product_service ws
on wp.wid = ws.wid and wp.id = ws.product_id and wp.attach_id = ws.service_id
where wp.type = @product_type and wp.attach_id >= 0 and ws.id is null;

###### 不再转入到抢购设置表中 ######
# 5、将抢购服务项目商品 转入为 抢购设置数据: 国寿积分抢购项目(activity包含2048的:(activity&2048=2048)时promotion=3
# 抢购设置type=3
# 抢购数量amount=1(0表示不限制)
# 限购数量limit_count=1(0表示不限制)
# listed_by = 0 ????? 因为 add_by 全是 null，或是取默认wid的商户帐号id
# audit_time 有 0 或 null 值
/*
set @chinalife=2048;
truncate table wmall_snapup_set;
insert into wmall_snapup_set(wid, type, name, type_id, amount, snap_price, limit_count, start_time, end_time, is_listed, listed_by, listed_at, duration, promotion, is_period, start_period, end_period, period_interval, period_amount, is_enable, sys_ser1, sys_ser2, audit_time, audit_id, audit_by, audit_info, audit_state, is_delete, add_date, add_by)
select 
fl.wid, 3 as type, ifnull(fl.name, wp.name) as name, wp.id as type_id, 
(case when activity & @chinalife = @chinalife then 0 else 1 end) as amount, 
fl.price as snap_price, 
(case when activity & @chinalife = @chinalife then 0 else 1 end) as limit_count, '00:00:00' as start_time, '24:00:00' as end_time, 
!is_online as is_listed, 0 as listed_by, now() as listed_at, 365 as duration, 
(case when activity & @chinalife = @chinalife then 3 else 0 end) as promotion, 
0 as is_period, '00:00:00' as start_period, '24:00:00' as end_period, 1440 as period_interval, 1 as period_amount, 
!is_online as is_enable, ifnull(fl.sys_ser1, 0) as sys_ser1, ifnull(fl.sys_ser2, 0) as sys_ser2, 
(case when fl.audit_time is null or fl.audit_time = 0 then NULL else from_unixtime(fl.audit_time) end) as audit_time, 
(case when fl.audit_by = 'yichefu' then 411 when fl.audit_by = 'chefuguanjia' then 909 else 0 end) as audit_id, 
ifnull(fl.audit_by, '') as audit_by, ifnull(reason, '') as audit_info, 
(case when fl.status is null then 0 else fl.status end) as audit_state, 
is_online as is_delete, ifnull(fl.add_date, created_at) as add_date, 'transfer' as add_by
from fuwulist fl inner join wmall_product wp
on fl.wid = wp.wid and fl.id = wp.source_id
where fl.wid > 0 and shift_status = 0 and wp.type = @product_type;
*/

# 6、商品分类：将此类商品的分类数据(服务项目 分类)，写入到新表中：wmall_product_category
insert into wmall_product_category(source_id, wid, product_id, category_id, is_delete, add_date, add_by)
select distinct 0 as source_id, wp.wid as wid, wp.id as product_id, wc.id as category_id, 0 as is_delete, now() as add_date, 'transfer' as add_by
from wmall_product wp
inner join (select id, wid from wmall_category where code = 'ServiceItem') wc on wc.wid = wp.wid #and wp.type = @product_type
left join wmall_product_category pc on pc.wid = wp.wid and pc.category_id = wc.id
where wp.type =  @product_type and pc.id is null ;

# 7、商品审核信息：将商品数据，写入到新表中：wmall_audit_info
set @product_type = 3;
insert into wmall_audit_info(wid, type, type_id, sys_ser1, sys_ser2, audit_time, audit_id, audit_by, audit_info, audit_state, is_chinalife, is_one_price, is_special_price, add_date, add_by)
select 
wp.wid, 1 as type, wp.id as type_id,
ifnull(fl.sys_ser1, 0) as sys_ser1,
ifnull(fl.sys_ser2, 0) as sys_ser2, 
(case when fl.audit_time is null or fl.audit_time = 0 then NULL else from_unixtime(fl.audit_time) end) as audit_time, 
(case when fl.audit_by = 'yichefu' then 411 when fl.audit_by = 'chefuguanjia' then 909 else 0 end) as audit_id,
ifnull(fl.audit_by, '') as audit_by,
ifnull(reason, '') as audit_info,
(case when fl.status is null or fl.status = 1 then 0 else fl.status end) as audit_state, 
(case when (activity & 2048) = 2048 then 1 else 0 end) as is_chinalife, 0 as is_one_price, 0 as is_special_price, 
wp.add_date, 'transfer' as add_by
from fuwulist fl inner join wmall_product wp on fl.wid = wp.wid 
and fl.id = wp.source_id
left join wmall_audit_info wa on wa.wid = wp.wid and wa.type_id = wp.id
where fl.wid > 0 #and shift_status = 0 
and wp.type = @product_type and wp.attach_id >= 0 and wa.id is null;
# 将旧大类更新为新大类
# select distinct sys_ser1 from wmall_audit_info where sys_ser1 not in (1001, 1002, 1003, 1004, 1,28, 95, 275, 278, 280,2,3,4,94,272,273,274,276,277,105); # => 0
update wmall_audit_info set sys_ser1 = 1001  where sys_ser1 = 1;
update wmall_audit_info set sys_ser1 = 1002 where sys_ser1 in (28, 95, 275, 278, 280);
update wmall_audit_info set sys_ser1 = 1003 where sys_ser1 in (2,3,4,94,272,273,274,276,277);
update wmall_audit_info set sys_ser1 = 1004 where sys_ser1 = 105;

# 8、更新旧表：转换完成，更新旧表标记
update fuwulist
set shift_status = 2
where wid > 0 and shift_status = 0;


# 不需要转此类项目为商品：预约服务项目 => 新版商城服务项目类商品 => 新版商城预约类订单


# 7、调整新表：将商品id调整为从 20000 开始   =>   在转完服务项目这类商品后，再设置
ALTER TABLE `wmall_product` AUTO_INCREMENT = 30000 ;

# 2017-03-31

select '14' as 'Index', 'Transfer Services' as 'Title', 'Done' as 'Status';
