# 开单系统数据库表结构定义

# order_product: pinyin, chars
# customer_services: pinyin, chars


# 会员卡消费表添加字段: 单次施工价格
ALTER TABLE `member_card_xiaofei` 
ADD COLUMN `single_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '单次施工价格' AFTER `actual_amount`;


# 商户服务商品表调整结构: 增加字段
ALTER TABLE `fuwulist` 
CHANGE COLUMN `price` `price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '价格' ,
CHANGE COLUMN `yuanjia` `yuanjia` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '原价' ,
CHANGE COLUMN `audittime` `audit_time` INT(11) NULL DEFAULT NULL COMMENT '审核时间' ,
CHANGE COLUMN `ser1` `ser1` INT(11) NULL DEFAULT 0 COMMENT '商户服务大类' ,
CHANGE COLUMN `ser2` `ser2` INT(11) NULL DEFAULT 0 COMMENT '商户服务小类' ,
ADD COLUMN `sys_ser1` INT NULL DEFAULT 0 COMMENT '平台服务大类' AFTER `ser2`,
ADD COLUMN `sys_ser2` INT NULL DEFAULT 0 COMMENT '平台服务小类' AFTER `sys_ser1`,
ADD COLUMN `audit_by` VARCHAR(30) NULL COMMENT '审核人' AFTER `reason`,
ADD COLUMN `add_date` DATETIME NULL COMMENT '新增时间' AFTER `is_online`,
ADD COLUMN `add_by` VARCHAR(30) NULL COMMENT '新增人' AFTER `add_date`;


# 供应商表 order_supplier
CREATE TABLE IF NOT EXISTS `order_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `wid` int(11) NOT NULL COMMENT '商户id(wid)',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `contacts` varchar(20) NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(30) NULL DEFAULT '' COMMENT '电话',
  `addr` varchar(100) NULL DEFAULT '' COMMENT '地址',
  `email` varchar(50) NULL DEFAULT '' COMMENT '邮箱',
  `bank_name` varchar(20) NULL DEFAULT '' COMMENT '开户行',
  `account_name` varchar(20) NULL DEFAULT '' COMMENT '开户名',
  `bank_account` varchar(20) NULL DEFAULT '' COMMENT '银行账号',
  `note` varchar(100) NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态:1:合作中2:终止合作',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 产品品牌表 order_brand
CREATE TABLE IF NOT EXISTS `order_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `wid` int(11) NOT NULL COMMENT '商户id(wid)',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `sort_no` tinyint NULL DEFAULT 0 COMMENT '排序码',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态:1正常,2删除',
  `add_date` datetime NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 产品表 order_product
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `wid` int(11) NOT NULL COMMENT '商户id(wid)',
  `supplier_id` int(11) NULL DEFAULT 0 COMMENT '供应商id',
  `product_type` varchar(20) NOT NULL DEFAULT '' COMMENT '产品分类',
  `product_code` varchar(20) NOT NULL DEFAULT '' COMMENT '产品编码',
  `product_name` varchar(20) NOT NULL DEFAULT '' COMMENT '产品名称',
  `product_brand` varchar(20) NOT NULL DEFAULT '' COMMENT '所属品牌',
  `product_model` varchar(20) NOT NULL DEFAULT '' COMMENT '规格型号',
  `product_pinyin` varchar(100) NOT NULL DEFAULT '' COMMENT '名称全拼',
  `product_chars` varchar(30) NOT NULL DEFAULT ''  COMMENT '各名字首字母,搜索码',
  `status` int(11) NULL DEFAULT 1 COMMENT '产品状态:0停售1在售',

  `suit_car_type` varchar(20) NULL DEFAULT '' COMMENT '适合车型',
  `repository` varchar(20) NULL DEFAULT '' COMMENT '仓储位置',
  `amount` int(11) NULL DEFAULT 0 COMMENT '当前库存',
  `usable_amount` int(11) NULL DEFAULT 0 COMMENT '可用库存',
  `warning_amount` int(11) NULL DEFAULT 0 COMMENT '库存预警数',
  `unit` varchar(10) NULL DEFAULT '' COMMENT '单位',
  `price` decimal(8,2) NULL DEFAULT 0 COMMENT '当前售价',
  `last_price` decimal(8,2) NULL DEFAULT 0 COMMENT '最新进货价',
  `single_price` decimal(8,2) NULL DEFAULT 0 COMMENT '单次施工价格',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 采购入库表 order_product_in
