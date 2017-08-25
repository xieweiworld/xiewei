# 初始化默认的配置表信息

# 2016-11-16

# 默认的 sys_parameter 参数数据
truncate table sys_parameter;

set @index = 10;

insert into sys_parameter(add_date,add_by,param_code,param_name,param_type,param_value,default_value,sort_no,is_available,remark) value('2016-11-16 17:46:16','init','AutoMakeRemindsTime','自动生成消息的开始时间',5,'02:00:00','02:00:00',@index,1,'自动生成消息的开始时间(凌晨2点)');
set @index = @index + 1;

insert into sys_parameter(add_date,add_by,param_code,param_name,param_type,param_value,default_value,sort_no,is_available,remark) value('2016-11-16 17:46:16','init','DailyRemindTime','每天开始提醒的时间',5,'10:00:00','10:00:00',@index,1,'每天开始提醒的时间(上午10点)');
set @index = @index + 1;

insert into sys_parameter(add_date,add_by,param_code,param_name,param_type,param_value,default_value,sort_no,is_available,remark) value('2016-11-16 17:46:16','init','EachRemindIntervals','每项提醒的时间间隔',2,30,30,@index,1,'每项提醒的时间间隔(30分钟)');
set @index = @index + 1;

insert into sys_parameter(add_date,add_by,param_code,param_name,param_type,param_value,default_value,sort_no,is_available,remark) value('2016-11-16 17:46:16','init','MinSendIntervals','同一手机号接收提醒的时间间隔',2,10,10,@index,1,'同一手机号接收提醒的时间间隔(10分钟)');
set @index = @index + 1;

insert into sys_parameter(add_date,add_by,param_code,param_name,param_type,param_value,default_value,sort_no,is_available,remark) value('2016-11-16 17:46:16','init','MaxSendAmount','每日最多接收提醒消息数',2,5,5,@index,1,'每日最多接收提醒消息数(5条)');
set @index = @index + 1;

# 2016-11-16

select * from sys_parameter;

select 'Re-init Data' as 'Title', 'sys_parameter' as 'Table', 'Done' as 'Status';
