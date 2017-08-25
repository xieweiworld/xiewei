# 创建表的sql定义，存放在此文件中

# 从新版商城开始到新版商城正式发布前，已发布到正式库中的脚本汇总

# 2017-05-18 

##################################  系统相关表 - Start
# 系统商户级别默认首页配置表
CREATE TABLE IF NOT EXISTS `sys_level_homeset` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户级别id,0表示默认的',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '区块编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '区块名称',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `sort_no` int DEFAULT '0' COMMENT '排序码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `level_id_type_UNIQUE` (`level_id`, `code` ASC)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 系统参数设置表
CREATE TABLE IF NOT EXISTS `sys_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `param_code` varchar(50) NOT NULL COMMENT '参数编码',
  `param_name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_type` int NOT NULL COMMENT '参数分类:1:文字,2:整数,3:数字,4:日期',
  `param_value` varchar(20) DEFAULT '' COMMENT '参数值',
  `default_value` varchar(20) DEFAULT '' COMMENT '默认值',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `is_available` int(11) DEFAULT '1' COMMENT '是否有效:0:无效,1:有效',
  `remark` varchar(200) DEFAULT '' COMMENT '说明',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `param_code_UNIQUE` (`param_code` ASC)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
##################################  系统相关表 -End


##################################  商户相关表 - Start
# 支付方设置表
CREATE TABLE IF NOT EXISTS `order_payer_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '支付方名称',
  `charge_amount` decimal(8,2) DEFAULT '0.00' COMMENT '挂账限额',
  `service_price_rate` decimal(4,2) DEFAULT '0.00' COMMENT '项目加价率',
  `part_price_rate` decimal(4,2) DEFAULT '0.00' COMMENT '配件加价率',
  `is_inner_flag` int DEFAULT '0' COMMENT '内部数标志',
  `is_member_discount` int DEFAULT '0' COMMENT '会员打折标志',
  `is_insure_unit` int DEFAULT '0' COMMENT '保险主要合作单位',
  `is_default` int(1) NOT NULL DEFAULT 0 COMMENT '是否默认:1是,0否',
  `sort_no` int DEFAULT '0' COMMENT '排序码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户首页配置表
CREATE TABLE IF NOT EXISTS `customer_homeset` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户角色',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '区块编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '区块名称',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `sort_no` int DEFAULT '0' COMMENT '排序码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 关怀提醒设置表
CREATE TABLE IF NOT EXISTS `customer_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `care_type` int(11) NOT NULL DEFAULT '0' COMMENT '关怀类别,见文档定义',
  `amount` varchar(100) DEFAULT '0' COMMENT '提前/延期天数或低于余额',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '提醒内容',
  `is_sms` int DEFAULT '1' COMMENT '是否短信提醒',
  `is_wechat` int DEFAULT '0' COMMENT '是否微信提醒',
  `is_enable` int DEFAULT '0' COMMENT '是否启用提醒',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',

  `is_show_home` int DEFAULT '0' COMMENT '首页右下角提醒',
  `is_send_sms` int DEFAULT '0' COMMENT '发送短信到指定手机',
  `sms_mobile` varchar(240) NOT NULL DEFAULT '' COMMENT '接收预约信息手机号',

  `sort_no` int DEFAULT '0' COMMENT '排序码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 关怀提醒设置服务表
CREATE TABLE IF NOT EXISTS `customer_remind_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `care_id` int(11) NOT NULL DEFAULT '0' COMMENT '关怀提醒id',
  `ser1` int(11) NOT NULL DEFAULT '0' COMMENT '服务大类id',
  `ser2` int(11) NOT NULL DEFAULT '0' COMMENT '服务小类id',
  `amount` int DEFAULT '0' COMMENT '消费后间隔天数',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '提醒内容',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 关怀提醒记录表
