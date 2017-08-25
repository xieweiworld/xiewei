# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-28
########### 营销短信电信限制
################################# END   - 2017-06-28
*/

# 短信群发记录表
ALTER TABLE `customer_group_message` 
ADD COLUMN `failure_reason` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '发送失败原因' AFTER `failure`,
ADD COLUMN `unsent` INT NOT NULL DEFAULT '0' COMMENT '未发送数量' AFTER `failure_reason`,
ADD COLUMN `unsent_reason` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '未发送原因' AFTER `unsent`,
ADD COLUMN `remark` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '备注' AFTER `sent_at`;

select '02' as 'Index', 'SMS - Alter Tables' as 'Title', 'Done' as 'Status';