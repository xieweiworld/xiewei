# 修改表结构的sql定义，存放在此文件中

# 从新版商城开始到新版商城正式发布前，已发布到正式库中的脚本汇总

# 2017-05-18


##################################
# 2016-10-20
# 商户配置表添加排序码字段(exists)
# ALTER TABLE `customer_configs` ADD COLUMN `sort_no` int NULL DEFAULT 0 COMMENT '排序码' AFTER `value`;

# 开单表处理明细、价格字段(no field)
# ALTER TABLE `order_billing`  DROP COLUMN `order_detail`;
/*
ALTER TABLE `order_billing` 
ADD COLUMN `service_detail` VARCHAR(200) NULL DEFAULT '' COMMENT '服务项目明细' AFTER `order_code`,
ADD COLUMN `product_detail` VARCHAR(200) NULL DEFAULT '' COMMENT '配件商品明细' AFTER `service_detail`,
ADD COLUMN `service_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '工时费合计' AFTER `other_price`,
ADD COLUMN `discount_price1` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '折扣后工时费合计' AFTER `service_price`,
ADD COLUMN `product_price` DECIMAL(8,2) NULL DEFAULT 0 AFTER `discount_price1`,
ADD COLUMN `discount_price2` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '折扣后配件费合计' AFTER `product_price`;
*/
# 标记单笔挂账是否结算
# ALTER TABLE `order_charge_detail` ADD COLUMN `unpay_amount` decimal(8,2) NULL DEFAULT 0 COMMENT '未还款金额' AFTER `charge_time`;
# ALTER TABLE `order_charge_detail` ADD COLUMN `is_cash` int NULL DEFAULT 0 COMMENT '是否结算(1:已结算,0:未结算)' AFTER `unpay_amount`;


##################################

# 2016-11-05 补 - 因导入车之翼数据，而已添加的字段(2016-11-01)
# ALTER TABLE `order_product_expense` ADD COLUMN `out_detail_id` INT NULL DEFAULT 0 COMMENT '出货明细ID' AFTER `service_name`;
# ALTER TABLE `order_product`  ADD COLUMN `warehouse` VARCHAR(20) NULL DEFAULT '' COMMENT '仓库' AFTER `suit_car_type`;

# 2016-11-05
# 商户设置表:添加短信签名报备字段
/*
ALTER TABLE `customer_set` 
ADD COLUMN `approve_status` INT NULL DEFAULT 0 COMMENT '是否报备:0:未报备,1:已报备,2:报备通过' AFTER `sms_name`,
ADD COLUMN `approving_at` DATETIME NULL COMMENT '申请报备时间' AFTER `approve_status`,
ADD COLUMN `approved_at` DATETIME NULL COMMENT '报备完成时间' AFTER `approving_at`,
ADD COLUMN `amount` INT NULL DEFAULT 0 COMMENT '可用短信条数' AFTER `approved_at`,
ADD COLUMN `is_fans_update` INT NULL DEFAULT 0 COMMENT '更新粉丝标记' AFTER `amount`;
*/
# 开单业务相关表: 将商品编码,拼音等字段延长到100字符
ALTER TABLE `order_product` 
CHANGE COLUMN `product_code` `product_code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '产品编码' ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '产品名称' ,
CHANGE COLUMN `product_model` `product_model` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '规格型号' ,
CHANGE COLUMN `product_pinyin` `product_pinyin` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '名称全拼' ,
CHANGE COLUMN `product_chars` `product_chars` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '各名字首字母,搜索码' ;
# 配件表添加标记：普通出入库，条码出入库
# ALTER TABLE `order_product` ADD COLUMN `is_barcode` INT NULL DEFAULT 0 COMMENT '出入库标记:0普通出入库,1条码出入库' AFTER `status`;

ALTER TABLE `order_product_in_detail` 
CHANGE COLUMN `product_code` `product_code` VARCHAR(100) NULL DEFAULT '' COMMENT '产品编码' ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(100) NULL DEFAULT '' COMMENT '产品名称' ,
CHANGE COLUMN `product_model` `product_model` VARCHAR(100) NULL DEFAULT '' COMMENT '规格型号' ;


ALTER TABLE `customer_services` 
CHANGE COLUMN `name` `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类名称' ,
CHANGE COLUMN `name_pinyin` `name_pinyin` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '名称全拼' ,
CHANGE COLUMN `name_chars` `name_chars` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '各名字首字母' ;


