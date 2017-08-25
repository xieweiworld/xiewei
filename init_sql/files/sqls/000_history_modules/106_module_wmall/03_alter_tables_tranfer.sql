# 修改表结构的sql定义，存放在此文件中

# 商城新版业务

# 2017-05-12

# 转换数据用而添加字段
# +shift_status
ALTER TABLE `ai9me_product` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `ai9me_product_cart` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `fuwulist` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `dsqgrecord` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `ai9me_product_set` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `member_giftamount` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `member_coupon` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `member_coupon_list` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `yyfw_records` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

ALTER TABLE `redpack_set` 
ADD COLUMN `shift_status` INT NOT NULL DEFAULT 0 COMMENT '数据转换标记:0未转换,1转换中,2转换成功,3转换失败';

/*
ALTER TABLE `yyfw_records` 
ADD COLUMN `order_code` varchar(30) NOT NULL DEFAULT '' COMMENT '预约订单号';
*/

# 2017-04-19转入单独添加
# +source_id
ALTER TABLE `ai9me_product` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '原分类id,ai9me_product_cat.id' AFTER `id`;

ALTER TABLE `wmall_product` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '旧版商品id' AFTER `id`,
ADD COLUMN `source_desc` TEXT NULL COMMENT '旧商品描述信息' AFTER `source_id`,
ADD COLUMN `source_notice` TEXT NULL COMMENT '旧商品注意事项' AFTER `source_desc`;

ALTER TABLE `wmall_category` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '旧版商品分类id' AFTER `id`;

ALTER TABLE `wmall_product_category` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '旧版商品分类id' AFTER `id`;

ALTER TABLE `wmall_product_image` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '旧版商品id' AFTER `id`;

ALTER TABLE `wmall_order` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '原订单id' AFTER `id`;

ALTER TABLE `wmall_order_product` 
ADD COLUMN `source_id` INT NOT NULL DEFAULT 0 COMMENT '原订单id' AFTER `id`;

ALTER TABLE `wmall_coupon_list` 
ADD COLUMN `mobile` VARCHAR(64) NOT NULL DEFAULT 0 COMMENT '手机号码' AFTER `mid`,
ADD COLUMN `wxid` VARCHAR(64) NOT NULL DEFAULT '' COMMENT  '平台wxid' AFTER `mobile`,
ADD COLUMN `wid_wxid` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '商户wxid' AFTER `wxid`;


ALTER TABLE `wmall_order`
ADD COLUMN  `added_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN  `added_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人';

ALTER TABLE `wmall_order_product`
ADD COLUMN  `added_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN  `added_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人';

ALTER TABLE `wmall_order_payinfo`
ADD COLUMN  `added_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN  `added_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人';

# 2017-05-12

select '03' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status', 'Transfer Data' as 'Purpose';
