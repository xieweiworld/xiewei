# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-05
########### 尊熹储值卡优化
################################# END   - 2017-06-05
*/

# 车辆表：停车位字段
ALTER TABLE `member_auto` 
ADD COLUMN `parking_stall` VARCHAR(50) NULL DEFAULT '' COMMENT '停车位' AFTER `cpai`;

# 开单表: 添加储值卡ID字段
ALTER TABLE `order_billing` 
ADD COLUMN `vcard_id` INT NULL DEFAULT 0 COMMENT '储值卡ID' AFTER `mcard_price`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';