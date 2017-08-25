# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-14
########### 车之翼6-2
################################# END   - 2017-06-14
*/

# 复核表：添加复核类型
# order_billing_more 后续需要将此表重命名: 工单复核表(order_recheck)
ALTER TABLE `order_billing_more` 
ADD COLUMN `type` INT NULL DEFAULT '0' COMMENT '复核类型:1开单复核,2办卡复核' AFTER `wid`,
CHANGE COLUMN `orderid` `orderid` INT NULL DEFAULT '0' COMMENT '复核对象ID(开单id,充值id)';

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';