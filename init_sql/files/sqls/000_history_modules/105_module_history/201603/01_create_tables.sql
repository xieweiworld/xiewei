# 创建表的sql定义，存放在此文件中

# 维修进度表
CREATE TABLE IF NOT EXISTS `repair_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `name` varchar(32) DEFAULT NULL,
  `cpai` varchar(32) DEFAULT NULL,
  `wxid` varchar(64) DEFAULT NULL COMMENT '微信id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `created_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '0' COMMENT '0进行中,1已完成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商户卡券表
CREATE TABLE IF NOT EXISTS `member_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serid` bigint(20) DEFAULT NULL,
  `wid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` text COMMENT '卡券描述',
  `price` decimal(8,2) DEFAULT '0.00' COMMENT '卡券可抵扣金额',
  `amount` int(11) DEFAULT '0' COMMENT '卡券存库数量,0为不限',
  `created_at` datetime DEFAULT NULL,
  `enabled_at` datetime DEFAULT NULL COMMENT '开始时间',
  `expired_at` datetime DEFAULT NULL COMMENT '卡券有效截止日期',
  `issues` int(11) DEFAULT '0' COMMENT '卡券发放数量',
  `grabs` int(11) DEFAULT '0' COMMENT '当次抢券数量,0表示不开放抢券',
  `start_at` datetime DEFAULT NULL COMMENT '抢券开始时间',
  `end_at` datetime DEFAULT NULL COMMENT '抢券结束时间',
  `limitamount` int(11) DEFAULT '1' COMMENT '每人限抢个数',
  `grabbed` int(11) DEFAULT '0' COMMENT '当次已抢数量',
  `is_grab_on` tinyint(4) DEFAULT '0' COMMENT '0:不开启抢券，1：开启',
  `pic` varchar(255) DEFAULT '/res/kaquan.png' COMMENT '卡券图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 会员的卡券表
CREATE TABLE IF NOT EXISTS `member_coupon_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `wid` bigint(20) DEFAULT NULL,
  `cid` bigint(20) DEFAULT NULL COMMENT '卡券ID',
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL COMMENT '卡券结束时间',
  `enabled_at` datetime DEFAULT NULL COMMENT '卡券生效时间',
  `name` varchar(50) DEFAULT NULL COMMENT '卡券名称',
  `price` decimal(8,2) DEFAULT '0.00' COMMENT '可抵金额',
  `isused` tinyint(4) DEFAULT '0' COMMENT '0:未使用，1：已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商户自定义页面表
CREATE TABLE IF NOT EXISTS `custom_html` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商户部门表
CREATE TABLE IF NOT EXISTS  `user_staff_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商户员工表
CREATE TABLE IF NOT EXISTS `user_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `wxid` varchar(45) DEFAULT NULL COMMENT '平台wxid',
  `wid_wxid` varchar(45) DEFAULT NULL COMMENT '商户wxid',
  `lbsid` int(11) DEFAULT NULL COMMENT '门店id',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(45) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `password` varchar(45) DEFAULT NULL COMMENT '微信端登录密码',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别:男,女',
  `profile` varchar(255) DEFAULT NULL COMMENT '员工介绍',
  `head_image` varchar(80) DEFAULT NULL COMMENT '员工头像url',
  `logo_image` varchar(80) DEFAULT NULL COMMENT '微信头像url',
  `created_at` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0' COMMENT '是否删除,默认0:未删除,1:已删除',
  `agrees` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 预约服务表
CREATE TABLE IF NOT EXISTS `yyfw_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` varchar(45) DEFAULT NULL COMMENT '商户wid',
  `wxid` varchar(45) DEFAULT NULL COMMENT '平台wxid',
  `wid_wxid` varchar(45) DEFAULT NULL COMMENT '商户wxid',
  `template_id` varchar(64) DEFAULT NULL COMMENT '微信模版id',
  `name` varchar(20) DEFAULT NULL COMMENT '车主姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `cpai` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `dated_at` datetime DEFAULT NULL COMMENT '预约时间',
  `service` varchar(45) DEFAULT NULL COMMENT '预约服务项目',
  `ser1` int(11) DEFAULT NULL COMMENT '服务大类',
  `ser2` int(11) DEFAULT NULL COMMENT '服务小类',
  `lbsid` int(11) DEFAULT NULL COMMENT '预约门店',
  `usid` int(11) DEFAULT NULL COMMENT '预约服务员工',
  `created_at` datetime DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `feedback` varchar(50) DEFAULT NULL COMMENT '反馈信息',
  `status` int(11) DEFAULT '0' COMMENT '0:未受理,1:已确认,2:已完成',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#国寿积分比例设置
CREATE TABLE IF NOT EXISTS  `chinalife_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integral` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#国寿会员积分
CREATE TABLE IF NOT EXISTS  `chinalife_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '剩余返现金额',
  `total_amount` decimal(8,2) DEFAULT '0.00' COMMENT '累积返现金额',
  `credits` int(11) DEFAULT '0' COMMENT '剩余返现积分',
  `total_credits` int(11) DEFAULT '0' COMMENT '累积返现积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#平台活动设置