CREATE TABLE IF NOT EXISTS `order_product_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `in_type` int(11) NOT NULL DEFAULT 0 COMMENT '入库类型:1库存初始化2采购入库3库存盘点4订单退货入库9其他入库',
  `in_code` varchar(50) NOT NULL DEFAULT '' COMMENT '入库单号',
  
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供应商id',
  `in_time` datetime DEFAULT NULL COMMENT '进货时间',
  `in_man` int(11) NULL DEFAULT 0 COMMENT '进货人id',
  `in_remark` varchar(200) NULL DEFAULT '' COMMENT '入库备注',
  `in_detail` varchar(200) NULL DEFAULT '' COMMENT '入库明细',

  `coupon_price` decimal(8,2) NULL DEFAULT 0 COMMENT '优惠金额',
  `transport_price` decimal(8,2) NULL DEFAULT 0 COMMENT '运费金额',
  `other_price` decimal(8,2) NULL DEFAULT 0 COMMENT '其他金额',
  `total_amount` int(11) NULL DEFAULT 0 COMMENT '总数量',
  `total_price` decimal(8,2) NULL DEFAULT 0 COMMENT '总价格',
  `return_price` decimal(8,2) NULL DEFAULT 0 COMMENT '退货金额',

  `is_settlement` int(11) NULL DEFAULT 0 COMMENT '是否结算',
  `settle_time` datetime DEFAULT NULL COMMENT '结算时间',
  `settle_man` int(11) NULL DEFAULT 0 COMMENT '结算人id',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 采购入库明细表 order_product_in_detail
CREATE TABLE IF NOT EXISTS `order_product_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT NULL COMMENT '商户id(wid)',
  `in_order_id` int(11) NULL DEFAULT NULL COMMENT '入库单id',

  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `product_type` varchar(20) NULL DEFAULT '' COMMENT '产品分类',
  `product_code` varchar(20) NULL DEFAULT '' COMMENT '产品编码',
  `product_brand` varchar(20) NULL DEFAULT '' COMMENT '品牌',
  `product_name` varchar(30) NULL DEFAULT '' COMMENT '产品名称',
  `product_model` varchar(20) NULL DEFAULT '' COMMENT '规格型号',
  `suit_car_type` varchar(20) NULL DEFAULT '' COMMENT '适合车型',
  `repository` varchar(20) NULL DEFAULT '' COMMENT '仓储位置',

  `in_count` int(11) NULL DEFAULT 0 COMMENT '进货数量',
  `return_count` int(11) NULL DEFAULT 0 COMMENT '已退货数量',
  `in_unit` varchar(10) NULL DEFAULT '' COMMENT '进货单位',
  `in_price` decimal(8,2) NULL DEFAULT 0 COMMENT '进货价',
  `sale_price` decimal(8,2) NULL DEFAULT 0 COMMENT '销售价',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 出货记录表 order_product_out
CREATE TABLE IF NOT EXISTS `order_product_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int NULL DEFAULT NULL COMMENT '商户id(wid)',
  `out_type` int NULL DEFAULT 0 COMMENT '出库类型:1开单出库2订单出库3盘点出库9其他出库',
  `out_code` varchar(50) NULL DEFAULT 0 COMMENT '出库单号',
  `out_typeid` int NULL DEFAULT NULL COMMENT '出货业务ID',
  `out_count` int NULL DEFAULT 0 COMMENT '出货数量',
  `out_price` decimal(8,2) NULL DEFAULT 0 COMMENT '出货价格',

  `out_man` int(11) NULL DEFAULT 0 COMMENT '出货人id',
  `out_time` datetime DEFAULT NULL COMMENT '出货时间',
  `out_remark` varchar(200) NULL DEFAULT '' COMMENT '出货备注',
  `out_detail` varchar(200) NULL DEFAULT '' COMMENT '出货明细',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 出货明细表 order_product_out_detail
CREATE TABLE IF NOT EXISTS `order_product_out_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT NULL COMMENT '商户id(wid)',
  `out_order_id` int(11) NOT NULL DEFAULT 0 COMMENT '出货单id',
  
  `product_id` int(11) NULL DEFAULT 0 COMMENT '产品id',
  `product_type` varchar(20) NULL DEFAULT '' COMMENT '产品分类',
  `product_code` varchar(20) NULL DEFAULT '' COMMENT '产品编码',
  `product_name` varchar(30) NULL DEFAULT '' COMMENT '产品名称',
  `product_model` varchar(20) NULL DEFAULT '' COMMENT '规格型号',
  `product_brand` varchar(20) NULL DEFAULT '' COMMENT '品牌',
  `repository` varchar(20) NULL DEFAULT '' COMMENT '仓储位置',
  `out_count` int(11) NULL DEFAULT 0 COMMENT '出货数量',
  `out_price` decimal(8,2) NULL DEFAULT 0 COMMENT '出货价',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 采购退货表 order_product_return
