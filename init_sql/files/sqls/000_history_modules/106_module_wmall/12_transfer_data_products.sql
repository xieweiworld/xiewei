# 初始化数据

# 商城新版业务

# 2017-03-31

# 商户的商品数据: ai9me_product => wmall_product
# select * from ai9me_product; # >= 11632
# select * from ai9me_product where token <= 0; # 4 - 不用转

# 1、调整旧表：旧表增加一个字段：在 02_alter_tables 处理

# 2、转入数据：开始转入数据到新表中
insert into wmall_product(id, source_id, source_desc, source_notice, wid, type, is_chinalife, is_internal, code, name, main_pic, pinyin, chars, attach_id, warning, description, template_id, sale_price, origin_price, is_show_op, each_limit, amount, view_amount, is_recommend, showinshops, showinventory, showsoldcount, origin_amount, sale_count, is_sale_now, saled_at, expired_at, durations, is_install, express_mode, express_fee, car_brand, car_model, status, sort_no, is_delete, add_date, add_by)
# type:1会员卡,2精品,3服务项目,0:旧商城非会员卡类商品(但按2精品处理)
# endtime全是0
# showinshops => status 表示上架或未上架
# product_set, isdiscount, keyword 未在新表中定义
select 
id, id as source_id, ifnull(intro, '') as source_desc, ifnull(notice, '') as source_notice, token as wid, 
(case when ishyk = 'card' then 1 else 0 end) as type, 0 as is_chinalife, 0 as is_internal,
concat('WP', lpad(id, 6, '0')) code, ifnull(name, '') as name,  ifnull(logourl, '') as main_pic, '' as pinyin, '' as chars, 
0 as attach_id, 0 as warning, '' as description, 0 as template_id, convert(price, decimal(12,2)) as sale_price, convert(oprice, decimal(12,2)) as origin_price,  
1 as is_show_op, ifnull(limit_buy, 0) as each_limit, inventory as amount, 0 as view_amount, 
(case when classify = 0 then 1 else 0 end) as is_recommend, ifnull(showinshops, 0) as showinshops,
ifnull(showinventory, 0) as showinventory, 0 as showsoldcount, 0 as origin_amount, 
(case when salecount < 0 then 0 else salecount end) as sale_count, 
(case when sale_time is null then 1 else 0 end) as is_sale_now, sale_time as saled_at,
(case when sale_time is null then null else date_add(now(), interval 1 year) end) as expired_at, 
0 as durations, 0 as is_install, 0 as express_mode, 0 as express_fee, 
0 as car_brand, 0 as car_model, (case when showinshops = 1 then 1 else 0 end) as status, ifnull(ord, 0) as sort_no, 
is_online as is_delete, from_unixtime(time) as add_date, 'transfer' as add_by
from ai9me_product
where token > 0 and shift_status = 0;

# 3、商品分类：将商品分类数据，写入到新表中：wmall_product_category
insert into wmall_product_category(source_id, wid, product_id, category_id, is_delete, add_date, add_by)
select distinct id as source_id, token as wid, id as product_id, catid as category_id,
is_online as is_delete, now() as add_date, 'transfer' as add_by
from ai9me_product 
where token > 0 and shift_status = 0;

# 4、转换商品的banner图片数据
insert into wmall_product_image(source_id, wid, product_id, qiniu_pic, big_pic, sort_no, is_delete, add_date, add_by)
select id as source_id, token as wid, id as product_id, ifnull(logourl, '') as qiniu_pic, ifnull(logourl, '') as big_pic, 1 as sort_no, is_online as is_delete, from_unixtime(time) as add_date, 'transfer' as add_by
from ai9me_product
where token > 0 and shift_status = 0
and length(logourl) > 0;

# 5、更新旧表：转换完成，更新旧表标记
update ai9me_product
set shift_status = 2
where token > 0 and shift_status = 0;

# 6、添加默认的商品审核信息：将商品数据，写入到新表中：wmall_audit_info
insert into wmall_audit_info(wid, type, type_id, add_date, add_by)
select p.wid, 1 as type, p.id as type_id, now() as add_date, p.add_by
from wmall_product p left join wmall_audit_info a on p.wid = a.wid and p.id = a.type_id
where (p.type = 1 or p.type = 0) and (a.id is null or a.id = 0);

# 7、调整新表：将商品id调整为从 30000 开始   =>   在转完服务项目这类商品后，再设置


# 2017-03-31

select '12' as 'Index', 'Transfer Products' as 'Title', 'Done' as 'Status';
