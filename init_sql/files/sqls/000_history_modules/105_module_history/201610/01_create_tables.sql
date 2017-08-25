# 创建表的sql定义，存放在此文件中


#DROP TABLE  order_billing;
select ' 1-- order_billing has deleted';
CREATE TABLE `order_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) DEFAULT '0' COMMENT '商户id(wid)',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型:1:A单,2:B单,3:项目消费,4:购买商品,5:会员卡消费，6：快捷开单',
  `pid` int(11) DEFAULT '0' COMMENT '父单据(所属A单)',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '单据编号',
  `order_detail` varchar(200) DEFAULT '' COMMENT '开单明细(内容)',
  `receive_by` varchar(20) DEFAULT '' COMMENT '接单人',
  `created_at` datetime DEFAULT NULL COMMENT '开单时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '预计交车时间',
  `key_code` varchar(20) DEFAULT '' COMMENT '钥匙号',
  `remark` varchar(200) DEFAULT '' COMMENT '开单备注',
  `preget_price` decimal(8,2) DEFAULT '0.00' COMMENT '预收款',
  `order_amount` decimal(8,2) DEFAULT '0.00' COMMENT '订单总金额',
  `service_discount` decimal(4,2) unsigned NOT NULL DEFAULT '10.00' COMMENT '工时折扣',
  `product_discount` decimal(4,2) unsigned NOT NULL DEFAULT '10.00' COMMENT '配件折扣',
  `discount_price` decimal(8,2) DEFAULT '0.00' COMMENT '折扣金额',
  `coupon_price` decimal(8,2) DEFAULT '0.00' COMMENT '优惠金额',
  `settle_price` decimal(8,2) DEFAULT '0.00' COMMENT '结算金额',
  `kaquan_price` decimal(8,2) DEFAULT '0.00' COMMENT '卡券支付金额',
  `mcard_price` decimal(8,2) DEFAULT '0.00' COMMENT '会员卡支付金额',
  `vcard_price` decimal(8,2) DEFAULT '0.00' COMMENT '储值卡支付金额',
  `cash_price` decimal(8,2) DEFAULT '0.00' COMMENT '现金支付',
  `bcard_price` decimal(8,2) DEFAULT '0.00' COMMENT '刷卡支付',
  `weixin_price` decimal(8,2) DEFAULT '0.00' COMMENT '微信支付',
  `alipay_price` decimal(8,2) DEFAULT '0.00' COMMENT '支付宝支付',
  `debt_price` decimal(8,2) DEFAULT '0.00' COMMENT '挂账金额',
  `other_price` decimal(8,2) DEFAULT '0.00' COMMENT '其他费用',
  `other_remark` varchar(50) DEFAULT '' COMMENT '其他费用备注',
  `is_out` int(11) DEFAULT '0' COMMENT '是否出库:0未完工，1已完工，2施工中',
  `out_time` datetime DEFAULT NULL COMMENT '出库时间',
  `out_by` int(11) DEFAULT '0' COMMENT '出库人id',
  `is_end` int(11) DEFAULT '0' COMMENT '进度标识:0未完工，1已完工，2施工中',
  `end_time` datetime DEFAULT NULL COMMENT '完工时间',
  `end_by` varchar(30) DEFAULT '' COMMENT '完工操作人id',
  `settle_time` datetime DEFAULT NULL COMMENT '结算时间',
  `settle_by` int(11) DEFAULT '0' COMMENT '结算人id',
  `is_cash` int(11) DEFAULT '-1' COMMENT '是否收银:0待收银，1已收银',
  `casher_time` datetime DEFAULT NULL COMMENT '收银时间',
  `casher_by` int(11) DEFAULT '0' COMMENT '收银人id',
  `cancel_time` datetime DEFAULT NULL COMMENT '作废时间',
  `cancel_by` int(11) DEFAULT '0' COMMENT '作废人id',
  `cancel_remark` varchar(50) DEFAULT '' COMMENT '作废备注',
  `status` int(11) DEFAULT '0' COMMENT '状态:1挂单,2开单,3结算,4收银,5放行,9作废',
  `is_make_b` int(11) DEFAULT '0' COMMENT '是否已生成B单',
  `create_time_b` datetime DEFAULT NULL COMMENT '生成B单时间',
  `mid` int(11) DEFAULT '0' COMMENT '会员ID',
  `member_name` varchar(20) DEFAULT '' COMMENT '会员姓名',
  `member_mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `member_statement` varchar(200) DEFAULT '' COMMENT '客户陈述',
  `fault_notes` varchar(200) DEFAULT '' COMMENT '故障现象',
  `car_id` int(11) DEFAULT '0' COMMENT '车辆ID',
  `cpai` varchar(20) DEFAULT '' COMMENT '车牌',
  `car_brand` varchar(20) DEFAULT '' COMMENT '品牌',
  `car_series` varchar(20) DEFAULT '' COMMENT '车系',
  `car_model` varchar(20) DEFAULT '' COMMENT '车型',
  `chejia` varchar(20) DEFAULT '' COMMENT '车架号',
  `engine` varchar(20) DEFAULT '' COMMENT '发动机号',
  `bylong` int(11) DEFAULT '0' COMMENT '上次保养公里数',
  `next_bylong` int(11) DEFAULT '0' COMMENT '下次保养公里数',
  `next_njtime` date DEFAULT NULL COMMENT '年检到期时间',
  `next_bytime` date DEFAULT NULL COMMENT '下次保养日期',
  `next_bxtime` date DEFAULT NULL COMMENT '保险到期时间',
  `bxcompany` varchar(20) DEFAULT '' COMMENT '保险公司',
  `carkilometre` int(11) DEFAULT '0' COMMENT '进厂公里数',
  `buy_date` datetime DEFAULT NULL COMMENT '购车日期',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `is_delete` int(11) DEFAULT '0' COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_billing_order_code_unique` (`order_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# 2、创建商户信息设置表
