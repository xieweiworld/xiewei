# 初始化默认的平台的微信通知模版数据

############################################
##################### 正式环境
############################################
# 2017-02-24 重新整理本数据表，可以重新生成
set @wid = 211; # 【正式环境】平台公众号wid

set @type1 = 1;	# 商户，有时会含车主
set @type2 = 2; # 车主
set @type3 = 3; # 平台

set @enabled = 1; # 已启用
set @deleted = 1; # 已删除

# Mark as deleted
update customer_weixin_template
set 
	is_enable = 0,
	is_delete = 1, 
	code = concat('[', code, ']'), 
	update_date = now(), 
	update_by = concat(update_by, ',RD'), 
	send_wid = -send_wid
where send_wid = @wid;

# Remove old ones
# delete from customer_weixin_template where send_wid < 0;

# Sample Sql
#insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
#value(now(), 'init', @wid, 1, 'CODE', 'TITLE', 'POST_DATA', 'TEMPLATE_ID', @enabled, !@deleted);

############################################
##################### 商户接收的微信通知模版
############################################
/*
# 计次消费通知 - 2017-05-25 下线，由 消费成功通知 替换
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM202322532', '计次消费通知', 
'{{first.DATA}}
卡号：{{keyword1.DATA}}
消费时间：{{keyword2.DATA}}
剩余次数：{{keyword3.DATA}}
有效期：{{keyword4.DATA}}
{{remark.DATA}}
', '_FKjG2EWd39YiBMefmFbHm_X_aeJnkaP-FbHJ80YLmg', !@enabled, @deleted);

# 储值卡消费通知 - 2017-05-25 下线，由 消费成功通知 替换
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM200543224', '储值卡消费通知', 
'{{first.DATA}}
消费时间：{{keyword1.DATA}}
消费地址：{{keyword2.DATA}}
消费金额：{{keyword3.DATA}}
账户余额：{{keyword4.DATA}}
{{remark.DATA}}', 
'I7RlUBWZlmXHFOiO3gJfU95_UK288J_pvXF69GSK8h4', !@enabled, @deleted);
*/

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM207679795', '新订单提醒', 
'{{first.DATA}}
订单编号：{{keyword1.DATA}}
订单金额：{{keyword2.DATA}}
客户姓名：{{keyword3.DATA}}
客户电话：{{keyword4.DATA}}
下单时间：{{keyword5.DATA}}
{{remark.DATA}}', 
'JkfpoMD-W75V7bZxWDhtcHox7eGOtBw9BmZ7XZON1Yk', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type1, 'OPENTM409890816', '充值成功提醒', 
'{{first.DATA}}
门店名称：{{keyword1.DATA}}
充值内容：{{keyword2.DATA}}
充值时间：{{keyword3.DATA}}
实收金额：{{keyword4.DATA}}
车主信息：{{keyword5.DATA}}
{{remark.DATA}}', 
'KDgPYosLZ8WdeJ0-14vo8lnaEcJONqdZjQ18xsHISW4', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM405544716', '收款成功通知', 
'{{first.DATA}}
收款商户：{{keyword1.DATA}}
收款金额：{{keyword2.DATA}}
收款时间：{{keyword3.DATA}}
{{remark.DATA}}', 
'SszJJDZt2UlWmi6_K9pI26-7oplr1lBl1nobYGIOi_Q', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type1, 'OPENTM409939493', '消费成功通知', 
'{{first.DATA}}
会员卡号：{{keyword1.DATA}}
消费内容：{{keyword2.DATA}}
消费时间：{{keyword3.DATA}}
卡内余额：{{keyword4.DATA}}
卡有效期：{{keyword5.DATA}}
{{remark.DATA}}', 
'aO0pjr9C7pQiE6ZUQmmdeVja1l4a9ft7V5dGKC23pwM', @enabled, !@deleted);

/*
# 退款成功通知 - 2017-05-25 下线
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM400337537', '退款成功通知', 
'{{first.DATA}}
订单号：{{keyword1.DATA}}
服务项目：{{keyword2.DATA}}
退款金额：{{keyword3.DATA}}
{{remark.DATA}}', 
'7t9A4nYq4IuBct943WyRidMut2TqHLgnMetYY-exXic', !@enabled, @deleted);
*/

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type1, 'OPENTM406475124', '服务预约提醒', 
'{{first.DATA}}
车牌号码：{{keyword1.DATA}}
车主姓名：{{keyword2.DATA}}
车主电话：{{keyword3.DATA}}
预约时间：{{keyword4.DATA}}
服务项目：{{keyword5.DATA}}
{{remark.DATA}}', 
'GE26p_MJaAf5oW1Mf8cPGKsaBZDy8jLxfOIMPA4xoGQ', @enabled, !@deleted);

