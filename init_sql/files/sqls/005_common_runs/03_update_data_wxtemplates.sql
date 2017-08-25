# 初始化数据

# 2017-02-24

# 微信推送通知初始化

##### 注意wid,send_wid的各类值：

###################################################################################
###################  以下为正式平台初始化数据 #########################################
###################################################################################
# 关闭掉收银消息模版
update wx_msg_template set state = 0 where state = 1 and code = 'OPENTM200697515';

##### 1、初始化默认商户(wid=0)使用的模版id，由平台(send_wid=211)发送
set @wid = 0; set @send_wid = 211;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where t.id is null;
# 将默认商户模版中的'一键授权提醒' 、 '注册成功通知' 与 '收银消息提醒' 更新为平台使用
update customer_weixin_template
set type = 3
where wid = @wid and type = 1 and code in ('OPENTM401424765', 'OPENTM202024061', 'OPENTM200697515');
# 将默认商户模版中的'反馈信息提醒'更新为车主使用
update customer_weixin_template
set type = 2
where wid = @wid and type = 1 and code = 'OPENTM206165478';
# 将默认商户模版中的'收银消息提醒'更新为已停用、已删除
update customer_weixin_template
set is_enable = 0, is_delete = 1
where wid = @wid and code = 'OPENTM200697515';


##### 2、初始化平台(wid=211)使用的模版id，由平台(send_wid=211)发送
set @wid = 211; set @send_wid = 211;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where f.state = 0 and t.id is null;


##### 3、初始化管家(wid=689)使用的模版id，由管家(send_wid=689)发送
set @wid = 689; set @send_wid = 689;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.gj_template_id as template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where f.state = 1 and t.id is null;


##### 4、初始化其他商户使用的模版id，由商户自己或平台(send_wid=211 或 689)发送
set @wid1 = 211;
set @wid2 = 689;
# 三类模版不转入到商户下：注册成功通知、一键授权通知、收银交易记录
drop table if exists __tmp_customer_weixin_tempates__;
create temporary table __tmp_customer_weixin_tempates__
select id, wid, max(send_wid) as send_wid, type, code, title, post_data, max(template_id) as template_id, is_enable, is_delete
from (
	select distinct tid as id, wid,
	ifnull(send_wid, 
	case 
	when t.template_id = m.template_id then @wid1
	when t.template_id = m.gj_template_id then @wid2
	else t.wid
	end) as send_wid, 
	1 as type, m.code, m.title, m.post_data, 
	t.template_id,
	1 as is_enable, 0 as is_delete
	from wx_template_notice t inner join wx_msg_template m on t.tid = m.id
	where wid > 0 and m.code not in ('OPENTM401424765', 'OPENTM202024061', 'OPENTM200697515')
) t 
group by id, wid, type, code, title, post_data, is_enable, is_delete;
# 相等的
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select distinct id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, now() as add_date, 'init' as add_by
from __tmp_customer_weixin_tempates__
where wid = send_wid and concat(id, '_', wid) not in (
	select concat(id, '_', wid) from customer_weixin_template
);
# 先删除重复的
delete from __tmp_customer_weixin_tempates__
where concat(id, '_', wid) in (
	select concat(id, '_', wid) from customer_weixin_template
);
# 不等的
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select distinct id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, now() as add_date, 'init' as add_by
from __tmp_customer_weixin_tempates__
where wid != send_wid and concat(id, '_', wid) not in (
	select concat(id, '_', wid) from customer_weixin_template
);
drop table if exists __tmp_customer_weixin_tempates__;
# 将其他商户模版中的'反馈信息提醒'更新为车主使用
update customer_weixin_template
set type = 2
where wid > 0 and wid != @wid1 and wid != @wid2 and type = 1 and code = 'OPENTM206165478';
# 将默认商户模版中的'收银消息提醒'更新为已停用、已删除
update customer_weixin_template
set is_enable = 0, is_delete = 1
where code = 'OPENTM200697515';


