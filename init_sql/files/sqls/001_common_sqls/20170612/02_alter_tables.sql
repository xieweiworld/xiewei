# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-12
########### 车主库优化
################################# END   - 2017-06-12
*/

# 车主表: 驾驶证到期日期、业余爱好、客户(车主)来源
ALTER TABLE `member_base` 
ADD COLUMN `drive_end_at` DATETIME NULL DEFAULT NULL COMMENT '驾驶证到期日期' AFTER `birthday`,
ADD COLUMN `hobby` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '业余爱好' AFTER `drive_end_at`,
ADD COLUMN `initial` INT NOT NULL DEFAULT 0 COMMENT '客户(车主)来源:1线下到店,2微信商城,3朋友介绍,9其他' AFTER `source`;

# 车辆表: 颜色、排量
ALTER TABLE `member_auto` 
ADD COLUMN `color` VARCHAR(10) NULL DEFAULT '' COMMENT '颜色' AFTER `cpai`,
ADD COLUMN `capacity` VARCHAR(10) NULL DEFAULT '' COMMENT '排量' AFTER `color`,
ADD COLUMN `remark` VARCHAR(200) NULL DEFAULT '' COMMENT '备注' AFTER `is_bind`;

# 会员卡变更历史表
ALTER TABLE `member_card_change_history` 
ADD COLUMN `custom_card_code_old` VARCHAR(50) NULL DEFAULT '' COMMENT '自定义卡号(旧)' AFTER `expired_at_new`,
ADD COLUMN `custom_card_code_new` VARCHAR(50) NULL DEFAULT '' COMMENT '自定义卡号(新)' AFTER `custom_card_code_old`;

# 车辆颜色表
ALTER TABLE `sys_car_colors` 
ADD COLUMN `pinyin` VARCHAR(50) NULL DEFAULT '' COMMENT '全拼音' AFTER `name`,
ADD COLUMN `chars` VARCHAR(50) NULL DEFAULT '' COMMENT '首字母' AFTER `pinyin`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';