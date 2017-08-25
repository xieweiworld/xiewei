# 为查询字段创建索引, 主键无须再加索引

# member_base: wid, tel, status, wxid
ALTER TABLE `member_base`  ADD INDEX `idx_member_base_wid` USING BTREE (`wid` ASC);
ALTER TABLE `member_base`  ADD INDEX `idx_member_base_tel` USING BTREE (`tel` ASC);
ALTER TABLE `member_base`  ADD INDEX `idx_member_base_wxid` USING BTREE (`wxid` ASC);
ALTER TABLE `member_base`  ADD INDEX `idx_member_base_status` USING BTREE (`status` ASC);

# member_auto: mid, is_delete
ALTER TABLE `member_auto`  ADD INDEX `idx_member_auto_mid` USING BTREE (`mid` ASC);
ALTER TABLE `member_auto`  ADD INDEX `idx_member_auto_is_delete` USING BTREE (`is_delete` ASC);

# member_card: mid, status, is_main, service_id, wid, car_id  [amount]
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_mid` USING BTREE (`mid` ASC);
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_status` USING BTREE (`status` ASC);
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_is_main` USING BTREE (`is_main` ASC);
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_service_id` USING BTREE (`service_id` ASC);
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_wid` USING BTREE (`wid` ASC);
ALTER TABLE `member_card`  ADD INDEX `idx_member_card_car_id` USING BTREE (`car_id` ASC);

# member_card_chongzhi: wid, mid, card_id
ALTER TABLE `member_card_chongzhi`  ADD INDEX `idx_member_card_chongzhi_wid` USING BTREE (`wid` ASC);
ALTER TABLE `member_card_chongzhi`  ADD INDEX `idx_member_card_chongzhi_mid` USING BTREE (`mid` ASC);
ALTER TABLE `member_card_chongzhi`  ADD INDEX `idx_member_card_chongzhi_card_id` USING BTREE (`card_id` ASC);

# member_card_xiaofei: card_id, mid
ALTER TABLE `member_card_xiaofei`  ADD INDEX `idx_member_card_xiaofei_card_id` USING BTREE (`card_id` ASC);
ALTER TABLE `member_card_xiaofei`  ADD INDEX `idx_member_card_xiaofei_mid` USING BTREE (`mid` ASC);

# ai9me_product_card: product_id, token
ALTER TABLE `ai9me_product_card`  ADD INDEX `idx_ai9me_product_card_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `ai9me_product_card`  ADD INDEX `idx_ai9me_product_card_token` USING BTREE (`token` ASC);

# ai9me_product_gift: product_id
ALTER TABLE `ai9me_product_gift`  ADD INDEX `idx_ai9me_product_gift_product_id` USING BTREE (`product_id` ASC);

# commission: product_id
ALTER TABLE `commission`  ADD INDEX `idx_commission_product_id` USING BTREE (`product_id` ASC);

# sys_car_series: brand_code, series_code
ALTER TABLE `sys_car_series`  ADD INDEX `idx_sys_car_series_brand_code` USING BTREE (`brand_code` ASC);
ALTER TABLE `sys_car_series`  ADD INDEX `idx_sys_car_series_series_code` USING BTREE (`series_code` ASC);

# member_giftamount: wid, wxid, mid
ALTER TABLE `member_giftamount`  ADD INDEX `idx_member_giftamount_wid` USING BTREE (`wid` ASC);
ALTER TABLE `member_giftamount`  ADD INDEX `idx_member_giftamount_wxid` USING BTREE (`wxid` ASC);
ALTER TABLE `member_giftamount`  ADD INDEX `idx_member_giftamount_mid` USING BTREE (`mid` ASC);

# member_card_libao: wid
ALTER TABLE `member_card_libao`  ADD INDEX `idx_member_card_libao_wid` USING BTREE (`wid` ASC);

# member_card_gift: lid, mid
ALTER TABLE `member_card_gift`  ADD INDEX `idx_member_card_gift_lid` USING BTREE (`lid` ASC);
ALTER TABLE `member_card_gift`  ADD INDEX `idx_member_card_gift_mid` USING BTREE (`mid` ASC);

# member_point: mid, category_type
ALTER TABLE `member_point`  ADD INDEX `idx_member_point_mid` USING BTREE (`mid` ASC);
ALTER TABLE `member_point`  ADD INDEX `idx_member_point_category_type` USING BTREE (`category_type` ASC);

# member_coupon: wid
ALTER TABLE `member_coupon`  ADD INDEX `idx_member_coupon_wid` USING BTREE (`wid` ASC);

# member_coupon_list: cid, mid
ALTER TABLE `member_coupon_list`  ADD INDEX `idx_member_coupon_list_cid` USING BTREE (`cid` ASC);
ALTER TABLE `member_coupon_list`  ADD INDEX `idx_member_coupon_list_mid` USING BTREE (`mid` ASC);

# user_operations: wid, pid
# ALTER TABLE `user_operations`  ADD INDEX `idx_user_operations_wid` USING BTREE (`wid` ASC);
# ALTER TABLE `user_operations`  ADD INDEX `idx_user_operations_pid` USING BTREE (`pid` ASC);

# user_admin_operators: wid [auth_wxid]
# ALTER TABLE `user_admin_operators`  ADD INDEX `idx_user_admin_operators_wid` USING BTREE (`wid` ASC);


# 输出提示信息
select '06 - finished' as 'status';
