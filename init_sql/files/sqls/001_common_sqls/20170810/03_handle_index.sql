# 修改表索引的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-03
########### 车之翼优化7
################################# END   - 2017-08-03
*/


# 还款明细表添加相关索引
ALTER TABLE `order_charge_repay_detail`  ADD INDEX `idx_order_charge_repay_detail_wid` USING BTREE (`wid` ASC);

ALTER TABLE `order_charge_repay_detail`  ADD INDEX `idx_order_charge_repay_detail_store_id` USING BTREE (`store_id` ASC);

select '03' as 'Index', 'Handle Indexs' as 'Title', 'Done' as 'Status';