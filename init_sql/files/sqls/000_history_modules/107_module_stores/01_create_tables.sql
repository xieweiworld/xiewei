# 创建表的sql定义，存放在此文件中

set @business = '多门店业务';

# 2017-06-13

############# 平台功能相关表
# 1 系统权限编辑表 sys_right_defined
CREATE TABLE IF NOT EXISTS `sys_right_defined` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `right_code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '权限编码:sys_right.right_code',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `logo` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '权限图片',
  `sort_no` INT NULL DEFAULT 0 COMMENT '排序码',
  `is_enable` INT NULL DEFAULT 0 COMMENT '启用标记:1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


############# 商户功能相关表
# 1 员工管辖门店表 user_staff_admin_stores
CREATE TABLE IF NOT EXISTS `user_staff_admin_stores` (
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id',
  `staff_id` INT NOT NULL DEFAULT 0 COMMENT '员工id',
  `store_id` INT NOT NULL DEFAULT 0 COMMENT '门店id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2 卡片可办理的门店表 wmall_product_handle_stores
CREATE TABLE IF NOT EXISTS `wmall_product_handle_stores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `type` INT NOT NULL DEFAULT 0 COMMENT '办理类型:1全部门店,2仅限本店,3指定门店组,4指定门店',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '可办理门店或组id',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 3 卡片可消费的门店表 wmall_product_consume_stores
CREATE TABLE IF NOT EXISTS `wmall_product_consume_stores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `type` INT NOT NULL DEFAULT 0 COMMENT '消费类型:1全部门店,2仅限(办理)本店,3指定门店组,4指定门店',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '可办理门店或组id',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 4 会员卡可消费的门店表 member_card_consume_stores
CREATE TABLE IF NOT EXISTS `member_card_consume_stores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id',
  `card_id` INT NOT NULL DEFAULT 0 COMMENT '会员卡id',
  `type` INT NOT NULL DEFAULT 0 COMMENT '消费类型:1全部门店,2仅限本店,3指定门店组,4指定门店',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '门店id',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 5 会员积分兑换表  member_point_exchanges
/* # 不需要此表，按积分订单处理
CREATE TABLE IF NOT EXISTS `member_point_exchanges` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `store_id` INT NOT NULL DEFAULT 0 COMMENT '门店id',
  `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `source` INT NULL DEFAULT 0 COMMENT '兑换来源:1线下兑换,2微信申请',
  `unit_point` INT NULL DEFAULT 0 COMMENT '兑换积分',
  `amount` INT NULL DEFAULT 0 COMMENT '兑换数量',
  `points` INT NULL DEFAULT 0 COMMENT '兑换总积分',
  `exchange_at` DATETIME NULL DEFAULT NULL COMMENT '兑换时间',
  `exchange_id` VARCHAR(30) NOT NULL DEFAULT '0' COMMENT '兑换人id',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '兑换备注',
  `is_picked` INT NOT NULL DEFAULT 0 COMMENT '取货标记;1已取货,0未取货',
  `pick_date` DATETIME NULL DEFAULT NULL COMMENT '取货时间',
  `pick_remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '取货备注',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
*/

# 6 服务项目折扣表 customer_services_discount
CREATE TABLE IF NOT EXISTS `customer_services_discount` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `level_id` INT NULL DEFAULT 0 COMMENT '会员等级id',
  `service_id` INT NULL DEFAULT 0 COMMENT '服务项目id',
  `service_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '服务项目名称',
  `is_discount` INT NULL DEFAULT 0 COMMENT '折扣标记;1可享受,0不享受',
  `discount` DECIMAL(8,1) NULL DEFAULT 0 COMMENT '折扣额',
  `member_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '会员价',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 7 商户自动备份设置表 wmall_backup_set
CREATE TABLE IF NOT EXISTS `wmall_backup_set` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `data_type` INT NOT NULL DEFAULT 0 COMMENT '备份数据类型:1会员(含车辆),2会员卡,3卡充值消费记录',
  `interval` INT NOT NULL DEFAULT 0 COMMENT '备份间隔天数',

  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '接收人称呼',
  `mobile` VARCHAR(12) NOT NULL DEFAULT '' COMMENT '接收人手机',
  `is_mobile` INT NOT NULL DEFAULT 0 COMMENT '手机是否验证:0未验证,1已验证',

  `email` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '接收人邮箱',
  `email_code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '邮箱验证码',
  `is_email` INT NOT NULL DEFAULT 0 COMMENT '邮箱是否验证:0未验证,1已验证',
  `verify_at` DATETIME NULL DEFAULT NULL COMMENT '邮箱验证时间',

  `approve_state` INT NOT NULL DEFAULT 0 COMMENT '审核状态:0未审核,1审核通过,2已提交审核,3审核不通过',
  `submit_at` DATETIME NULL DEFAULT NULL COMMENT '提交审核时间',
  `approve_at` DATETIME NULL DEFAULT NULL COMMENT '审核通过时间',
  `approve_id` INT NOT NULL DEFAULT 0 COMMENT '审核人id',
  `approve_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '审核人',

  `last_saved_at` DATETIME NULL DEFAULT NULL COMMENT '上次备份时间',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '备注',
  `is_enable` INT NOT NULL DEFAULT 1 COMMENT '启用标记:1启用,0禁用',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 8 商户备份数据发送记录表 wmall_auto_backup
