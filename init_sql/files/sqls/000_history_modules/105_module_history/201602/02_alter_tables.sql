#修改表结构的sql定义，存放在此文件中

#三级分享营销赠送金额比例
ALTER TABLE product_present_money add column gift_gtype int(11)  DEFAULT '0' COMMENT '赠送金额类型0实际金额1商品售价百分比';

#会员微信呢称
ALTER TABLE member_base add column nickname varchar(255) DEFAULT NULL COMMENT '会员微信呢称';
ALTER TABLE member_base add column wid_wxid varchar(50) DEFAULT NULL COMMENT '对应商户公众号的wxid';

#分享金额与分销佣金帐户表
ALTER TABLE `member_giftamount` 
CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT '0.00' COMMENT '可用的分享总金额,会减少直到0' ,
CHANGE COLUMN `gift_amount` `gift_amount` DECIMAL(8,2) NULL DEFAULT '0.00' COMMENT '累积的分享总金额' ,
CHANGE COLUMN `refund_amount` `refund_amount` DECIMAL(8,2) NULL DEFAULT '0.00' COMMENT '分享后退款总金额,会减少可为负数' ,
ADD COLUMN `total` DECIMAL(8,2) NULL DEFAULT 0.00 COMMENT '可用的分销总佣金' AFTER `credits`,
ADD COLUMN `market_total` DECIMAL(8,2) NULL DEFAULT 0.00 COMMENT '累积的分销总佣金' AFTER `total`,
ADD COLUMN `wid_wxid`  varchar(50) NULL COMMENT '对应商户公众号的wxid' AFTER `market_total`,
ADD COLUMN `wait_total` DECIMAL(8,2) NULL DEFAULT 0.00 COMMENT '待获得奖励' AFTER `wid_wxid`;

#会员表添加易管车用户关注字段
alter table member_base add column isattention tinyint(4) DEFAULT '0' COMMENT '0:未关注，1:已关注';

#会员关注或浏览的门店
alter table browse_list add column lbsid int(11) DEFAULT NULL COMMENT '门店id';
