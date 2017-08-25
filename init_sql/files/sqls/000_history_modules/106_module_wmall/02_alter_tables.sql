# 修改表结构的sql定义，存放在此文件中

# 商城新版业务

# 2016-12-09
# 商户服务项目: 添加预约排序码
ALTER TABLE `customer_services` 
ADD COLUMN `yuyue_sort` INT NULL DEFAULT 0 COMMENT '预约排序' AFTER `is_yuyue`;

# 商户设置表: 添加字段
ALTER TABLE `customer_set` 
ADD COLUMN `wx_center_name` VARCHAR(30) NULL DEFAULT '' COMMENT '个人中心显示名称' AFTER `order_declare2`,
ADD COLUMN `pre_date_hours` INT NULL DEFAULT 0 COMMENT '需提前预约小时' AFTER `wx_center_name`,
ADD COLUMN `online_discount` INT NULL DEFAULT 0 COMMENT '线上预约可享受几折' AFTER `pre_date_hours`,
ADD COLUMN `last_remind_at` DATETIME NULL DEFAULT NULL COMMENT '上一次提醒订单时间' AFTER `online_discount`;

# 会员卡充值表：添加字段：pid
ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `pid` INT NULL DEFAULT 0 COMMENT '充值父ID' AFTER `id`;

# 会员卡充值服务赠送表：添加字段：商城订单号
ALTER TABLE `member_card_chongzhi_service` 
ADD COLUMN `order_id` varchar(30) NULL DEFAULT '' COMMENT '商城订单号' AFTER `cz_id`;

# 平台服务分类表: +is_delete
ALTER TABLE `ditu_fuwu` 
ADD COLUMN `is_delete` INT NOT NULL DEFAULT 0 COMMENT '删除标记:1已删除,0未删除';

# 两类微信通知模版: +md5_code
ALTER TABLE `customer_mp_templates` 
ADD COLUMN `md5_code` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'md5(content)' AFTER `content`;

ALTER TABLE `customer_weixin_template` 
ADD COLUMN `md5_code` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'md5(post_data)' AFTER `post_data`;

# 微信通知日志表: +template_id
ALTER TABLE `weixin_template_send_log` 
ADD COLUMN `template_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '微信模版template_id' AFTER `wxid`;

# 国寿合作商户字段: is_chinalife
# 商户信息表其他字段
ALTER TABLE `pubs` 
ADD COLUMN `mp_name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '公众号主体名称' AFTER `uid`,
ADD COLUMN `is_chinalife` INT NULL DEFAULT 0 COMMENT '是否也是国寿合作商户:1是,0否' AFTER `ticket_time`,
ADD COLUMN `chinalife_date` DATETIME NULL DEFAULT NULL COMMENT '商户合作时间',
ADD COLUMN `share_title` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '微信分享标题',
ADD COLUMN `share_remark` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '微信分享简介',
ADD COLUMN `share_icon` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '微信分享图标',
ADD COLUMN `is_delete` INT NOT NULL DEFAULT 0 COMMENT '是否删除:1是,0否',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人';

# 开单表添加字段
ALTER TABLE `order_billing` 
ADD COLUMN `kaquan_id` INT NULL DEFAULT 0 COMMENT '抵扣的卡券id' AFTER `kaquan_price`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