CREATE TABLE `customer_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) DEFAULT '0' COMMENT '商户ID',
  `show_name` varchar(30) DEFAULT '' COMMENT '商户名称',
  `address` varchar(100) DEFAULT '' COMMENT '详细地址',
  `map_addr` varchar(100) DEFAULT '' COMMENT '地图定位',
  `sms_name` varchar(20) DEFAULT '' COMMENT '短信签名',
  `cus_tel` varchar(30) DEFAULT '' COMMENT '店铺电话',
  `link_man` varchar(30) DEFAULT '' COMMENT '联系人',
  `link_tel` varchar(30) DEFAULT '' COMMENT '联系人电话',
  `order_declare1` varchar(200) DEFAULT '' COMMENT '开单说明',
  `order_declare2` varchar(200) DEFAULT '' COMMENT '美容开单说明',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


# 2016-10-22

# 员工折扣权限表
CREATE TABLE IF NOT EXISTS `user_staff_discount` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '修改的项目id',
    `wid` int(11) DEFAULT 0 COMMENT '商户wid',
    `usid` int(11) DEFAULT 0 COMMENT '商户员工id',
    `discount` decimal(3,1) DEFAULT 10 COMMENT '员工折扣,员工最高每单可折扣值',
    `add_date` datetime DEFAULT NULL COMMENT '变更时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '变更人',
    `update_date` datetime DEFAULT NULL COMMENT '最后编辑时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '编辑人',
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2016-10-22

# 2016-10-26

# 商户短信发送记录表
CREATE TABLE IF NOT EXISTS `customer_sms_history` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
    `auth_wid` int(11) DEFAULT 0 COMMENT '授权wid',
    `auth_wxid` varchar(50) DEFAULT '' COMMENT '授权wxid',
    `business` varchar(20) DEFAULT '' COMMENT '业务模块',
    `content` varchar(200) DEFAULT '' COMMENT '短信内容',
    `type` int(11) DEFAULT 0 COMMENT '1:qybor,2:testin',
    `status` int(11) DEFAULT 0 COMMENT '0:未发送,1:已发送,2:已重发',
    `code` varchar(20) DEFAULT '' COMMENT '状态码',
    `reason` varchar(50) DEFAULT '' COMMENT '失败原因',
    `sent_at` datetime DEFAULT NULL COMMENT '发送时间',
    `is_resent` int(11) DEFAULT 0 COMMENT '是否已重发:1已重发,0未重发',
    `resent_at` datetime DEFAULT NULL COMMENT '重发时间',
    `is_wx_sent` int(11) DEFAULT 0 COMMENT '是否发送微信:1已发,0未发',
    `wx_sent_at` datetime DEFAULT NULL COMMENT '微信发送时间',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户短信签名报备表
CREATE TABLE IF NOT EXISTS `customer_sms_sign` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `sign` varchar(20) DEFAULT '' COMMENT '报备签名',
    `is_approved` int(11) DEFAULT 0 COMMENT '是否报备:1是,0否',
    `add_date` datetime DEFAULT NULL COMMENT '创建时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '创建人',
    `update_date` datetime DEFAULT NULL COMMENT '变更时间',
    `update_by` varchar(30) DEFAULT '' COMMENT '变更人',
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2016-10-26