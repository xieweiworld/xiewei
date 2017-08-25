# 开单系统数据库数据转换脚本

# 【允许多次执行此脚本，而不影响数据】

TRUNCATE TABLE customer_services;
ALTER TABLE `customer_services` AUTO_INCREMENT = 500;

# 1 先根据 fuwulist.name 来更新 fuwulist.ser2 = null 的数据
update fuwulist f inner join ditu_fuwu s on f.name = s.name
set f.ser2 = s.id
where (ser2 is null or ser2 = 0) and f.name is not null;
# 将无价格的项目初始化为 0.01
update fuwulist set price = 0.01 where price is null;


# 2. 转换客户已添加的服务项目相关数据
# 2.1 将fuwulist含售价的服务小类转入
insert into customer_services(id, wid, pid, name, sale_price, add_date, add_by)
select distinct f.ser2 as id, f.wid, s2.pid, s2.name, max(f.price) as sale_price, now() as add_date, 'transform2' as add_by
from fuwulist f
inner join ditu_fuwu s2 on f.ser2 = s2.id
where f.is_online = 0 and f.ser1 > 0 and f.ser1 is not null and f.wid > 0 and s2.pid > 0 and s2.pid is not null
and concat(f.ser2, '-', f.wid) not in (select concat(id, '-', wid) from customer_services where pid != 0)
group by f.ser2, f.wid, s2.pid, s2.name;

# 2.2 将其他不含售价的服务小类转入
insert into customer_services(id, wid, pid, name, sale_price, add_date, add_by)
select distinct f.ser2 as id, f.wid, s2.pid, s2.name, 0 as sale_price, now() as add_date, 'transform2' as add_by
from 
(select distinct wid, service_id as ser2 from member_card where service_id > 0
union
select distinct wid, /*ser1,*/ ser2 from service_templates where ser2 > 0
union
select distinct wid, /*ser1,*/ ser2 from dsqgrecord where ser2 > 0
union
select distinct wid, service_id as ser2 from member_card_chongzhi where service_id  > 0
union
select distinct cz.wid, s.service_id as ser2 from member_card_chongzhi_service s inner join member_card_chongzhi cz on s.cz_id = cz.id
union
select distinct token as wid, service_id as ser2 from ai9me_product_card where service_id > 0) f
inner join ditu_fuwu s2 on f.ser2 = s2.id
where f.wid > 0 and s2.pid > 0 and s2.pid is not null and concat(f.ser2, '-', f.wid) not in 
(select concat(id, '-', wid) from customer_services where pid != 0)
;
# no need to group this one

# 2.3 直接将预定义的服务大类写入到商户服务项目中
insert into customer_services(id, wid, pid, name, add_date, add_by)
select distinct s.code as id, p.wid, /*s.pid*/ 0 as pid, s.name, now() as add_date, 'transform1' as add_by
from customer_services p left join sys_default_service s on p.pid > 0 and s.pid = 0
where s.pid = 0 and concat(s.code, '-', p.wid) not in 
(select concat(id, '-', wid) from customer_services where pid = 0);

# 2.4 更新赅服务项目小类的 pid 指向 其预定义的服务大类id
# 通过服务小类id直接更新: 预定义的服务大类及id
# 洗车/451
update customer_services
set pid = 451
where pid > 0 and pid != 451
and id in (189,161,63,5,150,288,379,65,25,350,6,81,164,284,193,135,370,325,46,287);
# 美容/452
update customer_services
set pid = 452
where pid > 0 and pid != 452 
and id in (384,120,10,169,259,67,170,270,149,118,195,14,372,196,268,252,38,202,15,
361,197,269,330,253,39,110,203,16,243,220,190,45,298,111,352,17,266,250,366,271,13,
172,299,211,92,246,139,224,217,100,225,19,82,140,301,134,96,98,238,72,109,162,137,
138,136,383,97,99,9,245,282,363,368,144,283,289,381,369,351,7,68,194,8,295,367,178,
262,152,151,146,263,132,293,334,12,324,171,254,148,294,326,302,11,18,267,261,318,241,
360,296,71,303,219,20,297,27,214,22,239,206,285,292,258,371,240);
# 维修保养/453
update customer_services
set pid = 453
where pid > 0 and pid != 453
and id in (165,24,177,317,218,242,207,199,382,23,188,358,156,80,378,113,37,47,123,
236,212,70,52,249,31,157,116,90,255,230,75,124,237,114,173,374,53,115,33,74,187,117,
64,77,126,93,174,375,213,60,306,125,316,34,167,234,175,91,88,78,127,247,29,32,155,76,
376,153,133,62,163,244,160,35,73,122,235,200,69,210,79,128,248,30,141,314,309,251,209,
329,359,320,312,221,313,201,348,168,26,208,310,319,121,311,346,365,308,335,176);
# 机修/454 无
# 钣喷/455
update customer_services
set pid = 455
where pid > 0 and pid != 455
and id in (101,102,103);
# 改装/456
update customer_services
set pid = 456
where pid > 0 and pid != 456
and id in (215);
# 精品/457
update customer_services
set pid = 457
where pid > 0 and pid != 457
and id in (112,107,192,223,229,129,215,106,191,216,222,142,232,228,143,233,108,227);