CREATE TABLE IF NOT EXISTS `order_product_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `in_order_id` int(11) NULL DEFAULT 0 COMMENT '入库单id',
  `supplier_id` int(11) NULL DEFAULT 0 COMMENT '供应商id',
  `return_detail` varchar(200) NULL DEFAULT '' COMMENT '退货明细',
  `return_count` int NULL DEFAULT 0 COMMENT '退货总数量',
  `return_price` decimal(8,2) NULL DEFAULT 0 COMMENT '退货总价格',
  `return_remark` varchar(100) NULL DEFAULT '' COMMENT '退货备注',
  `return_time` datetime DEFAULT NULL COMMENT '退货时间',
  `return_by` varchar(30) NULL DEFAULT '' COMMENT '退货人',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 退货明细表 order_product_return_detail
CREATE TABLE IF NOT EXISTS `order_product_return_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int NULL DEFAULT NULL COMMENT '商户id(wid)',
  `return_id` int(11) NULL DEFAULT NULL COMMENT '退货单id',
  
  `product_id` int(11) NULL DEFAULT 0 COMMENT '产品id',
  `product_type` varchar(20) NULL DEFAULT '' COMMENT '产品分类',
  `product_code` varchar(20) NULL DEFAULT '' COMMENT '产品编码',
  `product_name` varchar(30) NULL DEFAULT '' COMMENT '产品名称',
  `product_model` varchar(20) NULL DEFAULT '' COMMENT '规格型号',
  `product_brand` varchar(20) NULL DEFAULT '' COMMENT '品牌',
  `repository` varchar(20) NULL DEFAULT '' COMMENT '仓储位置',
  `return_count` int NULL DEFAULT 0 COMMENT '退货数量',
  `return_price` decimal(8,2) NULL DEFAULT 0 COMMENT '退货价格',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 库存盘点表 order_product_change
CREATE TABLE IF NOT EXISTS `order_product_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int NULL DEFAULT NULL COMMENT '商户id(wid)',
  `check_code` varchar(50) NULL DEFAULT '' COMMENT '盘点单号',
  `check_name` varchar(50) NULL DEFAULT '' COMMENT '盘点名称',
  `reason` varchar(100) NULL DEFAULT '' COMMENT '调整原因',
  `change_time` datetime DEFAULT NULL COMMENT '办理时间',
  `change_by` int NULL DEFAULT NULL COMMENT '办理人',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 库存盘点明细表 order_product_change_detail
CREATE TABLE IF NOT EXISTS `order_product_change_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int NULL DEFAULT NULL COMMENT '商户id(wid)',
  `check_id` int(11) NULL DEFAULT NULL COMMENT '盘点id',

  `product_id` int(11) NULL DEFAULT 0 COMMENT '产品id',
  `product_type` varchar(20) NULL DEFAULT '' COMMENT '产品分类',
  `product_code` varchar(20) NULL DEFAULT '' COMMENT '产品编码',
  `product_name` varchar(30) NULL DEFAULT '' COMMENT '产品名称',
  `product_model` varchar(20) NULL DEFAULT '' COMMENT '规格型号',
  `product_brand` varchar(20) NULL DEFAULT '' COMMENT '品牌',
  `repository` varchar(20) NULL DEFAULT '' COMMENT '仓储位置',

  `amount` int NULL DEFAULT 0 COMMENT '系统库存',
  `after_amount` int NULL DEFAULT 0 COMMENT '调整后库存',
  `amount_changes` int NULL DEFAULT 0 COMMENT '库存变化:正数:增加,负数:减少',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 开单表 order_billing
