# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

##################################################################
# 单次升级时，可以重复运行此文件
##################################################################

/*
################################# START - 2017-07-18
########### 管理员业务
################################# END   - 2017-07-18
*/

################################################################################################### 开始更新
############## 一、更新菜单：有开单权限（Billing）的都加上库存权限（Inventory）、财务权限（Finance）、配件设置（Inventory002）
call __proc__add_right_to_all_sys_levels('Inventory');
call __proc__add_right_to_all_sys_levels('Finance');
call __proc__add_right_to_all_sys_levels('Inventory002');

# 会员卡中‘办卡人’是管理员: 存储临时表中
drop table if exists __tmp_biz_wids__;
create table if not exists __tmp_biz_wids__ 
select distinct wid from (
	select distinct c.wid from member_card_chongzhi c inner join user_staff u on c.wid = u.wid and c.operate_id = u.id and u.is_system = 1
	union
	select distinct d.wid from order_billing d inner join user_staff u on d.wid = u.wid and d.receive_by = u.id and u.is_system = 1
	union
	select distinct d.wid from order_product_in d inner join user_staff u on d.wid = u.wid and d.in_man = u.id and u.is_system = 1
	union
	select distinct d.wid from order_product_out d inner join user_staff u on d.wid = u.wid and d.out_man = u.id and u.is_system = 1
) t;

# 无门店的添加一个门店
insert into lbs(uid, wid, name)
select r.uid, r.wid, ifnull(r.short_name, r.customer_name) as name
#, l.id
from __tmp_biz_wids__ t inner join crm_customer r on t.wid = r.wid
left join lbs l on t.wid = l.wid and l.is_delete = 0
where l.id is null;

# 更新门店区域信息
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_sheng = r.prov_code
where l.is_delete = 0 and l.l_sheng is null and r.prov_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_shi = r.city_code
where l.is_delete = 0 and l.l_shi is null and r.city_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.l_xianqu = r.region_code
where l.is_delete = 0 and l.l_xianqu is null and r.region_code is not null;
update lbs l inner join crm_customer r on l.wid = r.wid
set l.address = r.address
where l.is_delete = 0 and l.address is null and r.address is not null;

# 无部门的添加一个部门
insert into user_staff_dep(wid, name, remark)
select w.wid, '默认部门' as name, '默认添加的部门' as remark
from __tmp_biz_wids__ w left join user_staff_dep l on w.wid = l.wid
where l.id is null;

# 复制原管理员为新管理员 (暂用 is_init=2 表示)
insert into user_staff(wid, lbsid, dept_id, dept_name, name, login_id, password, is_system, is_init, role_code, created_at, remark)
select distinct u.wid, null as lbsid, null as dept_id, null as dept_name, u.name, u.login_id, u.password, u.is_system, 2 as is_init, u.role_code, u.created_at, u.remark
from __tmp_biz_wids__ w 
left join user_staff u on u.wid = w.wid and u.is_system = 1 and u.deleted = 0
left join user_staff s on s.wid = w.wid and s.is_system = 1 and s.deleted = 0 and s.is_init = 2 # 避免重复生成
left join user_staff t on t.wid = w.wid and t.is_system = 0 and t.deleted = 0 and t.is_init = 1 # 避免重复生成
where u.id > 0 and s.id is null and t.id is null;

/*

select * from user_staff where is_system = 1 and is_init = 0; # 有 208个 => is_system=0, is_int=1

select * from user_staff where is_system = 1 and is_init = 2; # => 1

select * from user_staff where is_system = 0 and is_init = 1; # => 1

delete from user_staff where is_init > 1 and is_init < 3;

*/

# 更新原管理员为普通管理员
#select u.* from
update 
user_staff u 
inner join __tmp_biz_wids__ w on u.wid = w.wid
inner join (select wid, max(id) as max_id from user_staff where wid > 0 group by wid) t on t.wid = w.wid
left join (select wid, min(id) as lbsid from lbs where wid > 0 and is_delete = 0 group by wid) l on l.wid = w.wid
left join (select wid, min(id) as dept_id from user_staff_dep where wid > 0 group by wid) d on d.wid = w.wid
left join user_staff_dep dd on dd.wid = w.wid and dd.id = d.dept_id
left join user_staff tt on tt.wid = w.wid and tt.is_system = 0 and tt.deleted = 0 and tt.is_init = 1 # 避免重复生成
/*  */
set 
	u.name = '管理员',
	u.lbsid = l.lbsid,
	u.dept_id = d.dept_id,
	u.dept_name = dd.name,
	u.role_code = '',
	u.is_system = 0,
	u.is_init = 1, 
	u.login_id = concat(u.login_id, '-', (t.max_id + 1))

where u.wid > 0
	and u.is_system = 1
	and u.is_init = 0
	and u.deleted = 0
	and u.login_id != concat(u.login_id, '-', (t.max_id + 1))
	and tt.id is null;

# 更新新管理员为系统管理员
#select u.* from
update 
user_staff u 
set u.is_init = 0
where u.wid > 0 and u.is_system = 1 and u.is_init = 2 and u.deleted = 0;

# 删除临时表
drop table if exists __tmp_biz_wids__;


################################################################################################### 更新完成

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';