CREATE TABLE IF NOT EXISTS `customer_remind_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `care_type` int(11) NOT NULL DEFAULT '0' COMMENT '关怀类型',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `name` varchar(30) DEFAULT '0' COMMENT '姓名',
  `cpai` varchar(20) DEFAULT '0' COMMENT '车牌号码',
  `content` varchar(200) DEFAULT '0' COMMENT '提醒内容',

  `is_sms` int DEFAULT '0' COMMENT '是否短信提醒',
  `sms_status` int DEFAULT '0' COMMENT '短信发送状态',
  `sms_send_at` datetime DEFAULT NULL COMMENT '预计发送时间',
  `sms_sent_at` datetime DEFAULT NULL COMMENT '实际发送时间',

  `is_wx` int DEFAULT '0' COMMENT '是否微信提醒',
  `wx_status` int DEFAULT '0' COMMENT '微信发送状态',
  `wx_send_at` datetime DEFAULT NULL COMMENT '预计发送时间',
  `wx_sent_at` datetime DEFAULT NULL COMMENT '实际发送时间',

  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户短信充值表
CREATE TABLE IF NOT EXISTS `customer_sms_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `receiver` int(11) NOT NULL DEFAULT '0' COMMENT '收款方wid',
  `orderid` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `out_trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '微信商户订单号',
  `status` int DEFAULT '0' COMMENT '状态0未支付,2已支付',
  `paid_time` datetime DEFAULT NULL COMMENT '新增时间',
  `unit_price` decimal(8,2) NOT NULL DEFAULT '0' COMMENT '购买单价',
  `amount` int DEFAULT '0' COMMENT '购买短信条数',
  `total_price` decimal(8,2) NOT NULL DEFAULT '0' COMMENT '购买金额',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户群发消息表
CREATE TABLE IF NOT EXISTS `customer_group_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `group_type` int(11) NOT NULL DEFAULT '0' COMMENT '群发类型:1微信2:短信',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '群发人数',
  `success` int(11) NOT NULL DEFAULT '0' COMMENT '发送成功数',
  `failure` int(11) NOT NULL DEFAULT '0' COMMENT '发送失败数',
  `conditions` varchar(2000) NOT NULL DEFAULT '' COMMENT '群发条件',
  `content` varchar(200) DEFAULT '0' COMMENT '群发内容',
  `res_id` int(11) NOT NULL DEFAULT '0' COMMENT '素材id',
  `send_at` datetime DEFAULT NULL COMMENT '预计发送时间',
  `sent_at` datetime DEFAULT NULL COMMENT '实际发送时间',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户二维码数据表
CREATE TABLE IF NOT EXISTS `customer_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `scene_str` varchar(64) NOT NULL DEFAULT '' COMMENT '场景值',
  `img_path` varchar(100) NOT NULL DEFAULT '' COMMENT '二维码图片URL',

  `is_temp` int(11) NOT NULL DEFAULT '1' COMMENT '0临时二维码,1永久二维码',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '过期天数',
  `sort_no` int DEFAULT '0' COMMENT '排序码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户粉丝记录表
CREATE TABLE IF NOT EXISTS `customer_wx_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `wxid` varchar(50) NOT NULL DEFAULT '' COMMENT '平台openid',
  `wid_wxid` varchar(50) NOT NULL DEFAULT '' COMMENT '商户openid',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `heading_img` varchar(250) NOT NULL DEFAULT '' COMMENT '头像图片URL',
  `wx_type` int(11) NOT NULL DEFAULT '0' COMMENT '1普通关注,2取消关注,3参数Subscribe,4参数Scan',
  `scene_id` varchar(64) NULL DEFAULT '' COMMENT '扫带参数二维码关注时的场景ID',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户微信消息表
