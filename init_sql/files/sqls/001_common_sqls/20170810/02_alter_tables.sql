# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-03
########### 车之翼优化7
################################# END   - 2017-08-03
*/

# 会员卡充值记录表: +debt_price
ALTER TABLE `member_card_chongzhi` ADD COLUMN `debt_price` decimal(8,2) NULL DEFAULT 0 COMMENT '挂账金额' AFTER `price`;

# 商户服务项目表：+stat_type
ALTER TABLE `customer_services` ADD COLUMN `stat_type` INT NULL DEFAULT 0 COMMENT '大类统计类别:1美容大类,*待扩展' AFTER `agent_fee`;

# 开单结算&收银优惠原因字段
ALTER TABLE `order_billing` ADD COLUMN `coupon_remark` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠原因' AFTER `coupon_price`;

# 出库单添加复核字段
ALTER TABLE `order_product_out` ADD COLUMN `is_check` INT NOT NULL DEFAULT 0 COMMENT '是否复核:1是,0否' AFTER `receive_dept`;
ALTER TABLE `order_product_out` ADD COLUMN `rechecker` INT DEFAULT 0 COMMENT '复核人(员工ID)' AFTER `is_check`;
ALTER TABLE `order_product_out` ADD COLUMN `recheck_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '复核备注' AFTER `rechecker`;
ALTER TABLE `order_product_out` ADD COLUMN `recheck_time` datetime DEFAULT NULL COMMENT '复核时间' AFTER `recheck_remark`;

# 会员卡的car_id not null
ALTER TABLE member_card CHANGE `car_id` `car_id` INT NOT NULL DEFAULT '0' COMMENT '车辆ID(不是车牌)';


# 数据转换用
ALTER TABLE `order_charge_detail` ADD COLUMN `is_shift` INT NOT NULL DEFAULT 0 COMMENT '是否转换';
ALTER TABLE `order_charge_repay` ADD COLUMN `is_shift` INT NOT NULL DEFAULT 0 COMMENT '是否转换';


select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
