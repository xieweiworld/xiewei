#修改表结构的sql定义，存放在此文件中

#会员卡积分功能

ALTER TABLE member_card_interule add column recharge_inte int(11) null default 0 COMMENT '充值赠送会员积分';
ALTER TABLE member_card_interule add column consume_inte int(11) null default 0 COMMENT '消费赠送会员积分';
ALTER TABLE member_card_gift add column mid int(8) null default NULL COMMENT '会员ID';

#抢购预约时间字段增加长度
ALTER TABLE  `dsqgrecord` CHANGE  `date` `date`  varchar(30) NULL DEFAULT NULL COMMENT  '抢购预约时间';

#车主关怀
ALTER TABLE `sms_events` CHANGE COLUMN `biz_type` `biz_type` INT(11) NULL COMMENT '订单业务类型:抢购订单1、商城订单2、预约订单3、紧急救援订单4、抢购服务项目5等等';
ALTER TABLE `sms_events` ADD COLUMN `dsqgid` INT(11) NULL DEFAULT NULL COMMENT '服务id,即抢购订单中的dsggid' AFTER `is_sent`;

#结算表添加微信支付订单号(已发布)
#alter table wx_paid_orders add column transaction_id varchar(64) null default NULL COMMENT '微信支付订单号';

#微信推送接收者加入模板id 已添加
#alter table wx_template_notice add column template_id varchar(64) null default NULL COMMENT '模板id';

#订单表添加out_trade_no和buy_from_sid
#alter table dsqgrecord add column out_trade_no varchar(64) null default NULL COMMENT '商户订单号(退款时用到)';
#alter table dsqgrecord add column buy_from_sid int(11) null default NULL COMMENT '此订单从该分享链接进来';
alter table dsqgrecord add column expiring_at int(11) null default NULL COMMENT '订单预计失效时间';
alter table dsqgrecord add column expired_at datetime default NULL COMMENT '订单失效时间';


##alter table fuwulist add column isdiscount int(11) DEFAULT '0' COMMENT '是否参与会员折扣1为参加0不参加(页面默认参与)';


#alter table ai9me_product_cart add column out_trade_no varchar(64) null default NULL COMMENT '商户订单号(退款时用到)';
#alter table ai9me_product_cart add column buy_from_sid int(11) null default NULL COMMENT '此订单从该分享链接进来';
alter table ai9me_product_cart add column expiring_at int(11) null default NULL COMMENT '订单预计失效时间';
alter table ai9me_product_cart add column expired_at datetime default NULL COMMENT '订单失效时间';

#alter table ai9me_product add column isdiscount  int(11) DEFAULT '0' COMMENT '是否参与会员折扣1为参加0不参加(页面默认参与)';
#alter table ai9me_product add column ord  int(11) DEFAULT '0' COMMENT '商品排序越大越靠前';


alter table redpack add column friend1_times  int(11) DEFAULT NULL COMMENT '一级朋友消费成功后再次获赠金额的次数';
alter table redpack add column friend2_times  int(11) DEFAULT NULL COMMENT '二级朋友消费成功后再次获赠金额的次数';
alter table redpack add column friend3_times  int(11) DEFAULT NULL COMMENT '三级朋友消费成功后再次获赠金额的次数';
alter table redpack add column product_present_mid  varchar(64) DEFAULT NULL COMMENT '赠送金额设置表id(商城订单有多个商品id用，拼接)';



alter table product_present_money add column gift_enabled  int(8) DEFAULT '0' COMMENT '是否开启朋友从分享链接购买原来分享者获得赠送金额，1开启';
alter table product_present_money add column gtype  int(8) DEFAULT '0' COMMENT '赠送金额类型0实际金额1商品售价百分比';
alter table product_present_money add column gift_num1  decimal(8,2) DEFAULT NULL COMMENT '一级赠送金额';
alter table product_present_money add column gift_num2  decimal(8,2) DEFAULT NULL COMMENT '二级赠送金额';
alter table product_present_money add column gift_num3  decimal(8,2) DEFAULT NULL COMMENT '三级赠送金额';



#alter table member_giftamount add column gift_amount  decimal(8,2) DEFAULT NULL;
#alter table member_giftamount add column refund_amount  decimal(8,2) DEFAULT NULL;
alter table member_giftamount add column credits  int(11) DEFAULT '0' COMMENT '会员积分';