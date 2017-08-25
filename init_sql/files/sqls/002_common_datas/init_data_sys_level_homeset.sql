# 初始化默认的商户用户级别默认首页区块信息

# 2016-11-18

# 默认的 sys_level_homeset 参数数据
set @level_id = 0;

delete from sys_level_homeset where level_id = 0;

set @index = 10;
set @interval = 2;

# 已经启用的
insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'HYBK','会员办卡', '直接打开办卡页面', 0, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'YYE','营业日报', '数据中心的“营业日报”', 0, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'WXFX','微信粉丝', '“微信粉丝”页面', 0, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'DCLYY','待处理预约', '预约订单（待核销页）', 0, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'DCLSCDD','待处理商城订单', '商城订单（待处理订单页）', 0, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'WXLY','待回复微信留言', '微信消息页', 0, @index);
set @index = @index + @interval;


## 暂未启用的
insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'GZ','当前挂账', '“挂账管理”页面', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'MEMBER','会员总数', '“会员管理”页面', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'SKKD','散客开单', '散客开单', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'KCYJ','库存预警', '库存预警页面（需要做一个）', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'WXQF','微信群发', '微信群发页面', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'DXQF','短信群发', '短信群发页面', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'DSYLB','待收银列表', '代收银列表页', 1, @index);
set @index = @index + @interval;

insert into sys_level_homeset(add_date,add_by,level_id,code,name,remark,is_delete,sort_no) value(now(),'init',@level_id,'DCKLB','待出库列表', '待出库列表页', 1, @index);
set @index = @index + @interval;


# 2016-11-18

select * from sys_level_homeset where level_id = @level_id order by id asc;

select 'Re-init Data' as 'Title', 'sys_level_homeset' as 'Table', 'Done' as 'Status';
