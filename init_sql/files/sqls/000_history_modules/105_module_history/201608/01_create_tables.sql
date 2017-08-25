# 创建表的sql定义，存放在此文件中

# publishing
# publishing

########## [START] 处理会员卡编辑问题

# 会员卡编辑历史记录表
CREATE TABLE IF NOT EXISTS `member_card_change_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT 0 COMMENT '商户id',
  `card_id` varchar(50) DEFAULT '' COMMENT '会员卡id',
  `card_type` tinyint(4) DEFAULT 0 COMMENT '卡类型',
  `is_main` tinyint(4) DEFAULT 1 COMMENT '主卡标记',
  `limit_carid_old` int(11) DEFAULT NULL COMMENT '限车牌旧ID',
  `limit_carid_new` int(11) DEFAULT NULL COMMENT '限车牌新ID',
  `limit_car_old` varchar(10) DEFAULT '' COMMENT '限车牌旧号',
  `limit_car_new` varchar(10) DEFAULT '' COMMENT '限车牌新号',
  `status_old` int(11) DEFAULT 0 COMMENT '旧卡状态',
  `status_new` int(11) DEFAULT 0 COMMENT '新卡状态',
  `service_id_old` int(11) DEFAULT 0 COMMENT '旧卡的服务id',
  `service_id_new` int(11) DEFAULT 0 COMMENT '新卡的服务id',
  `service_name_old` varchar(30) DEFAULT '' COMMENT '旧卡的服务名称',
  `service_name_new` varchar(30) DEFAULT '' COMMENT '新卡的服务名称',
  `amount_old` decimal(8,2) DEFAULT 0 COMMENT '旧卡的余额',
  `amount_new` decimal(8,2) DEFAULT 0 COMMENT '新卡的余额',
  `expired_at_old` datetime DEFAULT NULL COMMENT '旧卡的有效期',
  `expired_at_new` datetime DEFAULT NULL COMMENT '新卡的有效期',
  `remark` varchar(200) DEFAULT '' COMMENT '调整原因',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `change_date` datetime DEFAULT NULL COMMENT '变更时间',
  `change_by` varchar(30) DEFAULT '' COMMENT '变更人',
  PRIMARY KEY (`id`)

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

########## [FINISH] 处理会员卡编辑问题


########## [START] 处理多一个手机号、一个微信号存在多mid的问题

# 会员变更历史信息表
CREATE TABLE IF NOT EXISTS `member_base_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `from_mid` int(11) NOT NULL DEFAULT 0 COMMENT '会员mid',
  `wxid_old` varchar(60) NOT NULL DEFAULT '' COMMENT '会员旧wxid',
  `wxid_new` varchar(60) NOT NULL DEFAULT '' COMMENT '会员新wxid',
  `mobile_old` varchar(20) NOT NULL DEFAULT '' COMMENT '旧手机号',
  `mobile_new` varchar(20) NOT NULL DEFAULT '' COMMENT '新手机号',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

########## [FINISH] 处理多一个手机号、一个微信号存在多mid的问题
