# 初始化默认的商品模版数据

# 2017-05-12

# 默认的 sys_product_template 模版数据
set @wid = 0;

delete from sys_product_template where wid = @wid;

set @index = 1;
set @interval = 1;

# 已经启用的

insert into sys_product_template(add_date,add_by,wid,name,content,is_enable,sort_no) value(now(),'init',@wid,'精品模板', 'static/malltemplates/template2.html', 1, @index);
set @index = @index + @interval;

insert into sys_product_template(add_date,add_by,wid,name,content,is_enable,sort_no) value(now(),'init',@wid,'会员卡模板', 'static/malltemplates/template1.html', 1, @index);
set @index = @index + @interval;

insert into sys_product_template(add_date,add_by,wid,name,content,is_enable,sort_no) value(now(),'init',@wid,'服务项目模板
','static/malltemplates/template3.html', 1, @index);
set @index = @index + @interval;

# 2017-05-12

select * from sys_product_template where wid = @wid order by id asc;

select 'Re-init Data' as 'Title', @wid as 'WID', 'sys_product_template' as 'Table', 'Done' as 'Status';