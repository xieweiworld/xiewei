# 修改表索引的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### SCRM优化二之【中】优先级
################################# END   - 2017-08-16
*/

ALTER TABLE `customer_require_fields`  ADD INDEX `idx_customer_require_fields_wid` USING BTREE (`wid` ASC);

select '03' as 'Index', 'Handle Indexs' as 'Title', 'Done' as 'Status';