CREATE TABLE IF NOT EXISTS `platform_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `code` int(11) DEFAULT NULL COMMENT '或运算1.2.4.8',
  `year` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL COMMENT '开始时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `enabled` int(11) DEFAULT '0' COMMENT '是否开启0:关闭，1:开启',
  `banner_pic` varchar(255) DEFAULT NULL COMMENT '抢购平台首页banner图地址',
  `logo_pic` varchar(255) DEFAULT NULL COMMENT '活动服务显示小图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#员工标签
CREATE TABLE IF NOT EXISTS `user_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL COMMENT '员工标签',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `yyfw_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `lbsid` int(11) DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_staff_agree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usid` int(11) DEFAULT NULL,
  `wxid` varchar(64) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_staff_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `usid` int(11) DEFAULT NULL COMMENT '打赏员工id',
  `wxid` varchar(64) DEFAULT NULL COMMENT '打赏人wxid',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '打赏金额',
  `orderid` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '打赏时间',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `cleared_at` datetime DEFAULT NULL COMMENT '结算时间',
  `state` varchar(255) DEFAULT NULL COMMENT '0:未支付,1:已完成,2:已结算',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_staff_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `tag` varchar(32) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 库存表
CREATE TABLE IF NOT EXISTS `ai9me_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存表 ID',
  `wid` int(11) NOT NULL COMMENT '商户id ( pubs表的id )',
  `pro_id` int(11) NOT NULL COMMENT '商户的ID',
  `staff_id` int(11) NOT NULL COMMENT '员工表的ID (采购人员)',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商表ID',
  `specification` varchar(255) NOT NULL COMMENT '规格属性',
  `inventory_num` int(11) NOT NULL COMMENT '入库数量',
  `available_num` int(11) NOT NULL COMMENT '可用数量',
  `purchase_back_num` int(11) NOT NULL COMMENT '采购退货数量',
  `customer_back_num` int(11) NOT NULL COMMENT '顾客退货数量',
  `exwarehouse_num` int(11) NOT NULL COMMENT '出库数量',
  `damaged_num` int(11) NOT NULL COMMENT '报损数量',
  `costprice` float(10,2) NOT NULL COMMENT '成本价',
  `sellingprice` float(10,2) NOT NULL COMMENT '销售价格',
  `note` text COMMENT '备注',
  `time` int(11) NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 供应商表
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `wid` int(11) NOT NULL COMMENT '商户ID ( pubs表的ID )',
  `name` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(255) NOT NULL COMMENT '联系人',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `l_sheng` int(11) NOT NULL COMMENT '全国城市列表_省代码',
  `l_shi` int(11) NOT NULL COMMENT '全国城市列表_市代码',
  `l_xianqu` int(11) NOT NULL COMMENT '全国城市列表_县区代码',
  `addr` varchar(255) NOT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `note` text COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '供应商状态 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
