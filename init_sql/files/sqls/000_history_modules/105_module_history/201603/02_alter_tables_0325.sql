#修改表结构的sql定义，存放在此文件中 
alter table res add column time int(11) null COMMENT '菜单保存时间';

#模板推送发送方wid
alter table wx_template_notice add column send_wid int(11) DEFAULT NULL COMMENT '发送方商户';

#主模板添加管家公众号模板id
alter table wx_msg_template add column gj_template_id varchar(64) DEFAULT NULL COMMENT '管家公众号的模板id';


#服务加名称
alter table fuwulist add column name varchar(255) DEFAULT NULL COMMENT '服务名称';

#初始化数据
set sql_safe_updates=0;
update fuwulist f inner join ditu_fuwu d on f.ser2=d.id set f.name=d.name where f.name is null;


#服务删除加入逻辑删除字段
alter table fuwulist add column is_online int(11) DEFAULT '0' COMMENT '0在售，1删除';