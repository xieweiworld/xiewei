# 初始化默认的商户 个人中心设置表 信息

# 默认的 wmall_set_member 分项数据

# select * from wmall_set_member;

set @index = 10;
set @interval = 2;

set @wid = 0;

delete from wmall_set_member where wid = @wid;

# 头像及昵称 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','Nickname','头像及昵称',1,1,@index);
set @index = @index + @interval;

# 储值卡余额 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','ValueCard','储值卡余额',1,1,@index);
set @index = @index + @interval;

# 我的会员卡 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','MemberCard','我的会员卡',1,1,@index);
set @index = @index + @interval;

# 我的预约 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','ReserveList','我的预约',0,1,@index);
set @index = @index + @interval;

# 我的订单 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','OrderList','我的订单',1,1,@index);
set @index = @index + @interval;

# 我的爱车 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','AutoList','我的爱车',1,1,@index);
set @index = @index + @interval;

# 我的卡券 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','CouponList','我的卡券',0,1,@index);
set @index = @index + @interval;

# 服务记录 - 2016-12-07
insert into wmall_set_member(wid,add_date,add_by,code,name,is_system,is_enable,sort_no) value(@wid,'2016-12-07 17:12:16','init','ServiceList','服务记录',0,1,@index);
set @index = @index + @interval;

# select * from wmall_set_member;

select 'Re-init Data' as 'Title', @wid as 'WID', 'wmall_set_member' as 'Table', 'Done' as 'Status';
