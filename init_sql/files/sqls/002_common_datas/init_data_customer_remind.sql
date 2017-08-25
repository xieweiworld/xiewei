# 初始化默认的关怀提醒设置表信息

# 2016-11-11

set @index = 10;
set @wid = 0;

delete from customer_remind where wid = @wid;

# 默认关怀提醒设置: 默认均不启用，默认发短信,也发微信
insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 1, 30, 1, 0, 1, '年检提醒', '【{smsname}】您的车辆（{cpai}）将于{date}年检到期，建议您近期安排年检事宜。', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 2, 30, 1, 0, 1, '保险提醒', '【{smsname}】您的车辆（{cpai}）将于{date}保险到期，请您带齐驾驶证、保险卡等资料，提前办好续保手续，电话：{tel}', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 3, '', 1, 0, 1, '保养提醒', '【{smsname}】您的车辆（{cpai}）距离上次{service}已有{month}，为确保您的出行顺畅，建议您届时到本店进行保养，联系电话：{tel}', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 4, 30, 1, 0, 1, '会员卡到期提醒', '【{smsname}】您的{service}{cardtype}将于{date}到期，建议您近期到我店消费，电话：{tel}', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 5, 100, 1, 0, 1, '储值卡余额提醒', '【{smsname}】您的储值卡（当前余额：{remain}元）已低于{amount}元，建议您及时办理充值业务。', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 6, 3, 1, 1, 0, '预约到店提醒', '【{smsname}】亲爱的会员，您预约的服务过两天就要到了，请提前安排时间到店给爱车体验项目哦。', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 7, 1, 1, 1, 0, '预约延期提醒', '【{smsname}】亲爱的会员，您预约的服务已过期了，如需要继续服务，请及时联系我们。', @index, '2016-11-11 11:00:01', 'init');
set @index = @index + 10;

# 2017-06-15
insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 8, 0, 1, 0, 1, '生日提醒', '【{smsname}】今天是您的生日，祝您生日快乐，心想事成。', @index, '2017-06-15 11:00:01', 'init');
set @index = @index + 10;

insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) value (@wid, 9, 30, 1, 0, 1, '驾驶证到期提醒', '【{smsname}】您的驾驶证将于{date}到期，建议您近期到车管所办理。', @index, '2017-06-15 11:00:01', 'init');
set @index = @index + 10;

select * from customer_remind where wid = @wid;

select 'Re-init Data' as 'Title', @wid as 'WID', 'customer_remind' as 'Table', 'Done' as 'Status';

# 2016-11-11
