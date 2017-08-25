# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-05
########### 微信端服务记录查询慢
################################# END   - 2017-06-05
*/

# 开单服务表: order_id 改为 int
ALTER TABLE `order_service` CHANGE COLUMN `order_id` `order_id` INT NULL DEFAULT '0' COMMENT '单据id' ;


select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';