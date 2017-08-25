# 商户多账号系统数据库表结构定义

# 商户员工表，添加权限相关的字段
ALTER TABLE `user_staff` 
CHANGE COLUMN `lbsid` `lbsid` INT(11) NULL DEFAULT NULL COMMENT '门店id' AFTER `wid`,
CHANGE COLUMN `password` `password` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '员工登录密码' ,
ADD COLUMN `is_verified` INT NULL DEFAULT 0 COMMENT '手机验证:1已验证,0未验证' AFTER `mobile`,
ADD COLUMN `login_id` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '员工登录账号' AFTER `is_verified`,
ADD COLUMN `is_system` INT NULL DEFAULT 0 COMMENT '系统级账号:1是,0否' AFTER `password`,
ADD COLUMN `role_code` VARCHAR(20) NULL DEFAULT '' COMMENT '所属商户角色' AFTER `is_system`;


# 开单商品表: 添加提成字段
ALTER TABLE `order_product` 
ADD COLUMN `commission_type` INT NULL DEFAULT 0 COMMENT '提成类型:0固定提成,1比例提成' AFTER `single_price`,
ADD COLUMN `commission_ratio` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '提成金额/提成比例' AFTER `commission_type`;

# 会员卡商品: 添加启用标记
ALTER TABLE `ai9me_product_card` 
ADD COLUMN `is_enable` INT NULL DEFAULT 1 COMMENT '启用标记:1:已启用,0:已停用' AFTER `single_price`;

select '02-DONE';