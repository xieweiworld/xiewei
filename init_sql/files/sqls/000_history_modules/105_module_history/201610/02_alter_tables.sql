# 修改表结构的sql定义，存放在此文件中

# 2016-10-09

ALTER TABLE `order_product_out` 
ADD COLUMN `receive_staff` INT NULL DEFAULT 0 COMMENT '领用人' AFTER `out_detail`,
ADD COLUMN `receive_dept` INT NULL DEFAULT 0 COMMENT '领用人所属部门' AFTER `receive_staff`,
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '更新时间' AFTER `add_by`,
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '更新人' AFTER `update_date`;


ALTER TABLE `order_product_out_detail` 
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '更新时间' AFTER `add_by`,
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '更新人' AFTER `update_date`;

# 2016-10-09

# 2016-10-11

ALTER TABLE `customer_services` 
ADD COLUMN `is_fast` INT NULL DEFAULT 0 COMMENT '是否支持快捷开单' AFTER `single_price`;

# 2016-10-11


# service approve (20161012)

# 添加永久有效字段
ALTER TABLE `ai9me_product_card` ADD COLUMN `is_no_expire` INT NOT NULL DEFAULT 0 COMMENT '永久有效:1是,0否';
ALTER TABLE `ai9me_product_gift` ADD COLUMN `is_no_expire` INT NOT NULL DEFAULT 0 COMMENT '永久有效:1是,0否';
ALTER TABLE `member_card` ADD COLUMN `is_no_expire` INT NOT NULL DEFAULT 0 COMMENT '永久有效:1是,0否' AFTER `car_id`;

# 将储值卡初始化为1
update member_card set is_no_expire = 1 where type = 1 and is_no_expire = 0;

# service approve (20161012)

# 2016-10-12

UPDATE sys_right set is_available =0 where right_code='Billings/MassInitials';
UPDATE sys_right set sort_no =760 where right_code='Billings/AccessoryType';
update sys_right set right_code = 'Billings/partsSales', url = 'billings/partsSales' where id = 241; # 精品销售列表

# 添加支付方式字段
ALTER TABLE `customer_money_in` ADD COLUMN `pay_type` VARCHAR(20) NULL DEFAULT '' COMMENT '支付类型(多类型文本)' AFTER `order_time`;
ALTER TABLE `order_charge_repay` ADD COLUMN `pay_type` VARCHAR(20) NULL DEFAULT '' COMMENT '支付类型(多类型文本)' AFTER `repay_remark`;

# 2016-10-12


# 2016-10-18

# 添加散客字段
ALTER TABLE `member_base` ADD COLUMN `is_guest` int NULL DEFAULT 0 COMMENT '散(访)客1:是,0否' AFTER `source`;

ALTER TABLE `order_product_out`  ADD INDEX `idx_order_product_out_typeid` USING BTREE (`out_typeid` ASC);
ALTER TABLE `order_product_expense`  ADD INDEX `idx_order_product_expense_orderid` USING BTREE (`order_id` ASC);

# 2016-10-18

# 2016-10-19

# 菜单添加时间字段
ALTER TABLE `menu` 
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '创建时间',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '更新时间';

# 开单表
ALTER TABLE `order_billing` ADD COLUMN `amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '订单总金额' AFTER `preget_price`;

# 2016-10-19


