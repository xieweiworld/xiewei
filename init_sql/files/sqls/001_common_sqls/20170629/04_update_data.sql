# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

##################################################################
# 单次升级时，不要重复运行此文件，否则数据会重复添加
##################################################################

/*
#################################
order_billing_member_autos_unhandled: 此表的数据，后续再转入（商户下同车牌的多个手机号的，暂另存储，先不转入）
#################################

################################# START - 2017-06-21
########### 车主库优化2
########### 0、单独备份四张表：member_base, member_auto, member_card, order_billing;
########### 一、更新type
########### 二、将开单散客转入为普通车主(type=1)
########### 三、更新开单中的散客mid
########### 四、将商户中同车牌的车辆保留最小id的车
########### 五、更新开单中的散客carId
########### 六、更新会员卡中限牌的卡的carId
################################# END   - 2017-06-21
*/

# 开单表中的待转入到车主库的记录的 sort_no 值
set @target_sort_no = 2;

#  变量定义
set @now_date = date_format(now(), '%Y%m%d');
set @now_time = now();
set @next_second = date_add(now(), interval 1 second);
set @add_by = 'billing_guest';

########### 0、单独备份四张表：member_base, member_auto, member_card, order_billing;
create table if not exists member_base_20170705_carowner select * from member_base;
create table if not exists member_auto_20170705_carowner select * from member_auto;
create table if not exists member_card_20170705_carowner select * from member_card;
create table if not exists order_billing_20170705_carowner select * from order_billing;


############## 一、更新type(因默认值为1)
# 默认系统散客的车主类型是0: is_guest=1 => type=0
update member_base set type = 0 where wid > 0 and is_guest = 1 and type = 1 and add_date < '2017-07-05 20:45:00' and add_by != @add_by /*and status = 0*/;
# 现有非系统散客记录全是会员: type=1 => type=2
update member_base set type = 2 where wid > 0 and is_guest = 0 and type = 1 and add_date < '2017-07-05 20:45:00' and add_by != @add_by /*and status = 0*/;

# 先更新数据
update order_billing set member_mobile = '' where wid > 0 and (member_mobile is null or member_mobile = '00000000000'); # 将11个0或null的更新为空串
update order_billing set cpai = replace(cpai, ',', '') where wid > 0 and cpai != replace(cpai, ',', ''); # 将车牌中的逗号替换掉


################################################################################################### 商户下同车牌的多个手机号的，暂另存储，先不转入
# 先存储数据
create table if not exists order_billing_member_autos_unhandled
select wid, cpai, GROUP_CONCAT(member_mobile) as mobiles, COUNT(member_mobile) as total FROM (
	SELECT max(b.id) as max_id, b.wid, b.cpai, b.member_mobile FROM order_billing b
	INNER JOIN member_base m ON b.mid = m.id AND m.wid = b.wid AND m.is_guest = 1 AND m.`status` = 0
	WHERE b.wid > 0 #AND b.wid NOT IN ( 319, 211, 148, 689, 286, 3283, 2400, 2713, 3059, 3185 )
	AND b.is_delete = 0
	-- AND b.is_revert = 0
	-- AND b.is_cancel = 0
	AND b.member_mobile != ''
	AND b.cpai != ''
	and b.sort_no = 0
	GROUP BY b.wid, b.cpai, b.member_mobile
) b GROUP BY wid,cpai
HAVING total > 1;

# 再将上述车牌对应的开单记录，标记为sort_no=2，后续再处理
# select * from
update
order_billing b inner join order_billing_member_autos_unhandled t on b.wid = t.wid and b.cpai = t.cpai
set sort_no = 2
where b.wid > 0 and b.is_delete = 0 and b.member_mobile != '' and b.cpai != ''
and b.sort_no = 0;

############## 二、将开单散客转入为普通车主(type=1)
# 0、将开单表中的散客开单的数据记录，先标记好(sort_no改为1)，后续只查询sort_no=1的数据进行查询、更新操作
#select d.*, m.* from
update
order_billing d
inner join member_base m on d.wid = m.wid and d.mid = m.id
set d.sort_no = @target_sort_no
where d.wid > 0 and d.sort_no = 0
and m.status = 0 and m.type = 0 and m.is_guest = 1  # 原是系统散客数据
and (d.member_mobile != '' or d.cpai != '') 		# 手机号、车牌号必须有一个
;

################################################################################################### 生成数据
# 0、先单独备份下待处理的sort_not的数据
set @sql_back = concat('create table if not exists ', 'order_billing_', @now_date, '_carowner', '_sortno_', @target_sort_no, ' select * from order_billing;');
prepare sql_back from @sql_back;
execute sql_back;