# 批次、First In First Oout(入库)、Last Out First Return(返单/作废)相关
# ALTER TABLE `order_billing` ADD COLUMN `is_cancel` INT NULL DEFAULT 0 COMMENT '是否作废:1是,0否' AFTER `casher_time`;
ALTER TABLE order_billing MODIFY status int(1) NOT NULL DEFAULT 0 COMMENT '状态:1开单,3结算,5放行';
/*
ALTER TABLE `order_service` ADD COLUMN `origin_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '项目原价' AFTER `card_id`;                     
ALTER TABLE order_service ADD COLUMN payer_id int(11) NOT NULL DEFAULT 0 COMMENT '支付方ID' AFTER order_id;

ALTER TABLE `order_product_expense` ADD COLUMN `origin_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '配件原价' AFTER `product_brand`;            
ALTER TABLE order_product_expense ADD COLUMN payer_id int(11) NOT NULL DEFAULT 0 COMMENT '支付方ID' AFTER order_id;

ALTER TABLE `order_product_in_detail` 
ADD COLUMN `batch_no` varchar(30) NULL DEFAULT '' COMMENT '批次号' AFTER `sale_price`,
ADD COLUMN `is_out_barcode` int(11) NOT NULL DEFAULT '0' COMMENT '按条码出库(1:是,0:否)' AFTER `batch_no`,
ADD COLUMN `remain_amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '剩余库存' AFTER `is_out_barcode`;

ALTER TABLE `order_product_return_detail` 
ADD COLUMN `in_detail_id` INT NULL DEFAULT 0 COMMENT '入库明细id' AFTER `return_id`;
*/
# 开单业务相关表: 将库存字段调整为小数 [已发布]
ALTER TABLE `order_product` CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '当前库存' ;
ALTER TABLE `order_product` CHANGE COLUMN `usable_amount` `usable_amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '可用库存' ;
ALTER TABLE `order_product` CHANGE COLUMN `warning_amount` `warning_amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '库存预警数' ;

ALTER TABLE `order_product_expense` CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '数量' ;

ALTER TABLE `order_product_in` CHANGE COLUMN `total_amount` `total_amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '总数量' ;
ALTER TABLE `order_product_in_detail` CHANGE COLUMN `in_count` `in_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '进货数量' ;
ALTER TABLE `order_product_in_detail` CHANGE COLUMN `return_count` `return_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '已退货数量' ;

ALTER TABLE `order_product_out` CHANGE COLUMN `out_count` `out_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '总数量' ;
ALTER TABLE `order_product_out_detail` CHANGE COLUMN `out_count` `out_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '出货数量' ;

ALTER TABLE `order_product_return` CHANGE COLUMN `return_count` `return_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '退货总数量' ;
ALTER TABLE `order_product_return_detail` CHANGE COLUMN `return_count` `return_count` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '退货数量' ;

ALTER TABLE `order_product_change_detail` CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '系统库存' ;
ALTER TABLE `order_product_change_detail` CHANGE COLUMN `after_amount` `after_amount` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '调整后库存' ;
ALTER TABLE `order_product_change_detail` CHANGE COLUMN `amount_changes` `amount_changes` DECIMAL(8,2) NULL DEFAULT '0' COMMENT '库存变化' ;

# 2016-11-05


# 2016-11-30 调整金额相关字段为 NOT NULL DEFAULT 0.0

ALTER TABLE order_billing MODIFY `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额';
ALTER TABLE order_billing MODIFY `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额';
ALTER TABLE order_billing MODIFY `discount_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额';
ALTER TABLE order_billing MODIFY `coupon_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额';
ALTER TABLE order_billing MODIFY `settle_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额';
ALTER TABLE order_billing MODIFY `kaquan_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '卡券支付金额';
ALTER TABLE order_billing MODIFY `mcard_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '会员卡支付金额';
ALTER TABLE order_billing MODIFY `vcard_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '储值卡支付金额';
ALTER TABLE order_billing MODIFY `cash_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '现金支付';
ALTER TABLE order_billing MODIFY `bcard_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '刷卡支付';
ALTER TABLE order_billing MODIFY `weixin_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '微信支付';
ALTER TABLE order_billing MODIFY `alipay_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付宝支付';
ALTER TABLE order_billing MODIFY `debt_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '挂账金额';
ALTER TABLE order_billing MODIFY `other_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '其他费用';
ALTER TABLE order_billing MODIFY `service_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '工时费合计';
ALTER TABLE order_billing MODIFY `discount_price1` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣后工时费合计';
ALTER TABLE order_billing MODIFY `product_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '配件费合计';
ALTER TABLE order_billing MODIFY `discount_price2` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣后配件费合计';