CREATE TABLE IF NOT EXISTS `customer_wx_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `msg_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信消息标识MsgId',
  `msg_type` int(11) NOT NULL DEFAULT '0' COMMENT '微信普通消息类型:1-7',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `wxid` varchar(50) NOT NULL DEFAULT '' COMMENT '平台openid',
  `wid_wxid` varchar(50) NOT NULL DEFAULT '' COMMENT '商户openid',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',

  `receive_msg` varchar(250) NOT NULL DEFAULT '' COMMENT '收到的消息',
  `feedback_msg` varchar(250) NOT NULL DEFAULT '' COMMENT '回复的消息',
  `feedback_date` datetime NULL COMMENT '回复时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0未回复,1人工已回复,2关键字已回复',

  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 商户短信群发明细表 2017-05-08
CREATE TABLE IF NOT EXISTS `customer_group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) DEFAULT 0 COMMENT '商户wid',
    `group_id` int(11) DEFAULT 0 COMMENT '群发记录id',
    `mid` int(11) DEFAULT 0 COMMENT '会员id',
    `mobile` varchar(20) DEFAULT '' COMMENT '会员手机号',
    `sent_at` datetime DEFAULT NULL COMMENT '发送时间',
    `add_date` datetime DEFAULT NULL COMMENT '变更时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2017-02-10
# 客户消息提醒内容表
CREATE TABLE IF NOT EXISTS `customer_message_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid,非0表示具体商户的特定消息',
  `code` int(11) DEFAULT '0' COMMENT '提醒类型代码,见文档',
  `title` varchar(50) DEFAULT '' COMMENT '提醒标题',
  `type` int DEFAULT 0 COMMENT '提醒内容类型:1站内页面,2站外页面',
  `content` varchar(255) DEFAULT '' COMMENT '提醒内容',
  `duration` int(11) DEFAULT '0' COMMENT '提醒有效期',
  `url` varchar(255) DEFAULT '' COMMENT '提醒页面地址',
  `notify_type` int(11) DEFAULT '0' COMMENT '通知类型,通知到:1所有商户,2商户,3门店',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `level` int(11) DEFAULT NULL COMMENT '消息优先级',
  `is_on_tab` int(11) DEFAULT NULL COMMENT '显示有模块标签操作栏右侧',
  `is_publish` int(11) DEFAULT '0' COMMENT '是否发布:1是,0否',
  `is_platform` int(11) DEFAULT '0' COMMENT '是否为平台消息:1是,0否',
  `is_system` int(11) DEFAULT '0' COMMENT '是否是系统产生:1是,0否',
  `publish_by` int(11) DEFAULT '0' COMMENT '发布人id',
  `publish_name` varchar(50) DEFAULT '' COMMENT '发布人帐号',
  `publish_date` datetime DEFAULT NULL COMMENT '发布时间',
  `is_apply` int(11) DEFAULT '0' COMMENT '是否接受报名:1是0否',
  `apply_from` datetime DEFAULT NULL COMMENT '开始报名时间',
  `apply_to` datetime DEFAULT NULL COMMENT '结束报名时间',
  `apply_email` varchar(200) DEFAULT '' COMMENT '接收报名信息邮箱',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '提醒内容表';

# 提醒范围表
CREATE TABLE IF NOT EXISTS `customer_message_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL COMMENT '消息内容id',
  `type` int(11) DEFAULT NULL COMMENT '提醒范围:0:所有商户,1按商户级别,2按具体商户',
  `type_id` int(11) DEFAULT NULL COMMENT 'type=0:为空;type=1:商户级别id;type=2:商户wid',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '提醒范围表';

# 已读提醒表
CREATE TABLE IF NOT EXISTS `customer_message_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL COMMENT '商户wid',
  `lbsid` int(11) DEFAULT NULL COMMENT '门店id',
  `usid` int(11) DEFAULT NULL COMMENT '员工id',
  `content_id` int(11) DEFAULT NULL COMMENT '消息内容id',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '已读提醒表';