CREATE TABLE IF NOT EXISTS `order_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `pid` int(11) NULL DEFAULT 0 COMMENT '父单据(所属A单)',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `order_type` int(11) NOT NULL DEFAULT 0 COMMENT '单据类型:1A单,2B单,3:项目消费,3:购买商品,5:待定',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '单据编号',
  `order_detail` varchar(200) NULL DEFAULT '' COMMENT '开单明细(内容)',
  `receiver` varchar(20) NULL DEFAULT '' COMMENT '接单人',
  `created_at` datetime DEFAULT NULL COMMENT '开单时间',
  `key_code` varchar(20) NULL DEFAULT '' COMMENT '钥匙号',
  `remark` varchar(200) NULL DEFAULT '' COMMENT '开单备注',

  `preget_price` decimal(8,2) NULL DEFAULT 0 COMMENT '预收款',
  `order_amount` decimal(8,2) NULL DEFAULT 0 COMMENT '订单总金额',
  `coupon_price` decimal(8,2) NULL DEFAULT 0 COMMENT '优惠金额',
  `kaquan_price` decimal(8,2) NULL DEFAULT 0 COMMENT '卡券支付金额',
  `mcard_price` decimal(8,2) NULL DEFAULT 0 COMMENT '会员卡支付金额',
  `vcard_price` decimal(8,2) NULL DEFAULT 0 COMMENT '储值卡支付金额',
  `cash_price` decimal(8,2) NULL DEFAULT 0 COMMENT '现金支付',
  `bcard_price` decimal(8,2) NULL DEFAULT 0 COMMENT '刷卡支付',
  `weixin_price` decimal(8,2) NULL DEFAULT 0 COMMENT '微信支付',
  `alipay_price` decimal(8,2) NULL DEFAULT 0 COMMENT '支付宝支付',
  `debt_price` decimal(8,2) NULL DEFAULT 0 COMMENT '挂账金额',
  `other_price` decimal(8,2) NULL DEFAULT 0 COMMENT '其他费用',
  `other_remark` varchar(50) NULL DEFAULT '' COMMENT '其他费用备注',

  `is_end` int NULL DEFAULT 0 COMMENT '进度标识:0未完工1已完工',
  `end_time` datetime DEFAULT NULL COMMENT '完工时间',
  `end_by` varchar(30) NULL DEFAULT '' COMMENT '完工操作人id',

  `status` int(11) NULL DEFAULT 0 COMMENT '状态:1挂单2开单3结算4作废',
  
  `settle_time` datetime DEFAULT NULL COMMENT '结算时间',
  `settle_man` int(11) NULL DEFAULT 0 COMMENT '结算人id',
  `cancel_time` datetime DEFAULT NULL COMMENT '作废时间',
  `cancel_man` int(11) NULL DEFAULT 0 COMMENT '作废人id',
  `cancel_remark` varchar(50) NULL DEFAULT '' COMMENT '作废备注',
  `is_make_order_b` int(11) NULL DEFAULT 0 COMMENT '是否已生成B单',
  `create_time_b` datetime DEFAULT NULL COMMENT '生成B单时间',

  `mid` int(11) NULL DEFAULT 0 COMMENT '会员ID',
  `member_name` varchar(20) NULL DEFAULT '' COMMENT '会员姓名',
  `member_mobile` varchar(20) NULL DEFAULT '' COMMENT '手机号',
  `member_statement` varchar(200) NULL DEFAULT '' COMMENT '客户陈述',
  `fault_notes` varchar(200) NULL DEFAULT '' COMMENT '故障现象',

  `car_id` int(11) NULL DEFAULT 0 COMMENT '车辆ID',
  `cpai` varchar(20) NULL DEFAULT '' COMMENT '车牌',
  `car_brand` varchar(20) NULL DEFAULT '' COMMENT '品牌',
  `car_series` varchar(20) NULL DEFAULT '' COMMENT '车系',
  `car_model` varchar(20) NULL DEFAULT '' COMMENT '车型',
  `chejia` varchar(20) NULL DEFAULT '' COMMENT '车架号',
  `engine` varchar(20) NULL DEFAULT '' COMMENT '发动机号',
  `bylong` int(11) NULL DEFAULT 0 COMMENT '上次保养公里数',
  `next_bylong` int(11) NULL DEFAULT 0 COMMENT '下次保养公里数',
  `next_njtime` date DEFAULT NULL COMMENT '年检到期时间',
  `next_bytime` date DEFAULT NULL COMMENT '下次保养日期',
  `next_bxtime` date DEFAULT NULL COMMENT '保险到期时间',
  `bxcompany` varchar(20) NULL DEFAULT '' COMMENT '保险公司',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `order_billing_order_code_unique` (`order_code` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 开单服务项目表 order_service
CREATE TABLE IF NOT EXISTS `order_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `order_id` varchar(30) NULL DEFAULT '' COMMENT '单据id',
  `service_id` int(11) NULL DEFAULT 0 COMMENT '服务id',
  `service_name` varchar(20) NULL DEFAULT '' COMMENT '服务名称',
  `card_id` int(11) NULL DEFAULT 0 COMMENT '支付会员卡id',

  `price` decimal(8,2) NULL DEFAULT 0 COMMENT '售价',
  `discount` decimal(8,2) NULL DEFAULT 0 COMMENT '折扣',
  `discount_price` decimal(8,2) NULL DEFAULT 0 COMMENT '折扣后价格',
  `operator` varchar(200) NULL DEFAULT '' COMMENT '施工人员,多人id',
  `retailer` varchar(20) NULL DEFAULT '' COMMENT '销售人员,单人id',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 开单消耗产品表 order_product_expense
