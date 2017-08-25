# 修改表结构的sql定义，存放在此文件中

# publishing
# publishing

########## [START] 会员卡编辑问题

# 会员卡编辑扩展定义值
ALTER TABLE `member_card` CHANGE COLUMN `status` `status` TINYINT(4) NULL DEFAULT '0' COMMENT '0:正常,1:删除,2:未付款,3:已停用' ;

# 添加商户门店字段
ALTER TABLE `member_card` 
ADD COLUMN `lbs_id` INT NULL DEFAULT 0 COMMENT '办卡门店id' AFTER `wid`,
ADD COLUMN `lbs_by` VARCHAR(30) NULL DEFAULT '' COMMENT '办卡门店名称' AFTER `lbs_id`;

ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `lbs_id` INT NULL DEFAULT 0 COMMENT '办卡门店id' AFTER `wid`,
ADD COLUMN `lbs_by` VARCHAR(30) NULL DEFAULT '' COMMENT '办卡门店名称' AFTER `lbs_id`;

ALTER TABLE `member_card_xiaofei` 
ADD COLUMN `lbs_id` INT NULL DEFAULT 0 COMMENT '消费门店id' AFTER `wid`,
ADD COLUMN `lbs_by` VARCHAR(30)  NULL DEFAULT '' COMMENT '消费门店名称' AFTER `lbs_id`;

# 添加办卡人员字段
ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `operate_id` INT DEFAULT 0 COMMENT '办卡人员id' AFTER `sale`,
ADD COLUMN `operate_by` VARCHAR(20) DEFAULT '' COMMENT '办卡人员名称' AFTER `operate_id`;

ALTER TABLE `ai9me_product_cart` 
ADD COLUMN `operate_id` INT DEFAULT 0 COMMENT '办卡人员id' AFTER `code`,
ADD COLUMN `operate_by` VARCHAR(20) DEFAULT '' COMMENT '办卡人员名称' AFTER `operate_id`;

########## [FINISH] 会员卡编辑问题


########## [START] 处理多一个手机号、一个微信号存在多mid的问题

# member_auto: 加 wid，根据 mid 中的 wid 初始化
ALTER TABLE `member_auto`
ADD COLUMN `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid' AFTER `id`;


# ai9me_product_cart: 加 mid，根据表中的 tel 或 wecha_id初始化  token: varchar(50) => int
update ai9me_product_cart set token = 0 where token is null;

ALTER TABLE `ai9me_product_cart` 
CHANGE COLUMN `token` `token` INT NOT NULL DEFAULT 0 COMMENT '商户wid' ,
ADD COLUMN `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id' AFTER `id`;


# dsqgrecord: 加 mid, 根据表中的 tel 或 wxid 初始化
update dsqgrecord set wid = 0 where wid is null;

ALTER TABLE `dsqgrecord` 
CHANGE COLUMN `wid` `wid` INT(11) NOT NULL DEFAULT 0 COMMENT '商户wid' ,
ADD COLUMN `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id' AFTER `wid`;


# yyfw_records: 加 mid, 根据表中的 mobile 或 wxid 初始化
ALTER TABLE `yyfw_records` 
CHANGE COLUMN `wid` `wid` VARCHAR(45) NOT NULL DEFAULT 0 COMMENT '商户wid' ,
ADD COLUMN `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id' AFTER `wid`;

########## [FINISH] 处理多一个手机号、一个微信号存在多mid的问题