# 报名信息表
CREATE TABLE IF NOT EXISTS `customer_activity_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL COMMENT '商户wid',
  `lbsid` int(11) DEFAULT NULL COMMENT '门店id',
  `lbs_name` varchar(30) DEFAULT '' COMMENT '门店名称',
  `usid` int(11) DEFAULT NULL COMMENT '员工id',
  `user_name` varchar(30) DEFAULT '' COMMENT '报名人姓名',
  `content_id` int(11) DEFAULT NULL COMMENT '消息内容id',
  `telephones` varchar(200) DEFAULT '' COMMENT '联系电话',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '报名信息表';
# 2017-02-10

# 商户扫码付款记录表 2017-02-21
CREATE TABLE IF NOT EXISTS `customer_scancode_payinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户wid',
  `lbsid` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `wid_wxid` varchar(50) NOT NULL DEFAULT '' COMMENT '平台wxid',

  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',      
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `cpai` varchar(50) NOT NULL DEFAULT '' COMMENT '车牌号',
  `wxid` varchar(50) DEFAULT '' COMMENT '平台wxid',
  `nickname` varchar(50) NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) NULL DEFAULT '' COMMENT '头像',

  `order_code` varchar(50) DEFAULT '' COMMENT '支付单号',
  `out_trade_no` varchar(64) DEFAULT '' COMMENT '商户单号(退款时用到)',
  `wx_trade_no` varchar(64) DEFAULT '' COMMENT '交易单号(微信单号)',
  `pay_price` decimal(8,2) DEFAULT 0 COMMENT '支付价格',
  `is_callback` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支付回调',
  `paid_at` datetime DEFAULT NULL COMMENT '实际支付时间',
  `state` tinyint(4) DEFAULT 0 COMMENT '支付订单状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',

  `is_delete` tinyint(4) DEFAULT 0 COMMENT '删除标记:0未删除,1:已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户扫码付款记录表';

# 2017-02-24
# 商户微信模版表
CREATE TABLE IF NOT EXISTS `customer_weixin_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `send_wid` int(11) DEFAULT '0' COMMENT '发送方wid',
  `type` int DEFAULT 1 COMMENT '通知分类:1商户端,2车主端,3平台端',
  `code` varchar(20) DEFAULT '' COMMENT '公众平台模版编码',
  `title` varchar(50) DEFAULT '' COMMENT '公众平台模版标题',
  `post_data` varchar(255) DEFAULT '' COMMENT '模版数据格式',
  `template_id` varchar(64) DEFAULT '' COMMENT '模版template_id',
  `is_enable` int(11) DEFAULT '1' COMMENT '是否启用:1是,0否',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`, `wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '商户微信模版表';

# 商户通知接收人表
CREATE TABLE IF NOT EXISTS `customer_notice_receiver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `usid` int(11) DEFAULT '0' COMMENT '商户员工id',
  `name` varchar(30) DEFAULT '' COMMENT '员工真实姓名',
  `send_wid` int(11) DEFAULT '0' COMMENT '发送方wid',
  `receive_wxid` varchar(64) DEFAULT '' COMMENT '接收人wxid,对应发送方公众号的wxid',
  `nickname` varchar(50) DEFAULT '' COMMENT '微信昵称',
  `headimgurl` varchar(255) DEFAULT '' COMMENT '微信头像地址',
  `bind_code` varchar(50) DEFAULT '' COMMENT '微信绑定标识',
  `is_rebind` int(11) DEFAULT '0' COMMENT '是否要重新绑定微信:1是,0否',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '商户通知接收人表';

