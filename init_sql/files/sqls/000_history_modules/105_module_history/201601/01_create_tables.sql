# 创建表的sql定义，存放在此文件中

CREATE TABLE IF NOT EXISTS `member_card_interule_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `credits` int(11) DEFAULT '0' COMMENT '额外赠送积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `service_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `ser1` int(11) DEFAULT NULL COMMENT '一类服务',
  `ser2` int(11) DEFAULT NULL COMMENT '二类服务',
  `interval_days` int(11) DEFAULT '0' COMMENT '服务项目间隔周期数',
  `days_unit` int(11) DEFAULT '1' COMMENT '间隔周期单位：1:天,30:月,360:年,540:年半',
  `preceded_days` varchar(32) DEFAULT '0' COMMENT '提前提醒天数，英文逗号分隔的数据，如：1,3,5',
  `preceded_text` varchar(255) DEFAULT '' COMMENT '提前提醒内容',
  `delayed_days` varchar(32) DEFAULT '0' COMMENT '延期天数：英文逗号分隔的数据，如：1,3,5',
  `delayed_text` varchar(255) DEFAULT '' COMMENT '延期提醒内容',
  `enabled` int(11) DEFAULT '1' COMMENT '提醒是否启用：1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

# 首次关注赠送金额记录表
CREATE TABLE IF NOT EXISTS `wx_subscribes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL COMMENT '商户id',
  `wxid` varchar(64) DEFAULT NULL COMMENT '商户wxid',
  `giftamount` decimal(8,2) DEFAULT '0.00' COMMENT '赠送金额',
  `auth_wxid` varchar(64) DEFAULT NULL COMMENT 'ycf_wxid',
  `created_at` datetime DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jjjh_cont` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `cp` varchar(32) DEFAULT NULL,
  `rrlx` varchar(128) DEFAULT NULL,
  `qcxh` varchar(128) DEFAULT NULL,
  `addr` text,
  `reason` text,
  `mlat` varchar(32) DEFAULT NULL,
  `mlng` varchar(32) DEFAULT NULL,
  `cont` text,
  `statue` varchar(8) DEFAULT NULL,
  `htime` datetime DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jjjh_md` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) DEFAULT NULL,
  `lbid` int(11) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `jl` varchar(32) DEFAULT NULL,
  `statue` varchar(32) DEFAULT NULL,
  `bj` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