# 2016-11-30

# 2016-12-05 将返单业务相关字段提前添加好

# 会员卡消费表: 添加删除标记
# ALTER TABLE `member_card_xiaofei` ADD COLUMN `is_delete` INT NOT NULL DEFAULT 0 COMMENT '删除标记:1已删除,0未删除' AFTER `source`;

# 开单表: 添加返单业务字段
/*
ALTER TABLE `order_billing`
ADD COLUMN `is_revert` INT NULL DEFAULT 0 COMMENT '返单标记:0未返单,1已返单' AFTER `buy_date`,
ADD COLUMN `revert_time` DATETIME NULL DEFAULT NULL COMMENT '返单时间' AFTER `is_revert`,
ADD COLUMN `revert_remark` varchar(100) NULL DEFAULT '' COMMENT '返单原因' AFTER `revert_time`,
ADD COLUMN `revert_by` varchar(30) NULL DEFAULT '' COMMENT '返单人' AFTER `revert_remark`;
*/



##################################

# 国寿新业务需要求

# 2016-12-10 新增 - 已发布
# 国寿会员积分表: 添加日期相关字段
/*
ALTER TABLE `chinalife_member`
ADD COLUMN `enabled_at` DATETIME NULL DEFAULT NULL COMMENT '生效时间' AFTER `staff`,
ADD COLUMN `expired_at` DATETIME NULL DEFAULT NULL COMMENT '过期时间' AFTER `enabled_at`,
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间' AFTER `expired_at`,
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '更新时间' AFTER `add_date`;
*/

# 2016-12-23 新增
# 会员车辆表，添加绑定字段
# ALTER TABLE `member_auto` ADD COLUMN `is_bind` int NULL DEFAULT 0 COMMENT '车牌绑定到会员' AFTER `is_delete`;

# 待删除 chinalife_member 中的积分、价格、有效期字段
# 删除前需要将有效期字段数据转入到 chinalife_car_credit, chinalife_credit_history 中 

/*
# 删除 国寿会员表中不需要积分、价格、有效期这三类字段。
# 删除前需要转换数据
ALTER TABLE `chinalife_member`
DROP COLUMN `amount`,
DROP COLUMN `credits`,
DROP COLUMN `total_amount`,
DROP COLUMN `total_credits`,
DROP COLUMN `enabled_at`,
DROP COLUMN `expired_at`;
*/


##################################

# 2016-12-16: 使用条码的客户默认另行设置条码位数，商城中会添加商户设置的功能

# 商户设置表: 添加条形码长度字段
# ALTER TABLE `customer_set` ADD COLUMN `barcode_length` INT NULL DEFAULT 0 COMMENT '条形码长度' AFTER `amount`;



##################################

# 2016-12-26: 短信报备签名,未报备的签名，始终使用 sms_apply，报备后使用 sms_name

# 商户设置表: 短信报备备用签名
ALTER TABLE `customer_set` CHANGE COLUMN `sms_name` `sms_name` VARCHAR(20) NULL DEFAULT '' COMMENT '已报备短信签名';
# ALTER TABLE `customer_set` ADD COLUMN `sms_apply` VARCHAR(20) NULL DEFAULT '' COMMENT '待报备短信签名' AFTER `sms_name`;

# 微信粉丝记录：添加关注时间字段
#ALTER TABLE `customer_wx_fans` ADD COLUMN `subscribe_time` DATETIME NULL DEFAULT NULL COMMENT '关注时间' AFTER `scene_id`;



##################################


# 2017-01-04: 在线签单业务，添加字段 - 已发布

# 商户设置表: 添加账号限制相关字段
ALTER TABLE `customer_set`
ADD COLUMN `is_no_expire` INT NULL DEFAULT 1 COMMENT '商户后台账号是否永久有效:1是,0否' AFTER `link_tel`,
ADD COLUMN `expiring_at` DATETIME NULL DEFAULT NULL COMMENT '商户后台账号的到期时间' AFTER `is_no_expire`,
ADD COLUMN `is_account_enabled` INT NULL DEFAULT 1 COMMENT '商户后台账号是否可用:1是,0否' AFTER `expiring_at`;