# 接收人绑定模版表
CREATE TABLE IF NOT EXISTS `customer_receiver_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `rid` int(11) DEFAULT '0' COMMENT '绑定接收者id',
  `tid` int(11) DEFAULT '0' COMMENT '商户的模版id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '接收人绑定模版表';
# 2017-02-24

# 2017-04-25
# 积分规则设置表
CREATE TABLE IF NOT EXISTS `member_credit_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `type` int(11) DEFAULT 0 COMMENT '类型:1储值卡,2次卡,3年卡,4套餐卡,5消费,6订单评价,7订单分享',
    `price` int DEFAULT 0 COMMENT '充值或消费金额,type=6,7时为0',
    `credit` int DEFAULT 0 COMMENT '获得积分',
    `is_enable` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启:1开启,0关闭',
    `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 会员积分明细表
CREATE TABLE IF NOT EXISTS `member_credit_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
    `lbsid` int(11) NOT NULL DEFAULT 0 COMMENT '门店id',
    `mid` int(11) NOT NULL DEFAULT 0 COMMENT '会员id',
    `source` int(11) NOT NULL DEFAULT 0 COMMENT '来源:1导入积分,2转入积分,3充值积分(31储值卡,32次卡,33年卡,34套餐卡),4*待定,5订单评价,6订单分享,7编辑积分,9*待定',
    `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单ID',
    `order_code` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号,有单据ID的才有值',
  `price` decimal(8,2) NOT NULL DEFAULT 0 COMMENT '计算金额',
    `credit` int NOT NULL DEFAULT 0 COMMENT '正数:获得的积分;负数:消费的积分',
    `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 成为会员条件表
CREATE TABLE IF NOT EXISTS `member_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
    `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型,见文档',
    `amount` int DEFAULT 0 COMMENT '满足金额',
    `is_enable` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启:1开启,0关闭',
    `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

### 待定
# 会员等级表
# 服务项目折扣表(与会员等级有关)
# 2017-04-25

##################################  商户相关表 - End



################################## 开单相关表 - start
# 入库明细批次表 - 删除此表
# 入库明细条码表
CREATE TABLE IF NOT EXISTS `order_product_indetail_barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',

  `in_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '入库单ID',
  `in_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '入库明细id',
  `in_batchno_id` int(11) NOT NULL DEFAULT '0' COMMENT '入库明细批次ID',
  `bar_code` varchar(30) NOT NULL DEFAULT '' COMMENT '条码',
  `is_delete` int DEFAULT '0' COMMENT '删除标记(1:是,0:否)',

  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


# 出库明细批次表
CREATE TABLE IF NOT EXISTS `order_product_outdetail_batchno` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',

  `out_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '出库单ID',
  `out_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '出库明细id',
  `in_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '入库明细id',
  `batch_no` varchar(30) NOT NULL DEFAULT '' COMMENT '批次号或条码',
  `out_batch_count` decimal(8,2) NOT NULL DEFAULT '0' COMMENT '本批次出库数',
  `is_out_barcode` int(11) NOT NULL DEFAULT '0' COMMENT '按条码出库(1:是,0:否)',
  `is_delete` int DEFAULT '0' COMMENT '删除标记(1:是,0:否)',

  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 出库明细条码表 - 删除此表，数据已由 出库明细批次表 替代
# 退货明细条码表 - 删除此表

# 开单的工单复核表(Order_Billing子表) - 2017-05-08
CREATE TABLE IF NOT EXISTS `order_billing_more` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `orderid` int(11) NOT NULL DEFAULT 0 COMMENT '开单单据ID',
    #`order_code` varchar(30) NOT NULL DEFAULT '' COMMENT '订单编号',
    `is_recheck` int DEFAULT 0 COMMENT '是否复核:1是,0否',
    `rechecker` int DEFAULT 0 COMMENT '复核人(员工ID)',
    `recheck_time` datetime DEFAULT NULL COMMENT '复核时间',
    `recheck_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '复核备注',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 开单优化添加表：开单配件扫码(车之翼)
CREATE TABLE IF NOT EXISTS `order_product_expense_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id(wid)',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '单据id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '配件id',
  `product_exponse_id` int(11) NOT NULL DEFAULT '0' COMMENT '配件消耗id',
  `bar_code` varchar(20) NOT NULL DEFAULT '' COMMENT '条形码',
  `batch_code` varchar(20) NOT NULL DEFAULT '' COMMENT '批次号',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_order_product_expense_order_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开单配件扫码';

# 2017-03-17: 服务项目改进、项目施工流程、项目快捷开单等功能改进 而调整表
# 服务项目施工流程表:
CREATE TABLE IF NOT EXISTS `customer_services_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `service_id` int(11) DEFAULT '0' COMMENT '服务项目id',
  `process_name10` varchar(60) DEFAULT '' COMMENT '服务流程10名称',
  `process_name20` varchar(60) DEFAULT '' COMMENT '服务流程20名称',
  `reward_amount10` decimal(8,2) DEFAULT '0' COMMENT '流程10施工提成',
  `reward_amount20` decimal(8,2) DEFAULT '0' COMMENT '流程20施工提成',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '服务项目施工流程表';

