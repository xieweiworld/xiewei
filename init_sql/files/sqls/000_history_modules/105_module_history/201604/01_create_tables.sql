# 创建表的sql定义，存放在此文件中

#会员卡赠送记录
CREATE TABLE IF NOT EXISTS `member_gift_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` bigint(80) DEFAULT NULL,
  `from_mid` int(11) DEFAULT NULL COMMENT '（谁）赠送朋友的mid',
  `to_mid` int(11) DEFAULT NULL COMMENT '领取朋友的mid',
  `card_id` int(11) DEFAULT NULL COMMENT '卡id',
  `card_type` varchar(100) DEFAULT NULL COMMENT '卡大类',
  `card_sub_type` varchar(100) DEFAULT NULL COMMENT '二级类别',
  `present_amount` int(11) DEFAULT NULL COMMENT '赠送数值',
  `present_type` int(11) DEFAULT '0' COMMENT '赠送方式:默认0单次赠送，1随机获得',
  `expired_at` datetime DEFAULT NULL COMMENT '过期时间',
  `status` int(11) DEFAULT '0' COMMENT '0:未领取，1:已领取',
  `orderid` varchar(50) DEFAULT NULL COMMENT '判断是否是从朋友圈进来',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#国寿表

CREATE TABLE IF NOT EXISTS `guoshou_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_amount` int(11) DEFAULT NULL COMMENT '总金额',
  `credits` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL COMMENT '单价',
  `total_number` int(11) DEFAULT NULL COMMENT '总数量',
  `imported_at` datetime DEFAULT NULL COMMENT '导入时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `guoshou_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `wxid` varchar(45) DEFAULT NULL,
  `wid_wxid` varchar(45) DEFAULT NULL COMMENT '商户wxid',
  `lbsid` int(11) DEFAULT NULL COMMENT '门店id',
  `team_id` int(11) DEFAULT NULL COMMENT '团队id',
  `team_name` varchar(45) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL COMMENT '微信端登录密码',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别:男,女',
  `profile` varchar(255) DEFAULT NULL COMMENT '配送员介绍',
  `head_image` varchar(200) DEFAULT NULL COMMENT '配送员头像url',
  `logo_image` varchar(200) DEFAULT NULL COMMENT '微信头像url',
  `created_at` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0' COMMENT '是否删除,默认0:未删除,1:已删除',
  `agress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `guoshou_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '团队名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '团队备注',
  `agency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `member_card_subtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



#0429
CREATE TABLE IF NOT EXISTS `user_admin_operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` bigint(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `auth_wxid` varchar(50) DEFAULT NULL COMMENT '平台获取的wxid',
  `is_closed` int(11) DEFAULT '0' COMMENT '判断是否关闭：0正常，1关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#0429


#0502
CREATE TABLE IF NOT EXISTS `user_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '父类id,操作业务表的id',
  `wxid` varchar(64) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '日志类型:1手机核销订单,2:手机核销卡券',
  `message` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#0502

#0506
#员工签到表
CREATE TABLE IF NOT EXISTS `user_staff_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `usid` int(11) DEFAULT NULL,
  `today` date DEFAULT NULL,
  `checkin_at` datetime DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#员工打赏结算流水
CREATE TABLE IF NOT EXISTS `user_staff_reward_cleared` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `usid` int(11) DEFAULT NULL COMMENT '员工id',
  `partner_trade_no` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `created_at` datetime DEFAULT NULL COMMENT '时间',
  `total_reward` decimal(8,2) DEFAULT NULL COMMENT '总奖励',
  `paid_reward` decimal(8,2) DEFAULT NULL COMMENT '支付奖励',
  `cleared_feed` decimal(8,2) DEFAULT NULL COMMENT '结算手续费',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#员工工资
CREATE TABLE IF NOT EXISTS `user_staff_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL,
  `usid` int(11) NOT NULL COMMENT '员工id',
  `name` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `salay` decimal(8,2) DEFAULT '0.00' COMMENT '基本工资',
  `penalty` decimal(8,2) DEFAULT '0.00' COMMENT '扣除工资',
  `subsidy` decimal(8,2) DEFAULT '0.00' COMMENT '补助/奖励',
  `sale_reward` decimal(8,2) DEFAULT '0.00' COMMENT '销售提成',
  `operation_reward` decimal(8,2) DEFAULT '0.00' COMMENT '施工提成',
  `card_reward` decimal(8,2) DEFAULT '0.00' COMMENT '办卡提成',
  `kpi_reward` decimal(8,2) DEFAULT '0.00' COMMENT '绩效提成',
  `other_salary` decimal(8,2) DEFAULT '0.00' COMMENT '其他工资',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商品提成表
CREATE TABLE IF NOT EXISTS `commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提成ID',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型1-3: 1销售提成 2施工提成 3会员卡提成',
  `commission_type` tinyint(1) DEFAULT NULL COMMENT '提成类型: 1固定提成 | 2比例提成',
  `commission_ratio` int(11) DEFAULT NULL COMMENT '提成金额/提成比',
  PRIMARY KEY (`id`)
) CHARSET=utf8;

# 绩效提成表 
CREATE TABLE IF NOT EXISTS `performance_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '绩效提成表 ID',
  `wid` int(11) DEFAULT NULL COMMENT '商户id',
  `user_staff_dep_id` int(11) NOT NULL COMMENT '部门表ID',
  `start` varchar(255) DEFAULT NULL COMMENT '绩效额开始',
  `end` varchar(255) DEFAULT NULL COMMENT '绩效截止',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-3 : 销售|施工|会员卡 暂时不用',
  `commission_type` tinyint(4) DEFAULT NULL COMMENT '提成类型: 1固定提成 | 2比例提成',
  `commission_ratio` int(11) DEFAULT NULL COMMENT '提成金额/提成比',
  PRIMARY KEY (`id`)
) CHARSET=utf8;

# 员工提成表 员工提成明细数据表 
CREATE TABLE IF NOT EXISTS `user_staff_reward_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` varchar(45) NOT NULL COMMENT '商户号',
  `usid` int(11) NOT NULL COMMENT '员工id',
  `order_type` varchar(10) DEFAULT NULL COMMENT '订单类型:sc,qg,sy,yy',
  `order_id` varchar(45) DEFAULT NULL COMMENT '订单编号,非id',
  `source_type` int(11) DEFAULT NULL COMMENT '提成来源类型:1销售提成,2施工提成,3办卡提成,4绩效提成',
  `source_id` int(11) DEFAULT NULL COMMENT '提成来源编号,商品id或部门id',
  `reward_price` decimal(8,2) DEFAULT '0.00' COMMENT '产生提成的价格',
  `reward_type` int(11) DEFAULT NULL COMMENT '提成类型',
  `reward_ratio` decimal(8,2) DEFAULT '0.00' COMMENT '提成数值',
  `reward` decimal(8,2) DEFAULT '0.00' COMMENT '提成额',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) CHARSET=utf8;

#0506






