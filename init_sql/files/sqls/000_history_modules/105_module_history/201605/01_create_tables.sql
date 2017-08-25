# 创建表的sql定义，存放在此文件中

# 0516

# 平台投票活动设置表
CREATE TABLE IF NOT EXISTS `vote_platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL COMMENT '活动标题',
  `remark` text COMMENT '活动说明',
  `pic` varchar(128) DEFAULT NULL COMMENT '活动图片',
  `start_at` date DEFAULT NULL COMMENT '开始时间',
  `end_at` date DEFAULT NULL COMMENT '结束时间',
  `day_limits` tinyint(4) DEFAULT NULL COMMENT '每天投票次数',
  `total_limits` tinyint(4) DEFAULT NULL COMMENT '总投票次数',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户参与投票活动表
CREATE TABLE IF NOT EXISTS `vote_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL COMMENT '活动id',
  `wid` int(11) DEFAULT NULL,
  `remark` text COMMENT '门店活动说明',
  `pic` varchar(128) DEFAULT NULL COMMENT '门店活动图片',
  `votes` int(11) DEFAULT NULL COMMENT '门店投票数',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 会员投票表
CREATE TABLE IF NOT EXISTS `vote_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `wxid` varchar(64) DEFAULT NULL COMMENT '平台waxed',
  `wid_wxid` varchar(64) DEFAULT NULL COMMENT '商户wxid',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 0516

# normal
# 手工服务项目关怀
CREATE TABLE IF NOT EXISTS `member_manual_services` (
  `id` int(11) NOT NULL,
  `wid` int(11) NOT NULL COMMENT '商户wid',
  `mid` int(11) NOT NULL COMMENT '会员id',
  `start_at` datetime DEFAULT NULL COMMENT '服务开始时间',
  `end_at` datetime DEFAULT NULL COMMENT '服务结束时间',
  `contents` varchar(255) DEFAULT NULL COMMENT '服务内容',
  `tags` varchar(255) DEFAULT NULL COMMENT '自定义标签,如服务项目名称',
  `services_info` text COMMENT '关怀项目配置,包括多组数据,每组有:ser1,ser2,interval_days,days_unit,参考service_templates表',
  `generated` tinyint(4) DEFAULT '0' COMMENT '0:未生成,1:已生成',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# cash

# 顾客退货明细表
CREATE TABLE IF NOT EXISTS `ai9me_product_returned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL COMMENT '商户id,wid',
  `mid` int(11) NOT NULL COMMENT '会员id',
  `invent_id` int(11) NOT NULL COMMENT '库存表的id (ai9me_inventory)',
  `returned_id` varchar(45) NOT NULL COMMENT '退货单号',
  `order_id` varchar(45) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT '7' COMMENT '订单类型,与payment相同',
  `returned_at` datetime DEFAULT NULL COMMENT '退货时间',
  `returned_amount` int(11) DEFAULT '0' COMMENT '商品退回数量',
  `unit_price` decimal(8,2) DEFAULT '0.00' COMMENT '此次退货单价',
  `total_price` decimal(8,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 2016-05-23
# 抢购首页推荐设置表
CREATE TABLE IF NOT EXISTS `user_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `lbsid` int(11) DEFAULT NULL,
  `isshow` tinyint(4) DEFAULT '0' COMMENT '0:不显示，1:显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

