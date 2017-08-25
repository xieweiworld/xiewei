# 初始化数据

set @business = '多门店业务';

# 2017-06-13

# 门店表
ALTER TABLE `lbs`  ADD INDEX `idx_lbs_full_path` USING BTREE (`full_path` ASC);

# ALTER TABLE `user_staff`  ADD INDEX `idx_user_staff_wid` USING BTREE (`wid` ASC);

ALTER TABLE `customer_product_type`  ADD INDEX `idx_customer_product_type_wid` USING BTREE (`wid` ASC);


# 会员卡可消费的门店表
ALTER TABLE `member_card_consume_stores`  ADD INDEX `idx_member_card_consume_stores_wid` USING BTREE (`wid` ASC);
ALTER TABLE `member_card_consume_stores`  ADD INDEX `idx_member_card_consume_stores_card_id` USING BTREE (`card_id` ASC);
ALTER TABLE `member_card_consume_stores`  ADD INDEX `idx_member_card_consume_stores_type` USING BTREE (`type` ASC);
ALTER TABLE `member_card_consume_stores`  ADD INDEX `idx_member_card_consume_stores_type_id` USING BTREE (`type_id` ASC);


# 卡片可办理的门店表
ALTER TABLE `wmall_product_handle_stores`  ADD INDEX `idx_wmall_product_handle_stores_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_handle_stores`  ADD INDEX `idx_wmall_product_handle_stores_product_id` USING BTREE (`product_id` ASC);

# 卡片可消费的门店表
ALTER TABLE `wmall_product_consume_stores`  ADD INDEX `idx_wmall_product_consume_stores_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_consume_stores`  ADD INDEX `idx_wmall_product_consume_stores_product_id` USING BTREE (`product_id` ASC);

# wid
alter table order_product add index `idx_order_product_wid` USING BTREE (`wid` ASC);
alter table order_product_in_detail add index `idx_order_product_in_detail_wid` USING BTREE (`wid` ASC);
alter table order_product_indetail_barcode add index `idx_order_product_indetail_barcode_wid` USING BTREE (`wid` ASC);
alter table order_product_out_detail add index `idx_order_product_out_detail_wid` USING BTREE (`wid` ASC);
alter table order_product_outdetail_batchno add index `idx_order_product_outdetail_batchno_wid` USING BTREE (`wid` ASC);


# 门店id
alter table wmall_product add index `idx_wmall_product_store_id` USING BTREE (`store_id` ASC);
alter table order_supplier add index `idx_order_supplier_store_id` USING BTREE (`store_id` ASC);
alter table order_brand add index `idx_order_brand_store_id` USING BTREE (`store_id` ASC);
alter table customer_carkeys add index `idx_customer_carkeys_store_id` USING BTREE (`store_id` ASC);
alter table order_charge_repay add index `idx_order_charge_repay_store_id` USING BTREE (`store_id` ASC);
alter table customer_money_in add index `idx_customer_money_in_store_id` USING BTREE (`store_id` ASC);
alter table customer_money_out add index `idx_customer_money_out_store_id` USING BTREE (`store_id` ASC);
alter table order_product add index `idx_order_product_store_id` USING BTREE (`store_id` ASC);
alter table order_product_in add index `idx_order_product_in_store_id` USING BTREE (`store_id` ASC);
alter table order_product_in_detail add index `idx_order_product_in_detail_store_id` USING BTREE (`store_id` ASC);
alter table order_product_indetail_barcode add index `idx_order_product_indetail_barcode_store_id` USING BTREE (`store_id` ASC);
alter table order_product_out add index `idx_order_product_out_store_id` USING BTREE (`store_id` ASC);
alter table order_product_out_detail add index `idx_order_product_out_detail_store_id` USING BTREE (`store_id` ASC);
alter table order_product_outdetail_batchno add index `idx_order_product_outdetail_batchno_store_id` USING BTREE (`store_id` ASC);
alter table order_product_return add index `idx_order_product_return_store_id` USING BTREE (`store_id` ASC);
alter table order_product_change add index `idx_order_product_change_store_id` USING BTREE (`store_id` ASC);
alter table order_charge add index `idx_order_charge_store_id` USING BTREE (`store_id` ASC);
alter table order_product_expense add index `idx_order_product_expense_store_id` USING BTREE (`store_id` ASC);
alter table order_product_expense_code add index `idx_order_product_expense_code_store_id` USING BTREE (`store_id` ASC);

#alter table member_card_chongzhi add index `idx_member_card_chongzhi_wid` USING BTREE (`wid` ASC);
alter table member_card_xiaofei add index `idx_member_card_xiaofei_wid` USING BTREE (`wid` ASC);

alter table member_card_chongzhi add index `idx_member_card_chongzhi_lbs_id` USING BTREE (`lbs_id` ASC);
alter table member_card_xiaofei add index `idx_member_card_xiaofei_lbs_id` USING BTREE (`lbs_id` ASC);

# 微信推送通知相关
alter table user_staff_admin_stores add index `idx_user_staff_admin_stores_staff_id` USING BTREE (`staff_id` ASC);
alter table customer_weixin_template add index `idx_customer_weixin_template_send_wid` USING BTREE (`send_wid` ASC);
alter table customer_notice_receiver add index `idx_customer_notice_receiver_wid` USING BTREE (`wid` ASC);
alter table customer_receiver_template add index `idx_customer_receiver_template_rid` USING BTREE (`rid` ASC);

# product_id
alter table order_product_in_detail add index `idx_order_product_in_detail_product_id` USING BTREE (`product_id` ASC);

ALTER TABLE customer_services  ADD INDEX `idx_customer_services_wid` USING BTREE (`wid` ASC);

# 2017-06-13

select '05' as 'Index', @business as 'Type', 'Handle Indexes' as 'Title', 'Done' as 'Status';