# 3 平台的服务项目分类需要先更新, 这个sys_ser1/sys_ser2要保留为平台原来的ser1/ser2
# 更新商户服务项目商品表中的对应平台服务字段，根据原平台服务字段(为新商户服务字段)来更新
update fuwulist set sys_ser1 = ser1 where sys_ser1 = 0 or sys_ser1 is null;
update fuwulist set sys_ser2 = ser2 where sys_ser2 = 0 or sys_ser2 is null;


# 4 将一些不合理小类项目标记为已删除
update customer_services
set is_delete = 1
where is_delete = 0 and pid > 0
and id in (92,224,132,334,241,227,165,156,378,113,
255,230,75,124,237,114,173,374,74,187,77,174,375,
306,316,167,234,175,88,78,247,155,76,376,153,133,
62,163,244,160,122,235,210,128,221,313,348,168,26,
121,365,308,335,189,135,37,123,157);


# 5 将旧的服务大类更新为新的服务大类
# 洗车/451
update customer_services
set pid = 451
where pid > 0 and pid != 451
and pid in (1);
# 美容/452
update customer_services
set pid = 452
where pid > 0 and pid != 452
and pid in (2,3,28,94,272,273,274,276);
# 维修保养/453
update customer_services
set pid = 453
where pid > 0 and pid != 453
and pid in (4,28,275,277,278,280);
# 机修/454 无
# 钣喷/455
update customer_services
set pid = 455
where pid > 0 and pid != 455
and pid in (95);
# 改装/456 无
# 精品/457
update customer_services
set pid = 457
where pid > 0 and pid != 457
and pid in (105);


# 6 更新含 ser1 的数据表的数据，依据 ser2 对应的 pid 来更新
#   目前三个表中含冗余的大类id(ser1): fuwulist, dsqgrecord, service_templates
# 6.1 服务项目关怀模板
update service_templates c inner join customer_services s on c.wid = s.wid and c.ser2 = s.id
set c.ser1 = s.pid
where c.ser1 != s.pid;
# 6.2 抢购订单服务项目
update dsqgrecord c inner join customer_services s on c.wid = s.wid and c.ser2 = s.id
set c.ser1 = s.pid
where c.ser1 != s.pid;
# 6.3 商户服务项目定价信息
update fuwulist c inner join customer_services s on c.wid = s.wid and c.ser2 = s.id
set c.ser1 = s.pid
where c.ser1 != s.pid;

# 7 写入商户不存在的服务大类
insert into customer_services(id, wid, pid, name, add_date, add_by)
select distinct s.code as id, p.wid, /*s.pid*/ 0 as pid, s.name, now() as add_date, 'transform1' as add_by
from customer_services p inner join sys_default_service s on p.pid = 0 and s.pid = 0
where concat(s.code, '-', p.wid) not in 
(select concat(id, '-', wid) as id_wid from
(select distinct s.code as id, p.wid
from customer_services p inner join sys_default_service s on p.id = s.code
where p.pid = 0 and s.pid = 0) t);


# 8 删除默认服务项目中的[精品]项，后续保持该项的id为7
delete from sys_default_service where id = 7;


select '02-DONE';