# 1、将开单表中所有散客(member_base.is_guest=1)开单的车辆存储到临时表
#####  开单表中无mid=0的数据
set @i = 0;
drop table if exists __tmp_member_base_billing__;
create table if not exists __tmp_member_base_billing__
select (@i:=@i+1) as id, d.wid, mid, d.member_mobile, car_id, d.cpai, max(member_name) as member_name, min(d.add_date) as add_date
from order_billing d
inner join member_base m on d.wid = m.wid and d.mid = m.id
where d.sort_no = @target_sort_no
group by d.wid, mid, d.member_mobile, car_id, d.cpai;

# 将手机号已成为会员表记录的单独生成临时数据表，后面要将这些车主的车牌归到该车主下面
drop table if exists __tmp_member_base_members__;
create table if not exists __tmp_member_base_members__
select t.* from __tmp_member_base_billing__ t
inner join member_base m on t.wid = m.wid and t.member_mobile = m.tel   # 已有会员的，单独存储到临时表
where t.wid > 0 and t.member_mobile != '' and m.status = 0;

# 2、调整下临时表主键、部分数据
ALTER TABLE `__tmp_member_base_members__`  CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT , ADD PRIMARY KEY (`id`);

ALTER TABLE `__tmp_member_base_billing__`  CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT , ADD PRIMARY KEY (`id`);
ALTER TABLE `__tmp_member_base_billing__` CHANGE COLUMN `member_mobile` `member_mobile` VARCHAR(50) NULL DEFAULT '';
update __tmp_member_base_billing__ set member_name = replace(member_name, '（', '') where member_name like '%（%';
update __tmp_member_base_billing__ set member_name = replace(member_name, '）', '') where member_name like '%）%';
update __tmp_member_base_billing__ set member_name = replace(member_name, '(', '') where member_name like '%(%';
update __tmp_member_base_billing__ set member_name = replace(member_name, ')', '') where member_name like '%)%';
update __tmp_member_base_billing__ set member_name = replace(member_name, '散客', '') where member_name like '%散客%';
update __tmp_member_base_billing__ set member_name = '散客' where member_name = '';
# update __tmp_member_base_billing__ set cpai = replace(cpai, ',', '') where cpai like '%,%'; # 因后面有用来更新mid

# 3、删除手机号、车牌号全是空或零的；删除手机号已成为会员表记录的
delete from __tmp_member_base_billing__ where (member_mobile = '' and cpai = '');
delete from __tmp_member_base_billing__ where id in (select id from __tmp_member_base_members__);

# 4、无手机号的，用车牌及前后缀做手机号，后面再处理掉该手机号为空串（会员用手机号做车牌的？无）
# 扩展字段长度50
ALTER TABLE `member_base` CHANGE COLUMN `tel` `tel` VARCHAR(50) NULL DEFAULT '' COMMENT '手机号码';
set @mobile_prefix = 'TORM';
update __tmp_member_base_billing__ set member_mobile = concat(@mobile_prefix, cpai, @mobile_prefix) where member_mobile = '';
# 此时：无手机号的、有手机号且【未】存入会员的原散客车主数据，全在 __tmp_member_base_billing__ 临时数据表中 => select * from __tmp_member_base_billing__;
# 此时：有手机号且【已】存入会员的原散客车主数据，全在 __tmp_member_base_members__ 临时数据表中 => select * from __tmp_member_base_members__;

# select max(length(member_mobile)) from __tmp_member_base_billing__; # 19
# select * from __tmp_member_base_billing__ where member_name = '';
# select * from __tmp_member_base_billing__ where member_mobile = concat(@mobile_prefix, cpai, @mobile_prefix);
# select wid, member_mobile, count(id) as total from __tmp_member_base_billing__ group by wid, member_mobile having total > 1;


################################################################################################### 转入数据

