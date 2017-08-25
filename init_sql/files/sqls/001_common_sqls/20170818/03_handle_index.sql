# 修改表索引的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### 临时问题处理
################################# END   - 2017-08-16
*/

######## 卡券领取记录，打开慢
# ALTER TABLE `wmall_coupon_list_service`  ADD INDEX `idx_wmall_coupon_list_service_list_id` USING BTREE (`list_id` ASC);


select '03' as 'Index', 'Handle Indexs' as 'Title', 'Done' as 'Status';