# 初始化数据

# 商城新版业务

# 2017-04-07

# 默认将平台服务分类标记为删除，除以下四类外：
# 洗车(1001)、维修(1002)、保养(1003)、精品(1004)- 2017-05-17
update ditu_fuwu
set is_delete = 1
where is_delete = 0 and id not in (1001,1002,1003,1004);
# 新增四项
delete from ditu_fuwu where id in (1001,1002,1003,1004);
insert into ditu_fuwu(id, name, pid, pic, sort) value(1001, '洗车', 0, '../res/wmalls/type/car-wash.png', 10);
insert into ditu_fuwu(id, name, pid, pic, sort) value(1002, '维修', 0, '../res/wmalls/type/Maintenance.png', 20);
insert into ditu_fuwu(id, name, pid, pic, sort) value(1003, '保养', 0, '../res/wmalls/type/maintenance-wash.png', 30);
insert into ditu_fuwu(id, name, pid, pic, sort) value(1004, '精品', 0, '../res/wmalls/type/boutique.png', 40);
/*
# 将旧大类更新为新大类
# select distinct sys_ser1 from ditu_fuwu where sys_ser1 not in (1001, 1002, 1003, 1004, 1,28, 95, 275, 278, 280,2,3,4,94,272,273,274,276,277,105); # => 0
# 原数据不做转换，直接更新转换后的数据
update ditu_fuwu set sys_ser1 = 1001 where sys_ser1 = 1;
update ditu_fuwu set sys_ser1 = 1002 where sys_ser1 in (28, 95, 275, 278, 280);
update ditu_fuwu set sys_ser1 = 1003 where sys_ser1 in (2,3,4,94,272,273,274,276,277);
update ditu_fuwu set sys_ser1 = 1004 where sys_ser1 = 105;
*/

# 2017-05-10：将有国寿积分购买记录的商户，初始化为 pubs.is_chinalife = 1
update pubs p
inner join (select wid, from_unixtime(min(ctime)) as min_time from dsqgrecord where payment = 7 and wid > 0 group by wid) t on p.id = t.wid
set p.is_chinalife = 1, chinalife_date = t.min_time
where p.is_chinalife = 0;


# 2015-05-13 初始化商户分享设置信息
# mp_name
update pubs p
inner join user u on p.uid = u.id
set p.mp_name = u.mp_name
where (p.mp_name is null or p.mp_name = '') and u.mp_name != '' and u.mp_name is not null;
# share_title
update pubs
set share_title = mp_name
where share_title = '' and mp_name != '' and mp_name is not null;
# share_remark
update pubs
set share_remark = ''
where share_remark = '' and share_remark is not null;
# share_icon
update pubs
set share_icon = headpic
where share_icon = '' and headpic != '' and headpic is not null;

# 将会员积分明细中的 order_id 初始化为充值记录id - 2017-05-17
# select cd.id, cd.wid, cd.mid, cd.order_id, cd.order_code, cz.id, cz.order_id, cz.is_main, cz.type from
update
member_credit_detail cd
inner join member_card_chongzhi cz on cd.wid = cz.wid and cd.order_code = cz.order_id
inner join member_card mc on mc.wid = cz.wid and mc.id = cz.card_id
set cd.order_id = cz.id
where cz.order_id != 0 and cz.order_id is not null and cz.is_main = 1 and mc.is_give = 0 and cd.order_id != cz.id;

# 将接收者的旧通知CODE(计次消费通知:OPENTM202322532,储值卡消费通知:OPENTM200543224)更新为新通知CODE(消费成功通知:OPENTM409939493)
update customer_receiver_template
set code = 'OPENTM409939493'
where code = 'OPENTM202322532' or code = 'OPENTM200543224';
# 将接收者的旧通知CODE(预约受理通知:OPENTM401266648)更新为新通知CODE(服务预约提醒:OPENTM406475124)
update customer_receiver_template
set code = 'OPENTM406475124'
where code = 'OPENTM401266648';
# 将接收者的旧通知CODE(充值成功通知:OPENTM207777520)更新为新通知CODE(充值成功提醒:OPENTM409890816)
update customer_receiver_template
set code = 'OPENTM409890816'
where code = 'OPENTM207777520';
# 下线商户微信通知：退款成功通知(OPENTM400337537)、计次消费通知(OPENTM202322532),储值卡消费通知(OPENTM200543224),预约受理通知(OPENTM401266648),充值成功通知(OPENTM207777520)
update customer_weixin_template
set send_wid = -send_wid, code = concat('[', code, ']'), is_enable = 0, is_delete = 1, update_by = concat(update_by, ',RD')
where send_wid > 0 and code in ('OPENTM400337537', 'OPENTM202322532', 'OPENTM200543224', 'OPENTM401266648', 'OPENTM207777520');

# 初始化微信通知模版的md5_code
update customer_mp_templates
set md5_code = md5(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(upper(content), CHAR(10), ''), CHAR(13), ''), char(32), ''), '\\r', ''), '\\n', ''))
where content is not null and content != '' and (md5_code = '' or md5_code is null);
update customer_weixin_template
set md5_code = md5(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(upper(post_data), CHAR(10), ''), CHAR(13), ''), char(32), ''), '\\r', ''), '\\n', ''))
where post_data is not null and post_data != '' and (md5_code = '' or md5_code is null);


# 2017-05-10 给‘测试专用’级别加上特殊权限
# 平台功能 权限
set @level_id = 99;
set @right_code = 'Platform';
insert into sys_level_right(level_id, right_code, right_levels)
select  tr.level_id, tr.right_code, 0 as right_levels
from sys_level_right sr right join
(select distinct level_id, @right_code as right_code from sys_customer_level where level_id = @level_id) tr
on sr.level_id = tr.level_id and sr.right_code = tr.right_code
where (sr.right_code is null or sr.right_code = '');
# 系统设置 权限
set @right_code = 'Platform003';
insert into sys_level_right(level_id, right_code, right_levels)
select  tr.level_id, tr.right_code, 0 as right_levels
from sys_level_right sr right join
(select distinct level_id, @right_code as right_code from sys_customer_level where level_id = @level_id) tr
on sr.level_id = tr.level_id and sr.right_code = tr.right_code
where (sr.right_code is null or sr.right_code = '');
# 商户给别列表 权限
set @right_code = 'vendorLevel/vendorLevels';
insert into sys_level_right(level_id, right_code, right_levels)
select  tr.level_id, tr.right_code, 0 as right_levels
from sys_level_right sr right join
(select distinct level_id, @right_code as right_code from sys_customer_level where level_id = @level_id) tr
on sr.level_id = tr.level_id and sr.right_code = tr.right_code
where (sr.right_code is null or sr.right_code = '');


# 启用商户的服务项目
update customer_services
set is_yuyue = 1
where wid > 0 and is_yuyue = 0;

# 商户的提前预约时间(pre_date_hours)、个人中心显示名称、线上预约折扣
update customer_set
set pre_date_hours = 6
where wid > 0 and (pre_date_hours is null or pre_date_hours = 0);

update customer_set
set wx_center_name = '个人中心'
where wid > 0 and (wx_center_name is null or wx_center_name = '');

update customer_set
set online_discount = 10
where wid > 0 and (online_discount is null or online_discount = 0);


# 2017-04-07

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';