# 2017-01-04: 车主关怀记录，添加字段 - 已发布

# 车主关怀记录: 添加状态字段
/*
ALTER TABLE `customer_remind_record` 
ADD COLUMN `sms_code` CHAR(10) NULL DEFAULT '' COMMENT '短信发送状态码' AFTER `is_sms`,
ADD COLUMN `wx_code` VARCHAR(45) NULL DEFAULT '' COMMENT '微信发送状态码' AFTER `is_wx`;
*/
# 2017-01-12: 短信报备签名,添加字段   --  已发布
/*
ALTER TABLE `user` 
ADD COLUMN `sms_apply` VARCHAR(20) NULL DEFAULT '' COMMENT '备用签名' AFTER `sms_name`,
ADD COLUMN `approve_status` int NULL DEFAULT 0 COMMENT '报备状态:0未报备,1已报备2报备通过' AFTER `sms_apply`,
ADD COLUMN `approving_at` DATETIME NULL DEFAULT NULL COMMENT '申请报备时间' AFTER `approve_status`,
ADD COLUMN `approved_at` DATETIME NULL DEFAULT NULL COMMENT '报备通过时间' AFTER `approving_at`;
*/
# 2017-01-12: CRM 系统添加相关字段   --  已发布
# crm_customer 客户表新增签单相关字段 20170111#
ALTER TABLE `crm_customer` add `is_approve` int(11) DEFAULT 0 COMMENT '是否审核（0未审核，1已审核）' after `remark`;

# crm_contract 合同表新增短信签名字段 20170112#
ALTER TABLE `crm_contract` add `sms_name` varchar(8) DEFAULT '' COMMENT '短信签名' after `customer_id`;



##################################

# 2017-02-28

# 会员表：添加会员关注商户公众号字段

# ALTER TABLE `order_billing` ADD COLUMN `operate_dept` INT NULL DEFAULT 0 COMMENT '施工部门id' AFTER `revert_by`;


##################################



# 2017-03-22
##############  不建议反复执行本脚本   ##############
# 商户微信通知查版数据表(customer_weixin_template)，删除wid字段，保留send_wid字段
# rename: id => tid
ALTER TABLE `customer_weixin_template` CHANGE COLUMN `id` `tid` INT(11) NOT NULL AUTO_INCREMENT ;
# drop & add pk
ALTER TABLE `customer_weixin_template` 
DROP COLUMN `tid`,
DROP COLUMN `wid`,
DROP PRIMARY KEY,
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id' FIRST,
ADD PRIMARY KEY (`id`);
# 将商户接收人数据表(customer_receiver_template)的tid删除
ALTER TABLE `customer_receiver_template` DROP COLUMN `tid`;
# 将该表中的 send_wid < 0 的数据删除
# delete from customer_weixin_template where send_wid < 0;
# 2017-03-22


##################################

# 2017-02-09: 国寿积分表添加字段

# 国寿积分表: 添加相关字段
# ALTER TABLE `chinalife_integral` ADD COLUMN `maxcredit` INT NULL DEFAULT 0 COMMENT '协议最大积分值' AFTER `integral`;

# 添加上默认的合作协议积分值：90000
# update chinalife_integral set maxcredit = 90000;

# 2017-02-09

# 2017-02-10: 商户设置基础信息添加字段

# 用户表: 添加相关字段
/*
ALTER TABLE `user`
ADD COLUMN `start_at` TIME NULL DEFAULT NULL COMMENT '开始营业时间' AFTER `tel`,
ADD COLUMN `end_at` TIME NULL DEFAULT NULL COMMENT '结束营业时间' AFTER `start_at`;
*/
# 2017-02-10


# 2017-02-21

# 会员表：添加会员关注商户公众号字段
# ALTER TABLE member_base add column is_subscribe int(11) not null default 0 COMMENT '是否关注商户公众号,1:是,0:否(默认)' after wid_wxid;

# 2017-02-21


# 2017-02-24: 微信素材添加字段

# 素材表: 添加时间、人相关字段
/*
ALTER TABLE `res`
ADD COLUMN `add_date` datetime DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` varchar(50) NOT NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` datetime DEFAULT NULL COMMENT '更新时间',
ADD COLUMN `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人';
*/
# 2017-02-24

# 2017-03-06

