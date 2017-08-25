# 初始化默认的商户 商品分类表 信息

# 默认的 wmall_set_home 分类数据

set @index = 10;
set @interval = 2;

set @wid = 0;

delete from wmall_set_home where wid = @wid;

# 2016-12-06
# 商品搜索
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Search','商品搜索','商品搜索','统定义分类',1,1,@index);
set @index = @index + @interval;

# 首页banner
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Banner','首页轮播图','首页轮播图','统定义分类',1,1,@index);
set @index = @index + @interval;

# 商品分类
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Category','商品分类','商品分类','统定义分类',1,1,@index);
set @index = @index + @interval;

# 商品抢购(2017-05-09确定先不上抢购功能)
#insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Snapup','商品抢购','商品抢购','统定义分类',1,1,@index);
#set @index = @index + @interval;

# 人气商品
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Hot','人气商品','人气商品','统定义分类',1,1,@index);
set @index = @index + @interval;

# 最新上线
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Latest','最新上线','最新上线','统定义分类',1,1,@index);
set @index = @index + @interval;

# 店长推荐
insert into wmall_set_home(wid,add_date,add_by,code,module,name,remark,is_system,is_enable,sort_no) value(@wid,'2016-12-06 16:12:16','init','Recommend','店长推荐','店长推荐','统定义分类',1,1,@index);
set @index = @index + @interval;

# select * from wmall_set_home;

select 'Re-init Data' as 'Title', @wid as 'WID', 'wmall_set_home' as 'Table', 'Done' as 'Status';
