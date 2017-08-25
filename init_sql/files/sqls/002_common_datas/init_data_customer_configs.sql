# 初始化默认的商户配置表信息

# 2016-10-20

set @wid = 0;  # 0表示是平台默认的数据

delete from customer_configs where wid = 0;

set @index = 10;

# 系统级
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isSafeLogin', 0, '是否需要安全登录(1:需要, 0:不需要)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;

# 下拉选账户级
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDisplayAdmin', 0, '是否显示‘管理员’用户(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isCurrentUser', 0, '是否默认为当前用户(1:当前用户, 0:请选择)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;

# 开单业务级
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDisplayGuest', 1, '是否显示散客(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowCarKey', 1, '是否显示钥匙号(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDiscountOn', 0, '是否有折扣约束(1:有约束, 0:无约束)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isConfirmCollectCash', 0, '是否需要确认收款(1:需要, 0:不需要)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isPayment', 0, '是否显示支付方(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
# 是否开启B单,默认关闭
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isOpenBOrder', 0, '是否开启B单功能(1:开通, 0:不开通)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
# 开单管理是否显示车架号,默认关闭
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDisplayVIN', 0, '开单管理是否显示车架号(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;

# 2016-12-23 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDisplayBillingNo', 0, '是否显示工单号(1:显示, 0:不显示)', now(), 'init');
set @index = @index + 10;

# 2017-04-18 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isAutoSendConsumeMessage', 1, '开单结算是否自动发送会员卡消费提醒(0:不发送, 1:短信、微信都发送, 2:只发送微信通知)
', '2017-04-18 20:24:01', 'init');
set @index = @index + 10;

# 2017-04-18 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isEnableWashManageFeature', 0, '是否开启洗车单、美容施工管理功能(1:开启, 0:不开启)', '2017-04-18 20:24:01', 'init');
set @index = @index + 10;


#### 2016-11-08 新增
#insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowBatchNO', 0, '是否显示批次号(0:不显示,1:显示)', '2017-01-13 16:42:01', 'init');
#set @index = @index + 10;
#insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isUseGrossProfit', 0, '是否按毛利计算提成(0:不是,1:是)', '2017-01-13 16:42:01', 'init');
#set @index = @index + 10;

# 库存级
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isOutputAfterConfirm', 0, '是否需要确认后再出库(1:需要, 0:不需要)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMatchByBarcode', 0, '是否按条码出入库(1:是, 0:不是)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
#insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isAllowNegativeStock', 0, '是否允许负库存(1:允许, 0:不允许)', '2017-01-13 16:42:01', 'init');
#set @index = @index + 10;

# 2016-12-23 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isEditReturnPrice', 0, '是否允许更新退货价格(1:允许, 0:不允许)', '2016-12-23 11:11:11', 'init');
set @index = @index + 10;

# 2017-03-09 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isAllowNoFittings', 1, '是否允许无配件开单(1:允许, 0:不允许)', '2017-03-09 10:39:01', 'init');
set @index = @index + 10;

# 2017-03-22 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isFastConsume', 0, '是否显示扣卡开单列(1:显示, 0:不显示)', '2017-03-23 19:39:01', 'init');
set @index = @index + 10;

# 2017-04-12 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isAgentBusiness', 0, '是否开启代办业务(1:开启, 0:关闭)', '2017-04-12 16:59:01', 'init');
set @index = @index + 10;

# 2017-04-25 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isEnableMemberCredit', 1, '是否开启会员积分功能(1:开启，0不开启)', '2017-04-25 16:57:01', 'init');
set @index = @index + 10;


# 2017-05-08 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isAutoCardChargePrint', 0, '会员办卡后是否自动显示打印单(1:显示，0:不显示)', '2017-05-08 17:40:01', 'init');
set @index = @index + 10;

# 2017-03-28 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowContactInHomePage', 1, '是否显示首页客服信息(1:显示, 0:不显示)', '2017-03-29 14:46:01', 'init');
set @index = @index + 10;

# 2017-04-20 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMallDisplayBilling', 1, '是否显示“开单”按钮、“查看服务”按钮(1:显示, 0:不显示)', '2017-04-20 12:40:01', 'init');
set @index = @index + 10;

# 2017-06-05 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMoreCard', 0, '是否支持一人多储值卡(1:开通, 0:关闭)', '2017-06-05 18:07:01', 'init');
set @index = @index + 10;

# 2017-06-16 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMemberLevel', 0, '是否支持会员多等级(1:支持，0:不支持)', '2017-06-16 15:50:01', 'init');
set @index = @index + 10;

# 2017-06-29 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDisplayAutoBackups', 0, '是否显示自动备份设置(1:显示，0:不显示)', '2017-06-29 10:30:00', 'init');
set @index = @index + 10;

# 2017-07-06 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowGroup', 0, '是否显示“指定门店组”/“仅限同组门店”', '2017-07-06 17:36:00', 'init');
set @index = @index + 10;

# 2017-07-21 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'MemberPriceUseCondition', 0, '享受商品会员价的支付条件(0:所有支付方式可用,1:使用微信支付,2:使用储值卡支付)', '2017-07-21 17:06:00', 'init');
set @index = @index + 10;

# 2017-07-24 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowCardBalance', 0, '在结算单打印页面上，是否显示储值卡余额（0:不显示，1:显示）', '2017-07-24 10:14:00', 'init');
set @index = @index + 10;

# 2017-07-28 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMemberDiscount', 1, '是否开启会员折扣（0：关闭，1：不限支付方式开启，2：仅开启储值卡支付）', '2017-07-28 14:56:00', 'init');
set @index = @index + 10;

# 2017-08-18 新增
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isDeptStatic', 0, '是否开启“部门业绩统计”模块', '2017-08-18 11:24:00', 'init');
set @index = @index + 10;

# 可能不再使用
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isShowSettleState', 0, '采购入库单是否显示“支付方式”(1:显示, 0:不显示),若不显示,则默认为“未结算”', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;
insert into customer_configs(sort_no, wid, name, value, remark, add_date, add_by) value (@index, @wid, 'isMatchServiceID', 1, '开单选择会员卡时,是否按服务项目匹配显示会员卡(1:显示, 0:不显示)', '2017-01-13 16:42:01', 'init');
set @index = @index + 10;


select * from customer_configs where wid = 0 order by sort_no asc;

select 'Re-init Data' as 'Title', @wid as 'WID', 'customer_configs' as 'Table', 'Done' as 'Status';

# 2016-10-20
