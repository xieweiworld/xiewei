# 修改表结构的sql定义，存放在此文件中

set @business = '多门店业务';

# 2017-06-13
# 系统权限表
ALTER TABLE `sys_right` ADD COLUMN `logo` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '权限图片' AFTER `menu_type`;

# 商城订单表
# ALTER TABLE `wmall_order`  ADD COLUMN `order_source` INT NULL DEFAULT '0' COMMENT '下单来源:1微信端,2后台端' AFTER `order_shop`;

# CRM合同表、商户设置表：
ALTER TABLE `crm_contract` ADD COLUMN `max_stores` INT NULL DEFAULT '1' COMMENT '最大门店数' AFTER `customer_level`;
ALTER TABLE `customer_set` ADD COLUMN `max_stores` INT NULL DEFAULT '1' COMMENT '最大门店数' AFTER `amount`;
ALTER TABLE `customer_set` ADD COLUMN `is_stores` INT NULL DEFAULT '0' COMMENT '是否是多门店版:1是,0否' AFTER `max_stores`;

# 商户配件分类表:
ALTER TABLE `customer_product_type` ADD COLUMN `store_id` INT NOT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# customer_product_type: 更换主键
ALTER TABLE `customer_product_type` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`, `wid`, `store_id`);


# 商户配件分类表:
ALTER TABLE `user_staff`
ADD COLUMN `manage_type` INT NULL DEFAULT '0' COMMENT '管理门店方式',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人';

# 门店表
ALTER TABLE `lbs` 
ADD COLUMN `pid` INT NOT NULL DEFAULT '0' COMMENT '所属父级' AFTER `id`,
ADD COLUMN `type` INT NOT NULL DEFAULT '0' COMMENT '门店类型:1(虚拟)总店,2(业务)门店,3部门,4各组' AFTER `wid`,
ADD COLUMN `group_id` INT NOT NULL DEFAULT '0' COMMENT '门店所属分组' AFTER `type`,
ADD COLUMN `code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '门店编码' AFTER `group_id`,
ADD COLUMN `full_path` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '全路径' AFTER `code`,
ADD COLUMN `short_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '门店简称' AFTER `name`,
ADD COLUMN `is_enable` INT NOT NULL DEFAULT 1 COMMENT '是否启用:1是,0否' AFTER `lbspwd`,
ADD COLUMN `is_master` INT NOT NULL DEFAULT 0 COMMENT '是否主管业务门店:1是,0否' AFTER `is_enable`,
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人';

# 部门表 user_staff_dep;
ALTER TABLE `user_staff_dep` 
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`,
ADD COLUMN `sort_no` INT NULL DEFAULT '0' COMMENT '排序号',
ADD COLUMN `is_enable` INT NULL DEFAULT 1 COMMENT '是否启用:1是,0否',
ADD COLUMN `is_delete` INT NULL DEFAULT 0 COMMENT '删除标记;1启用,0禁用',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人';

# 商品表
ALTER TABLE `wmall_product` 
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '门店id' AFTER `wid`;
#ADD COLUMN `handle_type` INT NULL DEFAULT '1' COMMENT '可办理门店类型:1全部门店，2仅限本店，3指定门店' AFTER `store_id`,
#ADD COLUMN `consume_type` INT NULL DEFAULT '1' COMMENT '可适用(消费)门店类型:1全部门店，2仅限办理本店，3指定门店' AFTER `handle_type`;

# 会员卡表
# ALTER TABLE `member_card` ADD COLUMN `consume_type` INT NULL DEFAULT '1' COMMENT '可适用(消费)门店类型:1全部门店，2仅限办理本店，3指定门店' AFTER `lbs_by`;