# user表添加国国寿商户：累计结算积分价格
/*
ALTER TABLE `user` 
CHANGE COLUMN `cleared_amount` `cleared_amount` DECIMAL(12,2) NULL DEFAULT 0 COMMENT '累计结算金额' ,
ADD COLUMN `cleared_credit` DECIMAL(12,2) NULL DEFAULT 0 COMMENT '累计结算积分' AFTER `cleared_amount`,
ADD COLUMN `cleared_price` DECIMAL(12,2) NULL DEFAULT 0 COMMENT '累计结算价格' AFTER `cleared_credit`;
*/
# 商户费用结算流水表：添加结算周期
# ALTER TABLE `finance_activities` ADD COLUMN `clear_period` VARCHAR(50) NULL DEFAULT '' COMMENT '结算周期' AFTER `cleared_price`;

# 商户结算订单费用表，添加 退款时间、结算时间
# ALTER TABLE `wx_paid_orders` ADD COLUMN `returned_at` DATETIME NULL DEFAULT NULL COMMENT '退款时间' AFTER `finished_at`;
# ALTER TABLE `wx_paid_orders` ADD COLUMN `cleared_at` DATETIME NULL DEFAULT NULL COMMENT '结算时间' AFTER `returned_at`;

# 2017-03-06



##################################

# 2017-03-07: 用户表添加字段：mp_name

# ALTER TABLE `user` ADD COLUMN `mp_name` VARCHAR(50) NULL DEFAULT '' COMMENT '公众号名称' AFTER `short_name`;


# 微信通知接收人表添加code字段，不再用 tid 建立关系
# ALTER TABLE `customer_receiver_template` ADD COLUMN `code` VARCHAR(50) NULL DEFAULT '' COMMENT '微信模版CODE' AFTER `tid`;

# 2017-02-09: 国寿积分表添加字段

# 国寿积分表: 添加相关字段
# ALTER TABLE `chinalife_integral` ADD COLUMN `maxcredit` INT NULL DEFAULT 0 COMMENT '协议最大积分值' AFTER `integral`;

# 2017-02-09

##################################


# 2017-03-17: 服务项目改进、项目施工流程、项目快捷开单等功能改进 而调整表


# 开单表添加：业务来源字段
ALTER TABLE `order_billing` 
CHANGE COLUMN `order_type` `order_type` INT NOT NULL DEFAULT 0 COMMENT '业务类型:1维修开单,2B单,3美容开单,4购买商品,7代办业务',
ADD COLUMN `source` INT NOT NULL DEFAULT 0 COMMENT '业务来源:1维修开单,2B单,3(美容开单)项目消费,4购买商品,5会员卡消费并开单,6项目扣卡开单,7代办项目开单' AFTER `wid`;


# 开单服务项目表：添加代办费、服务费
ALTER TABLE `order_service` 
ADD COLUMN `agent_fee` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '代办费,非代办项目时为0' AFTER `origin_price`,
ADD COLUMN `service_fee` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '手续费,非代办项目时为0' AFTER `agent_fee`,
ADD COLUMN `process_status` INT NOT NULL DEFAULT 0 COMMENT '流程状态,1洗车,2干车' AFTER `retailer`,
CHANGE COLUMN `price` `price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '售价,代办项目时为agent_fee+service_fee' AFTER `service_fee`,
CHANGE COLUMN `operator` `operator` varchar(50) NULL DEFAULT 0 COMMENT '施工人员,逗号分隔的id';


# 商户服务项目表：添加代办标记、费用等
ALTER TABLE `customer_services` 
ADD COLUMN `agent_fee` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '代办手续费' AFTER `single_price`,
ADD COLUMN `is_agent` INT NULL DEFAULT 0 COMMENT '是否代办项目:1是,0否' AFTER `is_yuyue`,
ADD COLUMN `is_direct` INT NULL DEFAULT 0 COMMENT '是否直接开单项目:1是,0否' AFTER `is_agent`,
ADD COLUMN `is_process` INT NULL DEFAULT 0 COMMENT '是否流程控制:1是,0否' AFTER `is_direct`,
ADD COLUMN `process_steps` INT NULL DEFAULT 0 COMMENT '流程步数' AFTER `is_process`,
ADD COLUMN `is_show_price` INT NULL DEFAULT 0 COMMENT '预约是否显示预约价格:1是,0否' AFTER `process_steps`;


# 采购退货表：退货单号
ALTER TABLE `order_product_return` 
ADD COLUMN `return_code` varchar(50) NOT NULL DEFAULT '' COMMENT '退货单号' AFTER `wid`;

# 商户设置表：参数名称
ALTER TABLE `customer_configs` 
ADD COLUMN `show_name` varchar(30) NOT NULL DEFAULT '' COMMENT '参数名称' AFTER `value`;

# 应付货款表：支付方式
ALTER TABLE `customer_money_out` 
ADD COLUMN `payment` INT NOT NULL DEFAULT '0' COMMENT '支付方式' AFTER `order_time`;


##################################


# 2017-04-25

# 会员表添加字段：生日、地址、备注、总积分、可用积分
ALTER TABLE `member_base`           
ADD COLUMN `is_member` INT NULL DEFAULT 0 COMMENT '是否是会员:1是,0不是' AFTER `status`,
ADD COLUMN `member_level` INT NULL COMMENT '会员等级ID' AFTER `is_member`,
CHANGE COLUMN `birthday` `birthday` DATETIME NULL COMMENT '生日' AFTER `member_level`,
CHANGE COLUMN `address` `address` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '地址' AFTER `member_level`,
CHANGE COLUMN `remark` `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '备注' AFTER `member_level`,
ADD COLUMN `total_credit` INT NULL DEFAULT 0 COMMENT '总的积分' AFTER `remark`,
ADD COLUMN `use_credit` INT NULL DEFAULT 0 COMMENT '可用积分' AFTER `total_credit`;

