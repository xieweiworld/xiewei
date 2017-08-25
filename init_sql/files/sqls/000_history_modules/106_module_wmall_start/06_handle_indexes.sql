
# 管理索引数据

# 从新版商城开始到新版商城正式发布前，已发布到正式库中的脚本汇总

# 2017-05-18

##################################  开单相关表 - Start

# 2016-10-20
/*
ALTER TABLE `order_billing`  ADD INDEX `idx_order_billing_wid` USING BTREE (`wid` ASC);
ALTER TABLE `order_service`  ADD INDEX `idx_order_service_order_id` USING BTREE (`order_id` ASC);
ALTER TABLE `order_product_expense`  ADD INDEX `idx_order_product_expense_order_id` USING BTREE (`order_id` ASC);

ALTER TABLE `order_product_in`  ADD INDEX `idx_order_product_in_wid` USING BTREE (`wid` ASC);
ALTER TABLE `order_product_in_detail`  ADD INDEX `idx_order_product_in_detail_in_order_id` USING BTREE (`in_order_id` ASC);

ALTER TABLE `order_product_out`  ADD INDEX `idx_order_product_out_wid` USING BTREE (`wid` ASC);
ALTER TABLE `order_product_out`  ADD INDEX `idx_order_product_out_out_typeid` USING BTREE (`out_typeid` ASC);
ALTER TABLE `order_product_out_detail`  ADD INDEX `idx_order_product_out_detail_out_order_id` USING BTREE (`out_order_id` ASC);


ALTER TABLE `order_product_return`  ADD INDEX `idx_order_product_return_wid` USING BTREE (`wid` ASC);
ALTER TABLE `order_product_return`  ADD INDEX `idx_order_product_return_in_order_id` USING BTREE (`in_order_id` ASC);
ALTER TABLE `order_product_return_detail`  ADD INDEX `idx_order_product_return_detail_return_id` USING BTREE (`return_id` ASC);

# 2016-11-25
ALTER TABLE `order_product`  ADD INDEX `idx_product_code` USING BTREE (`product_code` ASC);

ALTER TABLE `order_product_indetail_barcode`  ADD INDEX `idx_bar_code` USING BTREE (`bar_code` ASC);

ALTER TABLE `order_product_outdetail_batchno`  ADD INDEX `idx_out_detail_id` USING BTREE (`out_detail_id` ASC);
ALTER TABLE `order_product_outdetail_batchno`  ADD INDEX `idx_in_detail_id` USING BTREE (`in_detail_id` ASC);
ALTER TABLE `order_product_outdetail_batchno`  ADD INDEX `idx_batch_no` USING BTREE (`batch_no` ASC);

# 2016-12-10
# 因返单，需要取消唯一索引(已运行)
ALTER TABLE `order_billing` DROP INDEX `order_billing_order_code_unique`;
*/
ALTER TABLE `order_billing` ADD INDEX `idx_order_code` (`order_code` ASC);

##################################  开单相关表 - End


##################################  会员相关表 - Start

# 2017-05-12
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_pid` USING BTREE (`pid` ASC);

##################################  会员相关表 - End


# 2017-05-18

select '06' as 'Index', 'Handle Indexes' as 'Title', 'Done' as 'Status';