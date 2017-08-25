# 初始化默认的商户 预约设置表 信息

# 默认的 wmall_reserve_set 分类数据

# select * from wmall_reserve_set where wid = 0;

set @now = now();

set @wid = 0;

delete from wmall_reserve_set where wid = @wid;

# 2017-06-01

insert into wmall_reserve_set(wid, add_date, add_by, type, code, name, start_time, end_time, intervals, limit_count, total_count,is_enable)
value(@wid, @now, 'init', '1', '1', '工作日(上午)', '08:00:00', '12:00:00', 60, 3, 12, 1);

insert into wmall_reserve_set(wid, add_date, add_by, type, code, name, start_time, end_time, intervals, limit_count, total_count,is_enable)
value(@wid, @now, 'init', '1', '2', '工作日(下午)', '12:00:00', '18:00:00', 60, 2, 12, 1);

insert into wmall_reserve_set(wid, add_date, add_by, type, code, name, start_time, end_time, intervals, limit_count, total_count,is_enable)
value(@wid, @now, 'init', '2', '1', '休息日(上午)', '08:00:00', '12:00:00', 60, 3, 9, 1);

insert into wmall_reserve_set(wid, add_date, add_by, type, code, name, start_time, end_time, intervals, limit_count, total_count,is_enable)
value(@wid, @now, 'init', '2', '2', '休息日(下午)', '12:00:00', '18:00:00', 60, 4, 24, 1);

# 2017-06-01

select 'Re-init Data' as 'Title', @wid as 'WID', 'wmall_reserve_set' as 'Table', 'Done' as 'Status';
