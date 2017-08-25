# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-06
########### 车之翼优化6.1
################################# END   - 2017-06-06
*/

# 商户服务项目流程: 增加挪车流程
ALTER TABLE `customer_services_process`
ADD COLUMN `process_name11` VARCHAR(60) NULL DEFAULT '' COMMENT '挪车流程名称' AFTER `process_name10`,
ADD COLUMN `reward_amount11` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '挪车流程提成' AFTER `reward_amount10`;


select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';