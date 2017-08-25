# 修改表索引的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-12
########### 车主库优化
################################# END   - 2017-06-12
*/

######## 先添加索引,为了更新mid
ALTER TABLE `customer_wx_fans`  ADD INDEX `idx_customer_wx_fans_wid` USING BTREE (`wid` ASC);
ALTER TABLE `customer_wx_fans`  ADD INDEX `idx_customer_wx_fans_wid_wxid` USING BTREE (`wid_wxid` ASC);


select '03' as 'Index', 'Handle Indexs' as 'Title', 'Done' as 'Status';