##### 5、初始化商户的接收人信息
# 无 send_wid 的商户大部分可确定是商户自己，极少的商户或是单条记录的无法确定，暂以商户自己为准
# 可支持接收人删除后重新绑定
insert into customer_notice_receiver(wid, usid, send_wid, receive_wxid, nickname, headimgurl, is_rebind, is_delete, add_date, add_by)
select wid, usid, send_wid, receive_wxid, nickname, headimgurl, is_rebind, is_delete, now() as add_date, 'transfer' as add_by from (
select wid, usid, send_wid, receive_wxid, max(nickname) as nickname, headimgurl, is_rebind, is_delete from (
	select distinct f.wid, 0 as usid, ifnull(f.send_wid, f.wid) as send_wid, f.wxid as receive_wxid, f.nickname, '' as headimgurl, 0 as is_rebind, 0 as is_delete
	# , t.id
	from wx_template_notice f
	left join customer_notice_receiver t on f.wid = t.wid and f.wxid = t.receive_wxid
	where f.wid > 0 and t.id is null #and f.nickname is not null
) t
group by wid, usid, send_wid, receive_wxid, headimgurl, is_rebind, is_delete) f
order by wid asc;
# 初始化接收人的头像信息
#select distinct r.wid, r.receive_wxid, r.headimgurl, t.heading_img from
update
customer_notice_receiver r
inner join (
	select distinct fs.wid, fs.wid_wxid, heading_img, headimgurl from 
	customer_notice_receiver tn
	inner join customer_wx_fans fs on tn.send_wid = fs.wid and tn.receive_wxid = fs.wid_wxid
	where fs.wid > 0 and fs.heading_img != '' and (tn.headimgurl = '' or tn.headimgurl is null)
) t on r.send_wid = t.wid and r.receive_wxid = t.wid_wxid
set r.headimgurl = t.heading_img
;

#select distinct r.wid, r.receive_wxid, r.headimgurl, t.heading_img from
update
customer_notice_receiver r
inner join (
	select distinct fs.wid, fs.wid_wxid, heading_img, headimgurl from 
	customer_notice_receiver tn
	inner join customer_wx_fans fs on tn.wid = fs.wid and tn.receive_wxid = fs.wid_wxid
	where fs.wid > 0 and fs.heading_img != '' and (tn.headimgurl = '' or tn.headimgurl is null)
) t on r.wid = t.wid and r.receive_wxid = t.wid_wxid
set r.headimgurl = t.heading_img
;

##### 6、初始化商户的接收人的绑定通知信息
insert into customer_receiver_template(wid, rid, tid)
select distinct r.wid, r.id as rid, f.tid as tid
#, t.id
from wx_template_notice f
inner join customer_notice_receiver r on f.wid > 0 and f.wid = r.wid and f.wxid = r.receive_wxid
left join customer_receiver_template t on f.wid = t.wid and r.id = t.rid and f.tid = t.tid
where t.id is null or t.id = '';


# 查找有重复的接收人
select r.* from customer_notice_receiver r
inner join (select receive_wxid, wid, count(id) as total from customer_notice_receiver group by receive_wxid, wid having total > 1) t 
on r.wid = t.wid and r.receive_wxid = t.receive_wxid;