# 4、将散客对应的数据写入到车主库表中
insert into member_base(wid, cpai, name, sex, tel, status, time, source, initial, type, is_guest, add_date, add_by)
select
distinct
t.wid, t.cpais as cpai, 
(case when replace(t.names, ',','') = '' then '散客' else replace(t.names, ',','') end) as name,
(case when t.names like '%女%' or t.names like '%姐%'  or t.names like '%妹%'  or t.names like '%太太%' then '女' else '男' end) as sex,
t.member_mobile as tel, 0 as status, ifnull(t.add_date, @now_time) as time, 21 as source, 1 as initial, 1 as type, 0 as is_guest, 
@next_second as add_date, @add_by as add_by
#, 'MEMBER_BASE' as mmid, m.*
from
(
	# 所有待加入的散客数据
	select distinct s.wid, s.member_mobile, group_concat(distinct s.member_name) as names, group_concat(distinct s.cpai) as cpais, min(s.add_date) as add_date
	from __tmp_member_base_billing__ s 
	# where s.cpai like '%粤S9719A%'
	group by s.wid, s.member_mobile
	#having length(cpais) > 48
	#order by t.wid asc, t.member_mobile asc
) t left join member_base m on t.wid = m.wid and t.member_mobile = ifnull(m.tel, concat(@mobile_prefix, m.cpai, @mobile_prefix)) and m.status = 0 # 手机号不在车主表中
where t.wid > 0 and m.id is null
# and t.member_mobile = '13509203666'
#and m.tel is not null and m.tel != ''
;

# 5.1、将车辆写入到车辆表中
# select * from member_base m where m.cpai like '%,%' and m.add_date > @now_time and m.add_by = @add_by;
insert into member_auto(wid, mid, cpai, add_date, add_by)
SELECT
    m.wid, m.id as mid,
    SUBSTRING_INDEX(
		SUBSTRING_INDEX(m.cpai, ',', s.sequence),
        ',' , -1) as 'cpai',
    #s.sequence
	ifnull(m.add_date, @next_second) as add_date, @add_by as add_by
FROM __cross__join__sequences__ s CROSS JOIN member_base m
	left join member_auto a on m.wid = a.wid and m.id = a.mid
WHERE
	s.sequence BETWEEN 1 AND (SELECT LENGTH(m.cpai) - LENGTH(REPLACE(m.cpai, ',', '')) + 1) 
	# 可加入t表其他条件
	and m.add_date > @now_time 
	and m.add_by = @add_by
	and a.id is null
#	and m.cpai like '%粤S9719A%'
# ORDER BY t.id
;

# 5.2、已有散客会员记录的开单的车辆，不在车辆库中的车
set @color = 'CL#TORM';
insert into member_auto(wid, mid, cpai, add_date, add_by, color)
select distinct t.wid, m.id as mid, t.cpai, ifnull(t.add_date, @next_second) as add_date, @add_by as add_by, @color as color
from __tmp_member_base_members__ t
inner join member_base m on t.wid = m.wid and t.member_mobile = m.tel and m.status = 0  # 已是原会员记录
left join member_auto c on c.wid = m.wid and c.mid = m.id and c.cpai = t.cpai and c.is_delete = 0# 已是存在的车辆
where c.id is null # 得到不存在的车辆
# and t.cpai = '粤S9719A'
;  
# 重新更新含新会员的冗余车辆信息
#select tt.*, m.* from
update
member_base m inner join (
	select c.wid, c.mid, group_concat(distinct cpai) as cpais 
	from member_auto c inner join (
		select distinct wid, mid from member_auto where wid > 0 and add_by = @add_by and color = @color   # 只查询有新增车辆的会员记录
	) t on c.wid = t.wid and c.mid = t.mid
	where c.wid > 0 and c.is_delete = 0
	group by c.wid, c.mid
) tt on m.wid = tt.wid and m.id = tt.mid
set m.cpai = tt.cpais, update_by = concat(ifnull(update_by, ''), 'UPD')
where m.wid > 0 and m.cpai != tt.cpais
#and tt.cpais like '%粤S9719A%'
;
# 清空掉临时数据字段color
update member_auto set color = '' where wid > 0 and add_by = @add_by and color = @color;


# 6、删除临时表
drop table if exists __tmp_member_base_billing__;
drop table if exists __tmp_member_base_members__;


/*

# 7、添加的普通散客数据
select * from member_base where wid > 0 and add_by = @add_by and add_date > @now_time;
select * from member_auto where wid > 0 and add_by = @add_by and add_date > @now_time;


# 8、清理数据，用于测试
delete from member_base where add_by = @add_by and add_date > @now_time;
delete from member_auto where add_by = @add_by and add_date > @now_time;

*/


################################################################################################### 更新数据
########### 三、更新开单中的散客mid
# 按手机号更新
#select distinct b.mid, b.cpai, m.id as m_id, b.wid, m.wid as mwid, b.member_mobile, m.tel from 
update
order_billing b 
inner join member_base m on b.wid = m.wid and m.tel = (case when b.member_mobile = '' then concat(@mobile_prefix, b.cpai, @mobile_prefix) else b.member_mobile end)
set b.mid = m.id, b.update_by = concat(ifnull(b.update_by, ''), 'UPD')
where b.sort_no = @target_sort_no 
and b.wid > 0 and m.wid > 0
# and b.member_mobile is not null and b.member_mobile != ''
and m.status = 0 
# and b.cpai = '粤S9719A'
and b.mid != m.id;