CREATE TABLE IF NOT EXISTS `order_product_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `order_id` varchar(30) NULL DEFAULT '' COMMENT '单据id',
  `service_id` int(11) NULL DEFAULT 0 COMMENT '服务id',
  `service_name` varchar(20) NULL DEFAULT '' COMMENT '服务名称',
  `product_id` varchar(30) NULL DEFAULT '' COMMENT '产品id',
  `product_name` varchar(20) NULL DEFAULT '' COMMENT '产品名称',
  `product_model` varchar(20) NULL DEFAULT '' COMMENT '规格型号',
  `product_brand` varchar(20) NULL DEFAULT '' COMMENT '所属品牌',

  `amount` int(11) NULL DEFAULT 0 COMMENT '数量',
  `price` decimal(8,2) NULL DEFAULT 0 COMMENT '单价',
  `total_price` decimal(8,2) NULL DEFAULT 0 COMMENT '金额',
  `discount` decimal(8,2) NULL DEFAULT 0 COMMENT '折扣',
  `discount_price` decimal(8,2) NULL DEFAULT 0 COMMENT '折扣后价格',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 挂账表 order_charge
CREATE TABLE IF NOT EXISTS `order_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员ID',

  `total_charge` decimal(8,2) NULL DEFAULT 0 COMMENT '总挂账金额',
  `current_charge` decimal(8,2) NULL DEFAULT 0 COMMENT '当前挂账金额',
  `repaid_charge` decimal(8,2) NULL DEFAULT 0 COMMENT '已还款金额',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mid_unique` (`mid` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 挂账明细表 order_charge_detail
CREATE TABLE IF NOT EXISTS `order_charge_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员ID',

  `order_id` int NULL DEFAULT 0 COMMENT '挂账单据ID',
  `order_type` int(11) NULL DEFAULT 0 COMMENT '单据类型',
  `charge_amount` decimal(8,2) NULL DEFAULT 0 COMMENT '挂账金额',
  `charge_time` datetime DEFAULT NULL COMMENT '挂账时间',
  `remark` varchar(200) NULL DEFAULT '' COMMENT '备注',

  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 还款明细表 order_charge_repay
CREATE TABLE IF NOT EXISTS `order_charge_repay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员ID',

  `repay_amount` decimal(8,2) NULL DEFAULT 0 COMMENT '还款金额',
  `repay_time` datetime DEFAULT NULL COMMENT '还款时间',
  `repay_remark` varchar(200) NULL DEFAULT '' COMMENT '还款备注',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 会员反馈信息 member_feedback
CREATE TABLE IF NOT EXISTS `member_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员id',

  `stated_at` datetime DEFAULT NULL COMMENT '反馈时间',
  `content` varchar(200) NULL DEFAULT '' COMMENT '反馈内容',

  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 车辆历史信息表 member_auto_history