# 开单项目人员表
CREATE TABLE IF NOT EXISTS `order_service_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `order_id` int(11) DEFAULT '0' COMMENT '开单id',
  `order_code` varchar(50) DEFAULT '' COMMENT '开单单号',
  `order_service_id` int(11) DEFAULT '0' COMMENT '开单服务项目id',
  `service_id` int(11) DEFAULT '0' COMMENT '服务项目id',
  `service_name` varchar(60) DEFAULT '' COMMENT '服务项目名称',
  `is_process` int(11) DEFAULT '0' COMMENT '是否是流程控制服务项目',
  `process_name` varchar(60) DEFAULT '' COMMENT '服务流程名称',
  `reward_amount` decimal(8,2) DEFAULT '0' COMMENT '提成金额',
  `operator_type` int DEFAULT 0 COMMENT '人员类别:1普通施工人员,2普通销售人员,10流程10施工人员,20流程20施工人员',
  `operator_id` int DEFAULT 0 COMMENT '员工id',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '开单项目施工流程表';
# 2017-03-17

################################## 开单相关表 - start



################################## 国寿相关表 - Start
# 2016-12-20
# 国寿会员车辆积分表 
CREATE TABLE IF NOT EXISTS `chinalife_car_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '国寿商户id',
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车辆ID',
  `year` int(11) DEFAULT 0 COMMENT '保险起始日年份',
  `cpai` varchar(20) DEFAULT '' COMMENT '车牌号',
  `enabled_at` datetime NOT NULL COMMENT '积分起始日',
  `expired_at` datetime NOT NULL COMMENT '积分截止日',
  `total_price` decimal(8,2) DEFAULT 0 COMMENT '本年度转入价格',
  `total_credit` int(11) DEFAULT 0 COMMENT '本年度转入积分',
  `remain_price` decimal(8,2) DEFAULT 0 COMMENT '本年度剩余价格',
  `remain_credit` int(11) DEFAULT 0 COMMENT '本年度剩余积分',
  `is_stop` int(11) DEFAULT 0 COMMENT '停用标记:0未停用,1已停用',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_wid_mid_cid_year` (`wid` ASC, `mid` ASC, `car_id` ASC, `year` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 国寿会员车辆积分历史表(流水表)
CREATE TABLE IF NOT EXISTS `chinalife_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '国寿商户id',
  `lbsid` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型:1导入,2消费,3过期,4扣减,5增加,6退回',
  `year` int(11) DEFAULT 0 COMMENT '保险起始日年份',
  `credit_id` int(11) NOT NULL DEFAULT 0 COMMENT '车辆年度积分ID',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单id,下单时有有效值',
  `order_code` varchar(30) NOT NULL DEFAULT '' COMMENT '订单编号,下单时有有效值',
  `cpai` varchar(20) DEFAULT '' COMMENT '车牌号',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `name` varchar(20) DEFAULT '' COMMENT '姓名',
  `price` decimal(8,2) DEFAULT 0 COMMENT '价格',
  `credit` int(11) DEFAULT 0 COMMENT '积分',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
# 2016-12-20