# 开单配件消耗表
ALTER TABLE `order_product_expense` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 开单配件消耗条码表
ALTER TABLE `order_product_expense_code` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 配件表
ALTER TABLE `order_product` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 供应商表
ALTER TABLE `order_supplier` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 配件品牌
ALTER TABLE `order_brand` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 角色
ALTER TABLE `customer_role` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 钥匙号设置
ALTER TABLE `customer_carkeys` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 入库单
ALTER TABLE `order_product_in`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`,
ADD COLUMN `out_order_id` INT NULL DEFAULT '0' COMMENT '出库单id' AFTER `store_id`;
# 入库单明细
ALTER TABLE `order_product_in_detail`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 入库明细条码表
ALTER TABLE `order_product_indetail_barcode`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 出库单
ALTER TABLE `order_product_out`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`,
ADD COLUMN `in_store_id` INT NULL DEFAULT '0' COMMENT '调入到的门店id' AFTER `store_id`;
# 出库明细
ALTER TABLE `order_product_out_detail`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 出库明细批次
ALTER TABLE `order_product_outdetail_batchno`
ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 退货单
ALTER TABLE `order_product_return` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;

# 盘点单
ALTER TABLE `order_product_change` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 挂帐表
ALTER TABLE `order_charge` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 挂帐明细表
ALTER TABLE `order_charge_detail` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 还款表
ALTER TABLE `order_charge_repay` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 资金收入表
ALTER TABLE `customer_money_in` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;
# 资金支出表
ALTER TABLE `customer_money_out` ADD COLUMN `store_id` INT NULL DEFAULT '0' COMMENT '所属门店id' AFTER `wid`;


# 公告内容表
ALTER TABLE `customer_message_content`  
ADD COLUMN `terminal` INT NOT NULL DEFAULT '0' COMMENT '发布终端:1全部,2Web,3App' AFTER `duration`,
ADD COLUMN `picture` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '公告图片' AFTER `terminal`;
# （历史数据 terminal 设置为 2）

# 车辆表: 颜色、排量
# ALTER TABLE `member_auto` ADD COLUMN `remark` VARCHAR(200) NULL DEFAULT '' COMMENT '备注' AFTER `is_bind`;


# 2017-07-21 会员价相关
ALTER TABLE `wmall_product` 
ADD COLUMN `is_use_mprice` INT NULL DEFAULT '0' COMMENT '是否显示会员价:1是,0否' AFTER `is_remote`,
ADD COLUMN `member_price` decimal(8,2) NULL DEFAULT '0' COMMENT '商品会员价' AFTER `is_use_mprice`;

ALTER TABLE `wmall_order_payinfo` 
ADD COLUMN `is_use_mprice` INT NULL DEFAULT '0' COMMENT '是否使用会员价:1是,0否' AFTER `payment`;


# 2017-07-24 办卡部门、销售部门、施工部门等信息（先加字段，后做功能）
# 接单人部门id
ALTER TABLE `order_billing` 
ADD COLUMN `receive_dept` INT NULL DEFAULT '0' COMMENT '接单人部门id' AFTER `receive_by`;
# 开单项目中的施工人员部门、销售人员部门
ALTER TABLE `order_service_operator` 
ADD COLUMN `dept_id` INT NULL DEFAULT '0' COMMENT '员工部门ID' AFTER `wid`,
ADD COLUMN `dept_name` VARCHAR(50) NULL DEFAULT '' COMMENT '员工部门名称' AFTER `dept_id`;
# 办卡记录中的办卡部门、销售部门
ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `sale_name` VARCHAR(20) NULL DEFAULT '' COMMENT '销售人员名称' AFTER `sale`,
ADD COLUMN `sale_dept` INT NULL DEFAULT '0' COMMENT '销售员工部门ID' AFTER `sale_name`,
ADD COLUMN `sale_dept_name` VARCHAR(50) NULL DEFAULT '' COMMENT '销售员工部门名称' AFTER `sale_dept`,
ADD COLUMN `operate_dept` INT NULL DEFAULT '0' COMMENT '办卡员工部门ID' AFTER `operate_by`,
ADD COLUMN `operate_dept_name` VARCHAR(50) NULL DEFAULT '' COMMENT '办卡员工部门名称' AFTER `operate_dept`;

# 添加转换字段 source_id (转换尊熹的库存相关数据)
ALTER TABLE `order_supplier` ADD COLUMN `source_id` INT NULL DEFAULT '0' COMMENT '原始ID' AFTER `id`;
ALTER TABLE `order_product` ADD COLUMN `source_id` INT NULL DEFAULT '0' COMMENT '原始ID' AFTER `id`;

# 2017-06-13

select '02' as 'Index', @business as 'Type', 'Alter Tables' as 'Title', 'Done' as 'Status';