CREATE TABLE IF NOT EXISTS `member_auto_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id(wid)',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员id',
  `cpai` varchar(20) NULL DEFAULT '' COMMENT '车牌',

  `brand_name` varchar(20) NULL DEFAULT '' COMMENT '品牌名称',
  `series_name` varchar(20) NULL DEFAULT '' COMMENT '车系名称',
  `model_name` varchar(20) NULL DEFAULT '' COMMENT '车型名称',
  `brand_code` varchar(20) NULL DEFAULT '' COMMENT '品牌编码',
  `series_code` varchar(20) NULL DEFAULT '' COMMENT '车系编码',
  `model_code` varchar(20) NULL DEFAULT '' COMMENT '车型编码',

  `bxtime` date DEFAULT NULL COMMENT '上次保险日期',
  `next_bxtime` date DEFAULT NULL COMMENT '下次保险日期',
  `bxcompany` varchar(20) NULL DEFAULT '' COMMENT '保险公司',

  `next_njtime` date DEFAULT NULL COMMENT '年检到期时间',

  `bytime` date DEFAULT NULL COMMENT '上次保养日期',
  `next_bytime` date DEFAULT NULL COMMENT '下次保养日期',
  `bylong` int(11) NULL DEFAULT 0 COMMENT '上次保养公里数',
  `next_bylong` int(11) NULL DEFAULT 0 COMMENT '下次保养公里数',

  `engine` varchar(30) NULL DEFAULT '' COMMENT '发动机号', 
  `chejia` varchar(30) NULL DEFAULT '' COMMENT '车架号',
  `danganhao` varchar(30) NULL DEFAULT '' COMMENT '档案号', 
  `buy_date` date NULL DEFAULT NULL COMMENT '购车日期',
  `first_date` date NULL DEFAULT NULL COMMENT '首次进店日期',

  `weixiu_times` int(11) NULL DEFAULT 0 COMMENT '历史维修次数',
  `weixiu_money` decimal(8,2) NULL DEFAULT 0 COMMENT '历史维修费用',
  `last_date` date NULL DEFAULT NULL COMMENT '上次进店日期',
  `last_jieche` varchar(50) NULL DEFAULT '' COMMENT '上次接车单',
  `cpai_register` date NULL DEFAULT NULL COMMENT '车牌登记日',
  `sale_date` date NULL DEFAULT NULL COMMENT '销售日期',
  `carkilometre` int(11) NULL DEFAULT 0 COMMENT '行驶公里数',

  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户服务项目分类表 customer_services
# id 从 500 开始，至少于平台现有服务项目id分开范围
CREATE TABLE IF NOT EXISTS `customer_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务项目id',
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级ID',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '分类名称',
  `name_pinyin` varchar(100) NOT NULL DEFAULT '' COMMENT '名称全拼',
  `name_chars` varchar(30) NOT NULL DEFAULT '' COMMENT '各名字首字母',
  `image_path` varchar(200) NULL DEFAULT '' COMMENT '分类图片路径',

  `cost_price` decimal(8,2) NULL DEFAULT 0 COMMENT '成本价',
  `sale_price` decimal(8,2) NULL DEFAULT 0 COMMENT '销售价',
  `hour_price` decimal(8,2) NULL DEFAULT 0 COMMENT '工时费',
  `member_price` decimal(8,2) NULL DEFAULT 0 COMMENT '会员价',
  `yuyue_price` decimal(8,2) NULL DEFAULT 0 COMMENT '预约价',
  `single_price` decimal(8,2) NULL DEFAULT 0 COMMENT '单次施工价格',
  `is_discount` int NULL DEFAULT 0 COMMENT '是否支持会员折扣',
  `is_yuyue` int NULL DEFAULT 0 COMMENT '是否支持预约',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_enable` int(11) DEFAULT 1 COMMENT '启用标记:0禁用,1启用',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`, `wid`)
) ENGINE=MyISAM AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;


#18.2 车型档次表 customer_car_level
CREATE TABLE IF NOT EXISTS `customer_car_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员id',
  `car_level_name` varchar(10) NULL DEFAULT '' COMMENT '档次名称',
  `price1` varchar(30) NULL DEFAULT '' COMMENT '档次价格1',
  `price2` varchar(30) NULL DEFAULT '' COMMENT '档次价格2',
  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 18.3  使用车型表 car_type => 转入数据字典表
# 18.4  钥匙凭码表 customer_carkeys
# 18.5  提醒设置表 customer_remind
# 18.6  提醒记录表 customer_remind_record


# 18.8  资金收入表 customer_money_in [新增的那部分数据]
# 从其他订单及本数据表中一起建立视图 v_customer_money_in_all ，得到总的资金收表
CREATE TABLE IF NOT EXISTS `customer_money_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id',
  `in_type` int(11) NULL DEFAULT 0 COMMENT '收入类型,见文档',
  `type_id` int(11) NULL DEFAULT 0 COMMENT '对应订单id',
  `order_id` varchar(50) NULL DEFAULT '' COMMENT '备注',

  `order_price` decimal(8,2) NULL DEFAULT 0 COMMENT '收入流水',
  `coupon_price` decimal(8,2) NULL DEFAULT 0 COMMENT '优惠金额',
  `actual_price` decimal(8,2) NULL DEFAULT 0 COMMENT '实际收入',
  `order_time` datetime DEFAULT NULL COMMENT '收入时间',
  `remark` varchar(100) NULL DEFAULT '' COMMENT '备注',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 18.7  资金支出表 customer_money_out 