/*
# 按车牌号更新: 不应该；应该始终通过手机号或预设的手机号进行更新
#select distinct b.id, b.mid, a.mid as m_id, b.wid, a.wid as awid from 
update
order_billing b 
inner join member_auto a on b.wid = a.wid and b.cpai = a.cpai
inner join member_base m on b.wid = m.wid and b.mid = m.id # 散客开单的
set b.mid = a.mid, b.update_by = concat(ifnull(b.update_by, ''), 'UPD')
where b.wid > 0 and a.wid > 0
and b.cpai is not null and b.cpai != '' and a.is_delete = 0
and m.type = 0 # and m.is_guest = 1 # 只更新原来是系统散客数据
and b.mid != a.mid;
*/

########### 四、将商户中同车牌的车辆保留最大id的车
# 保留各商户同车牌的最小id的车辆
create table if not exists __tmp_more_autos__
select wid, mid, cpai, max(id) as max_id, count(id) as total, min(add_date) as min_date
from member_auto 
where wid > 0 and is_delete = 0 and mid > 0 and cpai is not null and cpai != ''
group by wid, mid, cpai
having total > 1
order by min_date asc;
# 查询各商户所有同牌的车辆
#select * from __tmp_more_autos__;
# 标记这些车辆为删除
#select t.* from
update
member_auto a inner join __tmp_more_autos__ t on a.wid = t.wid and a.mid = t.mid and a.cpai = t.cpai
set a.is_delete = 1, a.update_date = now(), a.update_by = concat(ifnull(a.update_by, ''), 'RD')
where a.wid > 0 and a.is_delete = 0 and a.cpai is not null and a.cpai != '';
# 将各商户车牌最大id的启用
#select a.* from
update
member_auto a inner join __tmp_more_autos__ t on a.wid = t.wid and a.id = t.max_id
set a.is_delete = 0, a.update_date = now(), a.update_by = replace(a.update_by, 'RD', 'UPD')
where a.wid > 0 and a.is_delete = 1 and a.cpai is not null and a.cpai != '';
# 删除临时数据表
drop table if exists __tmp_more_autos__;


########### 五、更新开单中的散客carId
#select distinct b.mid, b.car_id, a.id as aid, b.wid, a.wid as awid, b.cpai, a.cpai as acpai from 
update
order_billing b inner join member_auto a on b.wid = a.wid and b.mid = a.mid and b.cpai = a.cpai  # mid已更新，同mid的车牌
set b.car_id = a.id, b.update_by = concat(ifnull(b.update_by, ''), 'UPD')
where b.sort_no = @target_sort_no
and b.wid > 0 and a.wid > 0
and b.cpai is not null and b.cpai != '' and a.is_delete = 0
# and b.cpai = '粤S9719A'
and b.car_id != a.id;

########### 六、更新会员卡中限牌的卡的carId
#select distinct d.mid, d.is_limit_car, d.car_id, a.id as aid, d.wid, a.wid as awid, d.cpai, a.cpai as acpai from
update
member_card d inner join member_auto a on d.wid = a.wid and d.mid = a.mid and d.cpai = a.cpai # 同mid的车牌
set d.car_id = a.id, d.update_by = concat(ifnull(d.update_by, ''), 'UPD')
where d.wid > 0 and a.wid > 0
and d.cpai is not null and d.cpai != '' and a.is_delete = 0 and d.is_limit_car = 1
and d.car_id != a.id;

# 清空车牌类手机号
#select id, wid, tel, name, cpai, status, type from#
update
member_base
set tel = '', update_by = concat(ifnull(update_by, ''), 'UPD')
where wid > 0 and tel like concat(@mobile_prefix, '%', @mobile_prefix) and add_by = @add_by;

# 还原字段长度20
ALTER TABLE `member_base` CHANGE COLUMN `tel` `tel` VARCHAR(20) NULL DEFAULT '' COMMENT '手机号码';

# 车主库中含散客字样的替换为空串
update member_base set name = replace(name, '散客', '') where wid > 0 and type = 1 and name like '%散客%';

# 车主库、开单表中手机号为11个0的替换为空串
update member_base set tel = '' where wid > 0 and type = 1 and tel = '00000000000';
################################################################################################### 更新完成


select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';