###################################################################################
###################  以下为测试平台初始化数据 #########################################
###################################################################################
/*


# 关闭掉收银消息模版
update wx_msg_template set state = 0 where state = 1 and code = 'OPENTM200697515';

##### 1、初始化默认商户(wid=0)使用的模版id，由平台(send_wid=127)发送
set @wid = 0; set @send_wid = 127;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where t.id is null;
# 将默认商户模版中的'一键授权提醒' 、 '注册成功通知' 与 '收银消息提醒' 更新为平台使用
update customer_weixin_template
set type = 3
where wid = @wid and type = 1 and code in ('OPENTM401424765', 'OPENTM202024061', 'OPENTM200697515');
# 将默认商户模版中的'反馈信息提醒'更新为车主使用
update customer_weixin_template
set type = 2
where wid = @wid and type = 1 and code = 'OPENTM206165478';
# 将默认商户模版中的'收银消息提醒'更新为已停用、已删除
update customer_weixin_template
set is_enable = 0, is_delete = 1
where wid = @wid and code = 'OPENTM200697515';


##### 2、初始化平台(wid=127)使用的模版id，由平台(send_wid=127)发送
set @wid = 127; set @send_wid = 127;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where f.state = 0 and t.id is null;


##### 3、初始化管家(wid=370)使用的模版id，由管家(send_wid=370)发送
set @wid = 370; set @send_wid = 370;
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select f.id, @wid as wid, @send_wid as send_wid, 1 as type, f.code, f.title, f.post_data, f.gj_template_id as template_id, 1 as is_enable, 0 as is_delete, now() as add_date, 'init' as add_by
#, t.id as tid
from wx_msg_template f
left join customer_weixin_template t on f.code = t.code and t.wid = @wid
where f.state = 1 and t.id is null;


##### 4、初始化其他商户使用的模版id，由商户自己或平台(send_wid=127 或 370)发送
set @wid1 = 127;
set @wid2 = 370;
# 三类模版不转入到商户下：注册成功通知、一键授权通知、收银交易记录
drop table if exists __tmp_customer_weixin_tempates__;
create temporary table __tmp_customer_weixin_tempates__
select id, wid, max(send_wid) as send_wid, type, code, title, post_data, max(template_id) as template_id, is_enable, is_delete
from (
	select distinct tid as id, wid,
	ifnull(send_wid, 
	case 
	when t.template_id = m.template_id then @wid1
	when t.template_id = m.gj_template_id then @wid2
	else t.wid
	end) as send_wid, 
	1 as type, m.code, m.title, m.post_data, 
	t.template_id,
	1 as is_enable, 0 as is_delete
	from wx_template_notice t inner join wx_msg_template m on t.tid = m.id
	where wid > 0 and m.code not in ('OPENTM401424765', 'OPENTM202024061', 'OPENTM200697515')
) t 
group by id, wid, type, code, title, post_data, is_enable, is_delete;
# 相等的
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
select distinct id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, now() as add_date, 'init' as add_by
from __tmp_customer_weixin_tempates__
where wid = send_wid and concat(id, '_', wid) not in (
	select concat(id, '_', wid) from customer_weixin_template
);
# 先删除重复的
delete from __tmp_customer_weixin_tempates__
where concat(id, '_', wid) in (
	select concat(id, '_', wid) from customer_weixin_template
);
# 不等的
insert into customer_weixin_template(id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select distinct id, wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, now() as add_date, 'init' as add_by
from __tmp_customer_weixin_tempates__
where wid != send_wid and concat(id, '_', wid) not in (
	select concat(id, '_', wid) from customer_weixin_template
);
drop table if exists __tmp_customer_weixin_tempates__;
# 将其他商户模版中的'反馈信息提醒'更新为车主使用
update customer_weixin_template
set type = 2
where wid > 0 and wid != @wid1 and wid != @wid2 and type = 1 and code = 'OPENTM206165478';
# 将默认商户模版中的'收银消息提醒'更新为已停用、已删除
update customer_weixin_template
set is_enable = 0, is_delete = 1
where code = 'OPENTM200697515';


##### 5、初始化商户的接收人信息
# 无 send_wid 的商户大部分可确定是商户自己，极少的商户或是单条记录的无法确定，暂以商户自己为准
# 可支持接收人删除后重新绑定
insert into customer_notice_receiver(wid, usid, send_wid, receive_wxid, nickname, headimgurl, is_rebind, is_delete, add_date, add_by)
select wid, usid, send_wid, receive_wxid, nickname, headimgurl, is_rebind, is_delete, now() as add_date, 'transfer' as add_by from (
select wid, usid, send_wid, receive_wxid, max(nickname) as nickname, headimgurl, is_rebind, is_delete from (
	select distinct f.wid, 0 as usid, ifnull(f.send_wid, f.wid) as send_wid, f.wxid as receive_wxid, f.nickname, '' as headimgurl, 0 as is_rebind, 0 as is_delete
	# , t.id
	from wx_template_notice f
	left join customer_notice_receiver t on f.wid = t.wid and f.wxid = t.receive_wxid
	where f.wid > 0 and t.id is null #and f.nickname is not null
) t
group by wid, usid, send_wid, receive_wxid, headimgurl, is_rebind, is_delete) f
order by wid asc;
# 初始化接收人的头像信息
#select distinct r.wid, r.receive_wxid, r.headimgurl, t.heading_img from
update
customer_notice_receiver r
inner join (
	select distinct fs.wid, fs.wid_wxid, heading_img, headimgurl from 
	customer_notice_receiver tn
	inner join customer_wx_fans fs on tn.send_wid = fs.wid and tn.receive_wxid = fs.wid_wxid
	where fs.wid > 0 and fs.heading_img != '' and (tn.headimgurl = '' or tn.headimgurl is null)
) t on r.send_wid = t.wid and r.receive_wxid = t.wid_wxid
set r.headimgurl = t.heading_img
;

#select distinct r.wid, r.receive_wxid, r.headimgurl, t.heading_img from
update
customer_notice_receiver r
inner join (
	select distinct fs.wid, fs.wid_wxid, heading_img, headimgurl from 
	customer_notice_receiver tn
	inner join customer_wx_fans fs on tn.wid = fs.wid and tn.receive_wxid = fs.wid_wxid
	where fs.wid > 0 and fs.heading_img != '' and (tn.headimgurl = '' or tn.headimgurl is null)
) t on r.wid = t.wid and r.receive_wxid = t.wid_wxid
set r.headimgurl = t.heading_img
;

##### 6、初始化商户的接收人的绑定通知信息
insert into customer_receiver_template(wid, rid, tid)
select distinct r.wid, r.id as rid, f.tid as tid
#, t.id
from wx_template_notice f
inner join customer_notice_receiver r on f.wid > 0 and f.wid = r.wid and f.wxid = r.receive_wxid
left join customer_receiver_template t on f.wid = t.wid and r.id = t.rid and f.tid = t.tid
where t.id is null or t.id = '';


# 查找有重复的接收人
select r.* from customer_notice_receiver r
inner join (select receive_wxid, wid, count(id) as total from customer_notice_receiver group by receive_wxid, wid having total > 1) t 
on r.wid = t.wid and r.receive_wxid = t.receive_wxid;


*/

select '03_update_data_wxtemplates Finished' as 'DONE';

# 2017-02-24