# 2017-03-06
# 国寿商户费用结算表
CREATE TABLE IF NOT EXISTS `chinalife_paid_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户wid',
  `wxid` varchar(64) NOT NULL COMMENT '平台wxid',
  `wid_wxid` varchar(64) NOT NULL COMMENT '商户wxid',
  `orderid` varchar(32) DEFAULT '' COMMENT '平台订单号',
  `actual_price` decimal(8,2) DEFAULT '0.00' COMMENT '实际金额,元',
  `actual_credit` decimal(8, 2) DEFAULT '0.00' COMMENT '实际积分',
  `integral` int DEFAULT 1 COMMENT '国寿积分兑换比例',
  `order_type` int DEFAULT 0 COMMENT '抢购订单2,应全是2',
  `name` varchar(32) DEFAULT '' COMMENT '姓名',
  `tel` varchar(32) DEFAULT '' COMMENT '电话',
  `cpai` varchar(32) DEFAULT '' COMMENT '车牌',
  `code` varchar(10) DEFAULT '' COMMENT '核销码',
  `body` varchar(255) COMMENT '商品名称或项目名称',
  `state` int DEFAULT 1 COMMENT '状态:0已退款,1已支付(待结算),3已核销(可结算),6已结算',
  `time_end` datetime DEFAULT NULL COMMENT '支付时间',
  `finished_at` datetime DEFAULT NULL COMMENT '核销时间',
  `returned_at` datetime DEFAULT NULL COMMENT '退款时间',
  `cleared_at` datetime DEFAULT NULL COMMENT '结算时间',
  `fid` int(11) DEFAULT 0 COMMENT '结算流水id',
  `receiver` int(11) DEFAULT 0 COMMENT '收款方wid,应全为平台',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '国寿商户费用结算表';

# 国寿商户费用结算流水表
CREATE TABLE IF NOT EXISTS `chinalife_finance_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户wid',
  `applied_at` datetime NOT NULL COMMENT '申请时间',
  `cleared_at` datetime DEFAULT NULL COMMENT '结算时间',
  `original_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `cleared_price` decimal(8,2) NOT NULL COMMENT '结算金额',
  `clear_period` varchar(50) DEFAULT '' COMMENT '结算周期 ',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT '国寿商户费用结算流水表';
# 2017-03-06

# 2017-05-10 国寿机构积分提额业务数据表
# 机构积分额度表
CREATE TABLE IF NOT EXISTS `chinalife_agency_creditlimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户wid',
  `lbsid` int(11) NOT NULL DEFAULT 0 COMMENT '商户机构id',
  `total_credits` decimal(8,2) NOT NULL DEFAULT 0 COMMENT '机构积分总额度',
  `use_credits` decimal(8,2) NOT NULL DEFAULT 0 COMMENT '机构积可用额度',
  `is_branch` int(11) NOT NULL DEFAULT 0 COMMENT '使用机构积分额度:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 支公司积分额度充值记录
CREATE TABLE IF NOT EXISTS `chinalife_agency_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户wid',
  `lbsid` int(11) NOT NULL DEFAULT 0 COMMENT '商户机构id',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '积分类型:1充值,2扣减',
  `amount` decimal(8,2) NOT NULL DEFAULT 0 COMMENT '充值的金额',
  `credit` int(11) NOT NULL DEFAULT 0 COMMENT '充值的积分',
  `charged_at` datetime DEFAULT NULL COMMENT '充值时间',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
# 2017-05-10

################################## 国寿相关表 - End


################################## CRM系统相关 - End

# 2017-03-10 客户介绍人表
# 客户介绍人表
CREATE TABLE IF NOT EXISTS `crm_introducer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户ID(code)',
  `contact_id` varchar(50) DEFAULT '' COMMENT '联系人ID(code)',
  `staff_code` varchar(20) DEFAULT '' COMMENT '员工code',
  `name` varchar(50) DEFAULT '' COMMENT '介绍人名称',
  `mobile` varchar(30) DEFAULT '' COMMENT '介绍人手机',
  `refer_id` varchar(50) DEFAULT '' COMMENT '介绍人ID(UUID)',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '客户介绍人表';
# 2017-03-10

##################################

# 2017-05-18 

select '01' as 'Index', 'Create Tables' as 'Title', 'Done' as 'Status';