/*
# 预约受理通知 - 2017-05-25 下线
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type1, 'OPENTM401266648', '预约受理通知', 
'{{first.DATA}}
预约门店：{{keyword1.DATA}}
预约服务：{{keyword2.DATA}}
预约时间：{{keyword3.DATA}}
{{remark.DATA}}', 
'ctPTRMW_X8GVmj-tAnCPaQedINnSTMAJQiTbh3BK5Kw', !@enabled, @deleted);
*/


############################################
##################### 车主接收的微信通知模版
############################################
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type2, 'OPENTM206165478', '反馈信息提醒', 
'{{first.DATA}}
信息类型：{{keyword1.DATA}}
提交日期：{{keyword2.DATA}}
{{remark.DATA}}', 
'mKwCcXNTF4HKRruZ4GR2kRvRXHWMoQRJBzw6T9s1ACM', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type2, 'OPENTM409890795', '下单成功通知', 
'{{first.DATA}}
订单编号：{{keyword1.DATA}}
订单金额：{{keyword2.DATA}}
商品信息：{{keyword3.DATA}}
核销码：{{keyword4.DATA}}
{{remark.DATA}}', 
'4bsS9uaq6xtjy3Qi1lXToYz7X0j7WA74UicjXLdWZNU', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type2, 'OPENTM409890833', '充值成功通知', 
'{{first.DATA}}
会员信息：{{keyword1.DATA}}
会员卡号：{{keyword2.DATA}}
充值内容：{{keyword3.DATA}}
充值时间：{{keyword4.DATA}}
卡有效期：{{keyword5.DATA}}
{{remark.DATA}}', 
'fai5iNhK2fKobwW7a0MchiaBXSDZNtcPhvFvgEQugkk', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type2, 'OPENTM409890810', '预约成功通知', 
'{{first.DATA}}
预约门店：{{keyword1.DATA}}
预约服务：{{keyword2.DATA}}
预约时间：{{keyword3.DATA}}
{{remark.DATA}}', 
'eJaJC_jyL_RGJ5CWpGf2ValUiXTo2nrLcH_5rPUWVTo', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-25 10:44:40', 'init', @wid, @type2, 'OPENTM409890878', '完工提车通知', 
'{{first.DATA}}
车辆信息：{{keyword1.DATA}}
服务项目：{{keyword2.DATA}}
完工时间：{{keyword3.DATA}}
{{remark.DATA}}', 
'sIjFh_Zl7CD98j39C06ISl3iT4_XDe17v9jO3wB6DTk', @enabled, !@deleted);

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-05-18 10:25:57', 'init', @wid, @type2, 'OPENTM401684051', '服务状态提醒', 
'{{first.DATA}}
服务名称：{{keyword1.DATA}}
服务进度：{{keyword2.DATA}}
{{remark.DATA}}', 
'6R2f5d_728rc68LSaYg7J0TFCOP8oviJlZ51a22UDyY', @enabled, !@deleted);


############################################
##################### 平台专用的微信通知模版
############################################
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type3, 'OPENTM401424765', '公众号授权提醒', 
'{{first.DATA}}
授权事项：{{keyword1.DATA}}
授权时间：{{keyword2.DATA}}
授权编码：{{keyword3.DATA}}
{{remark.DATA}}', 
'hx8PzHfMVP-cgktQAoANFuTfxB6DP1iNJkN-p1W9ZKM', @enabled, !@deleted);

/*
# 交易提醒 - 2017-05-25 下线
insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type3, 'OPENTM200697515', '(收银)交易提醒', 
'{{first.DATA}}
服务商户：{{keyword1.DATA}}
交易类型：{{keyword2.DATA}}
交易订单：{{keyword3.DATA}}
交易时间：{{keyword4.DATA}}
消费金额：{{keyword5.DATA}}
{{remark.DATA}}', 
'QGG1aXeVvGcgnDjwo6wlsF4rr3WxZhPUpfd7fgP-i_0', !@enabled, @deleted);
*/

insert into customer_weixin_template(add_date, add_by, send_wid, type, code, title, post_data, template_id, is_enable, is_delete)
value('2017-03-01 15:30:27', 'init', @wid, @type3, 'OPENTM202024061', '注册成功通知', 
'{{first.DATA}}
用户名：{{keyword1.DATA}}
注册时间：{{keyword2.DATA}}
{{remark.DATA}}', 
'KxBtAsBvTXKyIVTkoMqhlPblzhPJbo-Gd_axtLq9AN4', @enabled, !@deleted);


############################################
##################### 更新post_data的md5值
############################################
update customer_weixin_template
set md5_code = md5(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(upper(post_data), CHAR(10), ''), CHAR(13), ''), char(32), ''), '\\r', ''), '\\n', ''))
where post_data is not null and post_data != '' and (md5_code = '' or md5_code is null);

select 'Re-init Data' as 'Title', @wid as 'WID', 'customer_weixin_template' as 'Table', 'Done' as 'Status';
