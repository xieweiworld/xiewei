
# 用 MySQL-Front 可能无法执行此脚本

# 需要通过 MySQLWorkbench(推荐) 或 NavicatForMySql 或 SQLPro Studio 或 通过 phpMyAdmin 在线站点 执行此脚本

/*
	功能：商户角色中，具备某个权限(in_base_code)的角色，则给该角色添加上指定角色(in_right_code)！
*/

# call __proc__add_right_to_customer_role_rights_by_right_code('Members/Index', '');

drop procedure if exists __proc__add_right_to_customer_role_rights_by_right_code;

DELIMITER //; 
# in_base_code:  已拥有的权限码
# in_right_code:  待添加的权限码

CREATE PROCEDURE __proc__add_right_to_customer_role_rights_by_right_code(in in_base_code varchar(100), in in_right_code varchar(100))
PROC_START_POINT: BEGIN

	if in_base_code is null or trim(in_base_code) = '' then
		set in_base_code = '';
	end if;

	if in_right_code is null or trim(in_right_code) = '' then
		set in_right_code = '';
	end if;

	if in_right_code = '' then
		select '参数错误(in_base_code)：权限代码不能为空' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	if in_right_code = '' then
		select '参数错误(in_right_code)：权限代码不能为空' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	# 检测基础权限码是否存在
	set @right_code_base = in_base_code;
	set @right_id = ifnull((select id from sys_right where right_code = @right_code_base limit 0,1), 0);
	if @right_id <= 0 then
		select @right_code_base as '权限代码', '权限代码不存在' as STATUS;
		LEAVE PROC_START_POINT;
	end if;

	# 检测基础权限码是否存在
	set @right_code_to_add = in_right_code;
	set @right_id = ifnull((select id from sys_right where right_code = @right_code_to_add limit 0,1), 0);
	if @right_id > 0 then
		select * from customer_role_right where right_code = @right_code_to_add order by wid asc;

		# 具备某权限的角色，添加新权限
		insert into customer_role_right(wid, role_code, right_code)
		select distinct m.wid, m.role_code, @right_code_to_add as right_code
		#, r.right_code
		from customer_role_right m
		left join customer_role_right r on m.wid = r.wid and m.role_code = r.role_code and r.right_code = @right_code_to_add
		where m.role_code != 'sys_manager' and m.right_code = @right_code_base and r.right_code is null;
		# sys_manager 权限 由 sys_admin 提供， sys_admin 权限 由商户级别提供
		
		set @row_count = ROW_COUNT();

		if @row_count > 0 then
			select @right_code_to_add as '权限代码', '已添加' as STATUS, @row_count as '新添加数量';
		else
			select @right_code_to_add as '权限代码', '已存在' as STATUS, @row_count as '新添加数量';
		end if;

	else
		select @right_code_to_add as '权限代码', '权限代码不存在' as STATUS;
		LEAVE PROC_START_POINT;
	end if;

	#### 结束
END //; 
DELIMITER ;


# 删除proc
# drop procedure if exists __proc__add_right_to_customer_role_rights_by_right_code;

select 'Done for __proc__add_right_to_customer_role_rights_by_right_code.sql' as 'STATUS';
