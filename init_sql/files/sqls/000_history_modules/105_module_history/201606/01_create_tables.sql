# 创建表的sql定义，存放在此文件中

# publishing
# publishing

#0617
# 特定关键字回复自定义编码
CREATE TABLE IF NOT EXISTS `user_code_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `wid_wxid` varchar(64) DEFAULT NULL COMMENT '商户对应的wxid',
  `custom_code` varchar(32) DEFAULT NULL COMMENT '自定义编码',
  `keyword` varchar(32) DEFAULT NULL COMMENT '固定关键词',
  `is_sent` int(11) DEFAULT '0' COMMENT '发送标记:0未发送,1已发送,默认0',
  `sent_at` datetime DEFAULT NULL COMMENT '实际发送时间',
  `is_used` int(11) DEFAULT '0' COMMENT '消费标记:0未消费,1已消费,默认0',
  `used_at` datetime DEFAULT NULL COMMENT '实际使用时间',
  `is_valid` int(11) DEFAULT '1' COMMENT '有效标记:0无效,1有效,默认1',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#0617

#0627
#会员短信分组定义
CREATE TABLE IF NOT EXISTS `member_sms_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL COMMENT '所属商户',
  `lbsid` int(11) DEFAULT 0 COMMENT '所属门店,暂不使用',
  `names` varchar(200) NOT NULL COMMENT '分组名称,竖线分隔',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#0627
