
# 用 MySQL-Front 可能无法执行此脚本

# 需要通过 MySQLWorkbench(推荐) 或 NavicatForMySql 或 SQLPro Studio 或 通过 phpMyAdmin 在线站点 执行此脚本


# call __proc__add_right_to_all_sys_levels('');

drop procedure if exists __proc__add_right_to_all_sys_levels;

DELIMITER //; 
# right_code:  权限码

CREATE PROCEDURE __proc__add_right_to_all_sys_levels(in in_right_code varchar(100))
PROC_START_POINT: BEGIN

	if in_right_code is null or trim(in_right_code) = '' then
		set in_right_code = '';
	end if;

	if in_right_code = '' then
		select '参数错误(right_code)：权限代码不能为空' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	# 检测权限码是否存在
	set @right_code_to_add = in_right_code;
	set @right_id = ifnull((select id from sys_right where right_code = @right_code_to_add limit 0,1), 0);
	if @right_id > 0 then
		# 给所有商户级别添加此权限
		insert into sys_level_right(level_id, right_code, right_levels)
		select  tr.level_id, tr.right_code, 0 as right_levels
		from sys_level_right sr right join
		(select distinct level_id, @right_code_to_add as right_code from sys_customer_level) tr
		on sr.level_id = tr.level_id and sr.right_code = tr.right_code
		where (sr.right_code is null or sr.right_code = '');
		
		set @row_count = ROW_COUNT();

		select * from sys_level_right where right_code = @right_code_to_add order by level_id asc;

		if @row_count > 0 then
			select @right_code_to_add as '权限代码', '已添加' as STATUS, @row_count as 'COUNT';
		else
			select @right_code_to_add as '权限代码', '已存在' as STATUS;
		end if;

	else
		select @right_code_to_add as '权限代码', '权限代码不存在' as STATUS;
		LEAVE PROC_START_POINT;
	end if;

	#### 结束
END //; 
DELIMITER ;


# 删除proc
# drop procedure if exists __proc__add_right_to_all_sys_levels;

select 'Done for __proc__add_right_to_all_sys_levels.sql' as 'STATUS';
