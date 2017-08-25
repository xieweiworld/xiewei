# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-18
########### SCRM优化二[高]
################################# END   - 2017-08-18
*/

# 开单项目表：业绩部门ID
ALTER TABLE `order_service` ADD COLUMN `biz_dept_id` INT NULL DEFAULT 0 COMMENT '业绩部门ID' AFTER `order_id`;

# 开单配置消耗表：业绩部门ID
ALTER TABLE `order_product_expense` ADD COLUMN `biz_dept_id` INT NULL DEFAULT 0 COMMENT '业绩部门ID' AFTER `order_id`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
