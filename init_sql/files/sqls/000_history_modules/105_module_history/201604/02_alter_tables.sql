# 修改表结构的sql定义，存放在此文件中

# 收银开单功能 结算添加备注
ALTER TABLE shop_cashes add column note varchar(255) DEFAULT NULL COMMENT '备注';


# 素材表
ALTER TABLE res add column media_id text COMMENT '微信媒体id';
ALTER TABLE res add column msg_id varchar(64) DEFAULT NULL COMMENT '消息发送任务的ID';
ALTER TABLE res add column msg_result text DEFAULT NULL COMMENT '素材发送结果';

# 结算表加入收款方wid
ALTER TABLE wx_paid_orders add column receiver int(11) DEFAULT NULL COMMENT '收款方wid';

# 三级营销设置
ALTER TABLE banner_market_set add start datetime DEFAULT NULL COMMENT '开启时间';
ALTER TABLE banner_market_set add end datetime DEFAULT NULL COMMENT '结束时间';
ALTER TABLE banner_market_set add extension_line decimal(8,2) DEFAULT '0.00' COMMENT '推广奖励额度';
ALTER TABLE banner_market_set add has_extension_line decimal(8,2) DEFAULT '0.00' COMMENT '已奖励额度';
ALTER TABLE banner_market_set add is_send int(11) DEFAULT NULL COMMENT '0不推送,1推送';


# 网络注册用户加入微信号
ALTER TABLE user add wechat varchar(50) DEFAULT NULL COMMENT '微信号';

#代理表添加字段
ALTER TABLE user_agency add limit_numbers int(11) DEFAULT '0' COMMENT '0:无限，其他为限制添加的门店数';
ALTER TABLE user_agency add uid int(11) DEFAULT NULL COMMENT 'user表的id';
ALTER TABLE user_agency add wid int(11) DEFAULT NULL COMMENT 'pubs表的id';


#会员卡赠送服务
ALTER TABLE ai9me_product_gift add duration int(8) DEFAULT NULL COMMENT '有效期';
ALTER TABLE ai9me_product_gift add subtype int(8) DEFAULT NULL COMMENT '会员卡二级分类';


ALTER TABLE ai9me_product_card add duration int(11) DEFAULT NULL COMMENT '有效期';
ALTER TABLE ai9me_product_card add subtype int(11) DEFAULT NULL COMMENT '会员卡二级分类';


ALTER TABLE member_card add subtype int(11) DEFAULT NULL COMMENT '二级分类';


ALTER TABLE member_card_chongzhi add duration int(11) DEFAULT NULL COMMENT '有效期';
ALTER TABLE member_card_chongzhi add subtype int(11) DEFAULT NULL COMMENT '二级分类';
ALTER TABLE member_card_chongzhi add present_info text COMMENT '赠送服务详情';


#0429
#首次关注营销活动
ALTER TABLE wx_subscribes add sub_type varchar(32) DEFAULT NULL COMMENT '首次关注类型赠送金额:subscribe,卡券:coupon,红包:bonus';

#表redpack_set添加
ALTER TABLE redpack_set add star_at datetime DEFAULT NULL COMMENT '活动开始时间';
ALTER TABLE redpack_set add end_at datetime DEFAULT NULL COMMENT '活动开始时间';
ALTER TABLE redpack_set add min_bonus decimal(8,2) DEFAULT NULL COMMENT '最小红包金额';
ALTER TABLE redpack_set add max_bonus decimal(8,2) DEFAULT NULL COMMENT '最大红包金额';
ALTER TABLE redpack_set add sent_amount decimal(8,2) DEFAULT NULL COMMENT '已用推广额度';
ALTER TABLE redpack_set add max_amount decimal(8,2) DEFAULT '0.00' COMMENT '推广额度';


ALTER TABLE member_coupon_list add code bigint(20) DEFAULT NULL COMMENT '立即使用时生成标识码';
#0429

#0506
# 修改客户表
# 客户表的agid默认为无代理0
ALTER TABLE `weixin`.`user` CHANGE COLUMN `agid` `agid` int(11) NOT NULL DEFAULT 0 COMMENT '所属代理' ;
ALTER TABLE `weixin`.`user` CHANGE COLUMN `pay_to_ycf` `pay_to_ycf` int(8) NOT NULL DEFAULT 0 COMMENT '0支付给平台，1支付给商户' ;

# 员工打赏明细 结算添加结算id
ALTER TABLE user_staff_reward add column rcid int(11) DEFAULT NULL COMMENT '结算明细id';

# 员工打赏明细 结算添加结算id
ALTER TABLE sms_events add column wid_wxid varchar(35) DEFAULT NULL COMMENT '商户wxid';
ALTER TABLE sms_events add column template_id varchar(66) DEFAULT NULL COMMENT '模板id';

#0506
