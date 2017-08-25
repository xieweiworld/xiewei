# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### SCRM优化二之【中】优先级
################################# END   - 2017-08-16
*/


# 商户服务项目表：维修快捷开单
ALTER TABLE `customer_services` ADD COLUMN `is_repair` INT NOT NULL DEFAULT 0 COMMENT '维修快捷开单项目:1是,0否' AFTER `is_fast`;

# 开单项目表：业绩部门ID
ALTER TABLE `order_billing` ADD COLUMN `transfer_price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '转账金额' AFTER `debt_price`;


select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
