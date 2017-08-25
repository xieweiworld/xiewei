# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-12
########### 车主库优化
################################# END   - 2017-06-12
*/

# 一、初始化车主库：客户(车主)来源
# 历史转入、门店记录 => 1线下到店
# 微信注册 => 2微信商城
# 剩下的 => 9其他
update member_base set initial = 1 where wid > 0 and initial = 0 and is_guest = 0 and substring(source,1,1) = 1;
update member_base set initial = 1 where wid > 0 and initial = 0 and is_guest = 0 and substring(source,1,1) = 2;
update member_base set initial = 2 where wid > 0 and initial = 0 and is_guest = 0 and substring(source,1,1) = 3;
update member_base set initial = 9 where wid > 0 and initial = 0 and (is_guest = 1 or source is null);

# 二、将系统卡号初始化到自定义卡号中
update member_card set custom_card_code = card_code where wid > 0 and (custom_card_code is null or custom_card_code = '');

# 三、对于无图的商品，应该添加一个默认商品图，及对应的主图
# 1、会员卡类商品(type=1)，默认一张会员卡图片
set @main_pic = '/res/membercard/product/car-vip-card03.png';
# 写入 wmall_product_image 表
insert into wmall_product_image(wid, product_id, qiniu_pic, big_pic, sort_no, is_delete, add_by, add_date)
select p.wid, p.id as product_id, '' as qiniu_pic, @main_pic as big_pic, 0 as sort_no, 0 as is_delete, 'init' as add_by, now() as add_date  
from wmall_product p left join wmall_product_image pi on p.wid = pi.wid and p.id = pi.product_id
where p.wid > 0 and p.type = 1 and p.is_delete = 0 
	and p.is_internal = 0 and p.main_pic is null or p.main_pic = ''
	and pi.id is null;
# 更新 wmall_product 表
#select wid, id as product_id, '' as qiniu_pic, @main_pic as big_pic, 0 as sort_no, 0 as is_delete, 'init' as add_by, now() as add_date  from
update 
wmall_product 
set main_pic = @main_pic
where wid > 0 and type = 1 and is_delete = 0 and is_internal = 0 and main_pic is null or main_pic = '';
# 2、非会员卡类商品(type!=1)，默认一张默认图片
set @main_pic = '/res/wmalls/product-icon.png';
# 写入 wmall_product_image 表
insert into wmall_product_image(wid, product_id, qiniu_pic, big_pic, sort_no, is_delete, add_by, add_date)
select p.wid, p.id as product_id, '' as qiniu_pic, @main_pic as big_pic, 0 as sort_no, 0 as is_delete, 'init' as add_by, now() as add_date  
from wmall_product p left join wmall_product_image pi on p.wid = pi.wid and p.id = pi.product_id
where p.wid > 0 and p.type != 1 and p.is_delete = 0 
	and p.is_internal = 0 and p.main_pic is null or p.main_pic = ''
	and pi.id is null;
# 更新 wmall_product 表
set @main_pic = '/res/wmalls/list-icon.png';
#select id, wid, main_pic from
update 
wmall_product 
set main_pic =  @main_pic
where wid > 0 and type != 1 and is_delete = 0 and is_internal = 0 and main_pic is null or main_pic = '';

# 四、将 www.zh50.cn/zh50.cn 替换为新的 www.yichefu.cn
update res set con = replace(con,'www.zh50.cn','www.yichefu.cn') where con like '%www.zh50.cn%';
update res set con = replace(con,'zh50.cn','www.yichefu.cn') where con like '%zh50.cn%';

# 五、同步关注记录mid与会员记录is_subscribe
# 1、将有关注记录的粉丝对应的会员记录(wid + wid_wxid)的关注标记为0的修改为1
create table if not exists tmp_wx_fans_20170622
select wid, wid_wxid, max(subscribe_time) as st
from customer_wx_fans
where wid > 0 and wx_type in (1,3) and subscribe_time is not null
group by wid, wid_wxid;
######## 先添加索引
ALTER TABLE `tmp_wx_fans_20170622`  ADD INDEX `idx_tmp_wx_fans_20170622_wid` USING BTREE (`wid` ASC);
ALTER TABLE `tmp_wx_fans_20170622`  ADD INDEX `idx_tmp_wx_fans_20170622_wid_wxid` USING BTREE (`wid_wxid` ASC);
######## 更新关注标记
# select m.id, m.wid, m.wid_wxid, m.is_subscribe, t.* from
update 
member_base m inner join tmp_wx_fans_20170622 t on m.wid = t.wid and m.wid_wxid = t.wid_wxid
set m.is_subscribe = 1
where m.is_subscribe = 0;
######## 删除临时表
drop table tmp_wx_fans_20170622;

# 2、将有绑定会员(wid + wid_wxid)的粉丝的关注记录，更新对应的mid
######## 更新mid
#select f.wid, f.wid_wxid, f.mid, m.id, m.wid, m.wid_wxid from 
update
customer_wx_fans f inner join member_base m on f.wid = m.wid and f.wid_wxid = m.wid_wxid
set f.mid = m.id
where m.wid > 0 and f.mid = 0;


select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';