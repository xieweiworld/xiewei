# 修改表结构的sql定义，存放在此文件中

# 2016-07-20
#微信用户交互记录表 添加索引
ALTER TABLE `data_statistics` ADD INDEX `idx_data_statistics_wid` USING BTREE (`wid` ASC);
# 2016-07-20

# 2016-07-25
# 会员导入功能 添加客户定义卡号
ALTER TABLE member_card ADD COLUMN custom_card_code varchar(20) NULL DEFAULT '' AFTER card_code;

# 添加索引 按城市查询分组
ALTER TABLE `user`  ADD INDEX `idx_user_l_shi` USING BTREE (`l_shi` ASC);
# 2016-07-25

# 2016-07-29 微信菜单调整字段
ALTER TABLE `menu` 
CHANGE COLUMN `ispost` `ispost` TINYINT(1) NULL DEFAULT 0 COMMENT '是否发布菜单:1已发布0未发布' ,
ADD COLUMN `isupdate` TINYINT(1) NULL DEFAULT NULL COMMENT '更换域名发布菜单0:待发布,1:已发布' AFTER `ispost`;
# 2016-07-29