CREATE TABLE IF NOT EXISTS `customer_money_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id',
  `out_type` int(11) NULL DEFAULT 0 COMMENT '收入类型,见文档',
  `type_id` int(11) NULL DEFAULT 0 COMMENT '对应订单id',
  `order_id` varchar(50) NULL DEFAULT '' COMMENT '单据号',

  `order_price` decimal(8,2) NULL DEFAULT 0 COMMENT '支出流水',
  `actual_price` decimal(8,2) NULL DEFAULT 0 COMMENT '实际支出',
  `order_time` datetime DEFAULT NULL COMMENT '支出时间',
  `remark` varchar(100) NULL DEFAULT '' COMMENT '备注',

  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 会员其他信息 member_base_info
CREATE TABLE IF NOT EXISTS `member_base_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` int(11) NULL DEFAULT 0 COMMENT '商户id',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员id',
  `summary` varchar(100) NULL DEFAULT '' COMMENT '到店信息',

  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


#20160922, 20161022重新整理
# 5、创建提成表
CREATE TABLE IF NOT EXISTS `customer_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提成ID',
  `wid` int(11) DEFAULT 0 NOT NULL COMMENT '商户的ID',
  `category_type` tinyint(10) DEFAULT 0 COMMENT '类型1-3: 1配件销售提成 2项目提成 3会员卡销售提成',
  `category_id` varchar(50) DEFAULT '' NOT NULL COMMENT '卡片id,项目id,配件id',
  `bonus_type1` tinyint(4) DEFAULT '0' NOT NULL COMMENT '销售提成方式:0固定提成,1比例提成',
  `amount1` decimal(8,2) DEFAULT '0.00' NOT NULL COMMENT '提成金额/提成比例',
  `bonus_type2` tinyint(4) DEFAULT '0' COMMENT '施工提成方式:0固定提成,1比例提成',
  `amount2` decimal(8,2) DEFAULT '0.00' COMMENT '提成金额/提成比例',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_bouns_category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- 将之前提成表（commission）的数据移动到新的表
-- 更新customer_bonus表数据 ,部分没有token的数据删除
INSERT INTO customer_bonus ( wid, category_type, category_id, bonus_type1, amount1, add_date, add_by ) 
SELECT p.token AS wid, 3 AS category_type, c.product_id AS category_id, commission_type AS bonus_type1, commission_ratio AS amount1, now() AS add_date, 'transform2' AS add_by 
FROM commission c inner JOIN ai9me_product p ON c.product_id = p.id where commission_type!=0;

INSERT INTO customer_bonus ( wid, category_type, category_id, bonus_type1, amount1, add_date, add_by ) 
SELECT wid, 1 AS category_type, id AS category_id, commission_type AS bonus_type1, commission_ratio AS amount1, now() AS add_date, 'transform2' AS add_by 
FROM order_product where commission_type!=0;


# 7、车辆修改历史的id，去掉自增属性
ALTER TABLE member_auto_history CHANGE id id int(11) NOT NULL DEFAULT '0' COMMENT '车辆ID';
ALTER TABLE member_auto_history DROP PRIMARY KEY;


# 8、新增服务项目修改历史表
CREATE TABLE IF NOT EXISTS `log_customer_services` (
	`id` int(11) NOT NULL DEFAULT 0 COMMENT '修改的项目id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `pid` int(11) DEFAULT 0 COMMENT '上级id',
    `service_name1` varchar(20) DEFAULT '' COMMENT '修改前的服务分类名称',
    `service_name2` varchar(20) DEFAULT '' COMMENT '修改后的服务项目名称',
    `add_date` datetime DEFAULT NULL COMMENT '变更时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '变更人'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#20160922, 20161022重新整理


# 19.1  流程设置 process_setting
# 19.2  流程类别 process_setting_type
# 19.3  流程节点设置 process_setting_item
# 19.4  流程信息 proccess_info
# 19.5  流程节点信息 process_item

select '01-DONE';