CREATE TABLE IF NOT EXISTS `wmall_auto_backup` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `title` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '邮件标题',
  `content` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '邮件内容',
  `zipfile` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '压缩文件路径',
  `backup_at` DATETIME NULL DEFAULT NULL COMMENT '备份时间',              
  `data_type` INT NOT NULL DEFAULT 0 COMMENT '备份数据类型,见设置表',
  `mobile` VARCHAR(12) NOT NULL DEFAULT '' COMMENT '接收人手机',
  `is_mobile` INT NOT NULL DEFAULT 0 COMMENT '已发送手机;1是,0否',
  `email` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '接收人邮箱',
  `is_email` INT NOT NULL DEFAULT 0 COMMENT '已发送邮件;1是,0否',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 9 门店所属分组 store_group
CREATE TABLE IF NOT EXISTS `store_group` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `remark` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '备注',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '顺序号',
  `is_enable` TINYINT NOT NULL DEFAULT 1 COMMENT '启用标记;1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 10 员工APP端登录表 user_staff_app_logins
CREATE TABLE IF NOT EXISTS `user_staff_app_logins` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `staff_id` INT NOT NULL DEFAULT 0 COMMENT '商户员工id',
  `app_wxid` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'APP公众号wxid',
  `is_login` TINYINT NOT NULL DEFAULT 1 COMMENT '登录标记;1已登录,0未登录(或已注销)',
  `login_first` DATETIME NULL DEFAULT NULL COMMENT '首次登录时间',
  `login_latest` DATETIME NULL DEFAULT NULL COMMENT '最近登录时间',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删;员工删除时，为1',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 11 开单配件人员表 (2017-07-24)
CREATE TABLE IF NOT EXISTS `order_product_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT '0' COMMENT '商户wid',
  `dept_id` int(11) DEFAULT '0' COMMENT '员工部门ID',
  `dept_name` varchar(50) DEFAULT '' COMMENT '员工部门名称',
  `order_id` int(11) DEFAULT '0' COMMENT '开单id',
  `order_code` varchar(50) DEFAULT '' COMMENT '开单单号',
  `product_id` int(11) DEFAULT '0' COMMENT '配件id',	
  `order_product_id` int(11) DEFAULT '0' COMMENT '开单配件id',
  `process_name` varchar(60) DEFAULT '' COMMENT '配件流程名称',
  `reward_amount` decimal(8,2) DEFAULT '0.00' COMMENT '提成金额',
  `operator_type` int(11) DEFAULT '0' COMMENT '人员类别:1普通施工人员,2普通销售人员',
  `operator_id` int(11) DEFAULT '0' COMMENT '员工id',
  `operator_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '同组人员ID(英文逗号分隔)',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_order_service_operator_wid` (`wid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='开单项目施工流程表';


# 2017-06-13


### 2017-07-27 先备份原始数据表
create table if not exists wmall_order_201707272001 select * from  wmall_order;
create table if not exists crm_contract_201707272001 select * from  crm_contract;
create table if not exists customer_set_201707272001 select * from  customer_set;
create table if not exists lbs_201707272001 select * from  lbs;
create table if not exists customer_role_201707272001 select * from  customer_role;
create table if not exists user_staff_dep_201707272001 select * from  user_staff_dep;
create table if not exists customer_product_type_201707272001 select * from  customer_product_type;
create table if not exists wmall_product_201707272001 select * from  wmall_product;
create table if not exists order_supplier_201707272001 select * from  order_supplier;
create table if not exists order_brand_201707272001 select * from  order_brand;
create table if not exists customer_carkeys_201707272001 select * from  customer_carkeys;
create table if not exists order_charge_repay_201707272001 select * from  order_charge_repay;
create table if not exists customer_money_in_201707272001 select * from  customer_money_in;
create table if not exists customer_money_out_201707272001 select * from  customer_money_out;
create table if not exists order_product_201707272001 select * from  order_product;
create table if not exists order_product_in_201707272001 select * from  order_product_in;
create table if not exists order_product_in_detail_201707272001 select * from  order_product_in_detail;
create table if not exists order_product_indetail_barcode_201707272001 select * from  order_product_indetail_barcode;
create table if not exists order_product_out_201707272001 select * from  order_product_out;
create table if not exists order_product_out_detail_201707272001 select * from  order_product_out_detail;
create table if not exists order_product_outdetail_batchno_201707272001 select * from  order_product_outdetail_batchno;
create table if not exists order_product_return_201707272001 select * from  order_product_return;
create table if not exists order_product_change_201707272001 select * from  order_product_change;
create table if not exists order_charge_201707272001 select * from  order_charge;
create table if not exists order_charge_detail_201707272001 select * from  order_charge_detail;
create table if not exists customer_message_content_201707272001 select * from  customer_message_content;
create table if not exists order_billing_201707272001 select * from  order_billing;
create table if not exists order_product_expense_201707272001 select * from  order_product_expense;
create table if not exists order_product_expense_code_201707272001 select * from  order_product_expense_code;
create table if not exists member_card_201707272001 select * from  member_card;
create table if not exists member_card_chongzhi_201707272001 select * from  member_card_chongzhi;
create table if not exists member_card_xiaofei_201707272001 select * from  member_card_xiaofei;

select '01' as 'Index', @business as 'Type', 'Create Tables' as 'Title', 'Done' as 'Status';