# 初始化数据

# 商城新版业务

# 2016-12-01

ALTER TABLE `fuwulist`  ADD INDEX `idx_fuwulist_wid` USING BTREE (`wid` ASC);

# 商城公共相关
ALTER TABLE `wmall_set_home`  ADD INDEX `idx_wmall_set_home_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_set_home`  ADD INDEX `idx_wmall_set_home_code` USING BTREE (`code` ASC);

ALTER TABLE `wmall_set_category`  ADD INDEX `idx_wmall_set_category_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_set_category`  ADD INDEX `idx_wmall_set_category_category_id` USING BTREE (`category_id` ASC);

ALTER TABLE `wmall_set_banner`  ADD INDEX `idx_wmall_set_banner_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_set_banner_list`  ADD INDEX `idx_wmall_set_banner_list_wid` USING BTREE (`wid` ASC);

ALTER TABLE `wmall_coupon`  ADD INDEX `idx_wmall_coupon_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_coupon`  ADD INDEX `idx_wmall_coupon_type` USING BTREE (`type` ASC);
ALTER TABLE `wmall_coupon`  ADD INDEX `idx_wmall_coupon_name` USING BTREE (`name` ASC);

ALTER TABLE `wmall_coupon_list`  ADD INDEX `idx_wmall_coupon_list_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_coupon_list`  ADD INDEX `idx_wmall_coupon_list_type` USING BTREE (`type` ASC);
ALTER TABLE `wmall_coupon_list`  ADD INDEX `idx_wmall_coupon_list_name` USING BTREE (`name` ASC);

# 商城商品相关
ALTER TABLE `sys_product_template`  ADD INDEX `idx_sys_product_template_wid` USING BTREE (`wid` ASC);

ALTER TABLE `wmall_product`  ADD INDEX `idx_wmall_product_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product`  ADD INDEX `idx_wmall_product_type` USING BTREE (`type` ASC);
ALTER TABLE `wmall_product`  ADD INDEX `idx_wmall_product_name` USING BTREE (`name` ASC);

ALTER TABLE `wmall_product_category`  ADD INDEX `idx_wmall_product_category_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_category`  ADD INDEX `idx_wmall_product_category_product_id` USING BTREE (`product_id` ASC);

ALTER TABLE `wmall_product_image`  ADD INDEX `idx_wmall_product_image_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_image`  ADD INDEX `idx_wmall_product_image_product_id` USING BTREE (`product_id` ASC);

ALTER TABLE `wmall_product_service`  ADD INDEX `idx_wmall_product_service_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_service`  ADD INDEX `idx_wmall_product_service_product_id` USING BTREE (`product_id` ASC);

ALTER TABLE `wmall_product_attach`  ADD INDEX `idx_wmall_product_attach_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_product_attach`  ADD INDEX `idx_wmall_product_attach_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `wmall_product_attach`  ADD INDEX `idx_wmall_product_attach_attach_id` USING BTREE (`attach_id` ASC);

ALTER TABLE `wmall_category`  ADD INDEX `idx_wmall_category_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_category`  ADD INDEX `idx_wmall_category_code` USING BTREE (`code` ASC);

# 2017-04-05 商城订单表
ALTER TABLE `wmall_order`  ADD INDEX `idx_wmall_order_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order`  ADD INDEX `idx_wmall_order_mid` USING BTREE (`mid` ASC);
ALTER TABLE `wmall_order`  ADD INDEX `idx_wmall_order_order_type` USING BTREE (`order_type` ASC);
ALTER TABLE `wmall_order`  ADD INDEX `idx_wmall_order_order_code` USING BTREE (`order_code` ASC);
ALTER TABLE `wmall_order`  ADD INDEX `idx_wmall_order_verify_code` USING BTREE (`verify_code` ASC);

# 2017-04-05 订单商品表
ALTER TABLE `wmall_order_product`  ADD INDEX `idx_wmall_order_product_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order_product`  ADD INDEX `idx_wmall_order_product_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `wmall_order_product`  ADD INDEX `idx_wmall_order_product_order_id` USING BTREE (`order_id` ASC);
#ALTER TABLE `wmall_order_product`  ADD INDEX `idx_wmall_order_product_order_code` USING BTREE (`order_code` ASC);

ALTER TABLE `wmall_order_service`  ADD INDEX `idx_wmall_order_service_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order_service`  ADD INDEX `idx_wmall_order_service_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `wmall_order_service`  ADD INDEX `idx_wmall_order_service_order_id` USING BTREE (`order_id` ASC);
#ALTER TABLE `wmall_order_service`  ADD INDEX `idx_wmall_order_service_order_code` USING BTREE (`order_code` ASC);

ALTER TABLE `wmall_order_attach`  ADD INDEX `idx_wmall_order_attach_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order_attach`  ADD INDEX `idx_wmall_order_attach_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `wmall_order_attach`  ADD INDEX `idx_wmall_order_attach_order_id` USING BTREE (`order_id` ASC);
ALTER TABLE `wmall_order_attach`  ADD INDEX `idx_wmall_order_attach_attach_id` USING BTREE (`attach_id` ASC);

# 2017-04-05 订单支付表
ALTER TABLE `wmall_order_payinfo`  ADD INDEX `idx_wmall_order_payinfo_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order_payinfo`  ADD INDEX `idx_wmall_order_payinfo_order_id` USING BTREE (`order_id` ASC);
#ALTER TABLE `wmall_order_payinfo`  ADD INDEX `idx_wmall_order_payinfo_order_code` USING BTREE (`order_code` ASC);

ALTER TABLE `wmall_order_comment`  ADD INDEX `idx_wmall_order_comment_wid` USING BTREE (`wid` ASC);
ALTER TABLE `wmall_order_comment`  ADD INDEX `idx_wmall_order_comment_product_id` USING BTREE (`product_id` ASC);
ALTER TABLE `wmall_order_comment`  ADD INDEX `idx_wmall_order_comment_order_id` USING BTREE (`order_id` ASC);
ALTER TABLE `wmall_order_comment`  ADD INDEX `idx_wmall_order_comment_mid` USING BTREE (`mid` ASC);

# 2016-12-01

# 2017-05-17 平台商品审核索引
ALTER TABLE `wmall_audit_info`  ADD INDEX `idx_wmall_audit_info_typeid` USING BTREE (`type_id` asc);


# 2017-04-05 旧商城订单表
# ALTER TABLE `ai9me_product_cart`  ADD INDEX `payment` USING BTREE (`payment` ASC);
# ALTER TABLE `ai9me_product_cart`  ADD INDEX `shift_status` USING BTREE (`shift_status` ASC);


# 2017-04-27 转入数据用索引
# ALTER TABLE `wmall_order`  ADD INDEX `wid_order_code_source_id` USING BTREE (`wid` asc, `order_code` asc, `source_id` asc);
# ALTER TABLE `dsqgrecord`  ADD INDEX `wid_orderid_id` USING BTREE (`wid` asc, `orderid` asc, `id` asc);


select '05' as 'Index', 'Handle Indexes' as 'Title', 'Done' as 'Status';
