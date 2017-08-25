
# 用 MySQL-Front 可能无法执行此脚本

# 需要通过 MySQLWorkbench(推荐) 或 NavicatForMySql 或 SQLPro Studio 或 通过 phpMyAdmin 在线站点 执行此脚本

### 3035, 1789, 319
### 钣喷部、轮胎部

# call __proc__add_virtual_user_staff(wid, name);

drop procedure if exists __proc__add_virtual_user_staff;

DELIMITER //; 
# in_wid: 	正整数值，商户号
# in_dept:  字符串，部门名称

CREATE PROCEDURE __proc__add_virtual_user_staff(in in_wid int, in in_dept varchar(20))
PROC_START_POINT: BEGIN

	if in_wid is null or in_wid = '' or in_wid <= 0 then
		set in_wid = 0;
	end if;

	if in_dept is null or trim(in_dept) = '' then
		set in_dept = '';
	end if;

	if in_wid = 0 then
		select '参数错误(in_wid)：商户号必须为正整数' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	set @wid = ifnull((select max(id) from pubs where id = in_wid), 0);

	if @wid = 0 then
		select concat('商户号(', in_wid, ')不存在！') as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	if length(in_dept) <= 0 then
		select '参数错误(in_dept)：部门名称不能为空' as ERROR;
		LEAVE PROC_START_POINT;
	end if;


	# select in_wid as '商户号wid', in_dept as '虚拟员工', '正在添加虚拟员工......' as STATUS;

	set @name_suffix = '';
	set @mobile_min = 13000000000;

	### 将不存在的部门写入部门表中：可重复执行，但不重复写入

	#### 开始
	set @wid = in_wid;
	set @dept = in_dept;

	############ 写入新部门，但不重复写入
	insert into user_staff_dep(wid, name)
	select t.wid, t.name /*, d.wid, d.name*/ from (select @wid as wid, @dept as name) t left join user_staff_dep d on t.wid = @wid and t.wid = d.wid and d.name = @dept 
	where d.wid is null;
	# 获取新部门 id
	set @dept_id = (select id from user_staff_dep where wid = @wid and name = @dept);
	# 虚拟员工 id, pwd
	set @login_id = concat('virtual_', @wid, '_', @dept_id);  # 'virtual_3035_214'
	set @login_pwd = concat('virtual# 4000 #', @wid);  # 'virtual# 4000 #214'
	# 虚拟员工 mobile
	set @mobile = ifnull((select max(mobile)+1 from user_staff where wid = @wid and deleted = 3), @mobile_min);
	# 避免重复添加虚拟员工，但不将旧的标记为'已删除'
	# update user_staff set wid = -wid and deletd = 1, remark = concat(remark, '虚拟员工被标记为已删除') where wid = @wid and login_id = @login_id and deleted = 3;
	set @user_id = ifnull((select max(id) from user_staff where wid = @wid and (name = @dept or login_id = @login_id) and deleted = 3), 0);
	if @user_id = 0 then
		# 写入新虚拟员工
		INSERT INTO `user_staff` (`wid`, `name`, `mobile`, `dept_id`, `dept_name`, `is_verified`, `login_id`, `password`, `is_system`, `role_code`, `profile`, `created_at`, `remark`, `deleted`, `agrees`)
		VALUES (@wid, @dept, @mobile, @dept_id, @dept, 0, @login_id, @login_pwd, 1, 'sys_admin', '虚拟员工', now(), '虚拟员工', 3, 0);
		select @wid as '商户号wid', @dept as '虚拟员工', '已添加虚拟员工' as STATUS;
	else
		select @wid as '商户号wid', @dept as '虚拟员工', @user_id as '员工ID', '不重复添加虚拟员工' as STATUS;
	end if;

	# select * from user_staff_dep where wid = @wid and name = @dept;
	# select * from user_staff where wid = @wid and dept_name = @dept and deleted = 3;

	#### 结束
END //; 
DELIMITER ;


# 删除proc
# drop procedure if exists __proc__add_virtual_user_staff;

select 'Done for __proc__add_virtual_user_staff.sql' as 'STATUS';
