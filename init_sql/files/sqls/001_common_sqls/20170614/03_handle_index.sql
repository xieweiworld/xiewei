# 修改表索引的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-14
########### 车之翼6-2
################################# END   - 2017-06-14
*/


# 车之翼工单复核添加相关索引
ALTER TABLE `order_billing`  ADD INDEX `idx_order_billing_order_type` USING BTREE (`order_type` ASC);

ALTER TABLE `order_billing`  ADD INDEX `idx_order_billing_status` USING BTREE (`status` ASC);

ALTER TABLE `member_card_chongzhi`  ADD INDEX `idx_member_card_chongzhi_time` USING BTREE (`time` desc);
ALTER TABLE `order_billing`  ADD INDEX `idx_order_billing_casher_time` USING BTREE (`casher_time` desc);
ALTER TABLE `order_billing_more`  ADD INDEX `idx_order_billing_more_is_recheck` USING BTREE (`is_recheck` asc);

ALTER TABLE `order_billing_more`  ADD INDEX `idx_order_billing_more_orderid` USING BTREE (`orderid` asc);

select '03' as 'Index', 'Handle Indexs' as 'Title', 'Done' as 'Status';