# wid = 129 的备注，考虑全部清除掉

# 2017-04-25


##################################


# 2017-04-26

# 订单服务表，修改字段定义
ALTER TABLE `order_service`
CHANGE COLUMN `operator` `operator` VARCHAR(200) NULL DEFAULT '' COMMENT '施工人员,逗号分隔的id',
CHANGE COLUMN `retailer` `retailer` VARCHAR(200) NULL DEFAULT '' COMMENT '销售人员,逗号分隔的id';

# 2017-04-26

##################################


##################################

# 2017-05-10

# 会员车辆积分表
ALTER TABLE `chinalife_car_credit`
ADD COLUMN `lbsid` INT NOT NULL DEFAULT 0 COMMENT '机构id' AFTER `year`,
ADD COLUMN `is_branch` INT NOT NULL DEFAULT 0 COMMENT '使用机构积分额度:1是,0否' AFTER `lbsid`;

# 会员车辆积分历史表
ALTER TABLE `chinalife_credit_history`
ADD COLUMN `is_branch` INT NOT NULL DEFAULT 0 COMMENT '使用机构积分额度:1是,0否' AFTER `credit`;

# 2017-05-10


##################################

# 2017-05-11

# 开单服务操作人员表添加字段：同组人员
ALTER TABLE `order_service_operator`
ADD COLUMN `operator_ids` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '同组人员ID(英文逗号分隔)' AFTER `operator_id`;

# 添加索引
ALTER TABLE `order_service_operator`  ADD INDEX `idx_order_service_operator_wid` USING BTREE (`wid` asc);

# 补充索引(正式库中已存在)
# ALTER TABLE `order_service_operator`  ADD INDEX `idx_order_service_id` USING BTREE (`order_service_id` asc);

# 2017-05-11


##################################

# 2017-03-10: CRM客户表添加字段

# 注册来源、介绍人
ALTER TABLE `crm_customer`
ADD COLUMN `register_from` int NULL DEFAULT 0 COMMENT '注册来源:1PC端,2微信端' AFTER `source`,
ADD COLUMN `refer` varchar(50) NULL DEFAULT '' COMMENT '介绍人UUID' AFTER `register_from`;

# 2017-03-10: CRM客户表添加字段
# 初始化数据
update crm_customer set register_from = 1 where register_from = 0 and source = 2 and customer_level = 8;
# 2017-03-10

# 2017-03-10



##################################

# 2017-03-17：商户pubs表更新字段定义及默认值

ALTER TABLE `pubs` 
CHANGE COLUMN `service_type_info` `service_type_info` INT NOT NULL DEFAULT -1 COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号，-1表示未确认',
CHANGE COLUMN `verify_type_info` `verify_type_info` INT NOT NULL DEFAULT -1 COMMENT '-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证';

update pubs set service_type_info = -1 where service_type_info is null;
update pubs set verify_type_info = -1 where verify_type_info is null;

# 2017-03-17


##################################



##################################
# 2017-05-18

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
