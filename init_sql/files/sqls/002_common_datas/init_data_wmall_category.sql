# 初始化默认的商户 商品分类表 信息

# 默认的 wmall_category 分类数据

set @index = 10;
set @interval = 2;

set @wid = 0;
delete from wmall_category where wid = @wid;

# 2016-12-05: 默认两类: 会员卡类，店长推荐类
# 会员卡 分类
insert into wmall_category(wid,add_date,add_by,code,name,icon,remark,is_system,is_enable,is_delete,sort_no) value(@wid,'2016-12-05 19:15:16','init','MemberCard','会员卡','/res/wmalls/type/member.png','系统定义分类',1,1,0,@index);
set @index = @index + @interval;

# 服务项目 分类
insert into wmall_category(wid,add_date,add_by,code,name,icon,remark,is_system,is_enable,is_delete,sort_no) value(@wid,'2017-05-25 18:40:16','init','ServiceItem','服务项目','/res/wmalls/type/Maintenance.png','默认定义分类',0,1,0,@index);
set @index = @index + @interval;

# 店长推荐分类
#insert into wmall_category(wid,add_date,add_by,code,name,icon,remark,is_system,is_enable,is_delete,sort_no) value(@wid,'2016-12-05 19:15:16','init','ManagerRecommend','店长推荐','/res/wmalls/type/recommend.png','系统定义分类',0,1,0,@index);
#set @index = @index + @interval;

select 'Re-init Data' as 'Title', @wid as 'WID', 'wmall_category' as 'Table', 'Done' as 'Status';
