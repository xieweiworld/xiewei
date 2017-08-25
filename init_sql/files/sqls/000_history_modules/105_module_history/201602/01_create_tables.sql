# 创建表的sql定义，存放在此文件中

# 易管家关注列表
CREATE TABLE IF NOT EXISTS `browse_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL,
  `wxid` varchar(80) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:浏览，1:关注,2:取消关注',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


# 分享金额与分销金额流水表
CREATE TABLE IF NOT EXISTS `member_giftamount_record` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `mgid` int(11) DEFAULT NULL COMMENT '外键表member_giftamount的id',
  `record_type` int(11) DEFAULT '0' COMMENT '0赠送金额记录，1分销佣金记录',
  `rtype` int(11) DEFAULT NULL COMMENT '0获得,1消费,2退款,3待收获',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '金额',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `level` int(11) DEFAULT NULL COMMENT '0自己分享获得，1，2，3分销级别获得,4首次关注获得',
  `orderid` varchar(50) DEFAULT NULL COMMENT '产生佣金的订单号',
  `wxid` varchar(50) DEFAULT NULL COMMENT '产生佣金的会员wxid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


#提现流水记录表
CREATE TABLE IF NOT EXISTS `member_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `mgid` int(11) DEFAULT NULL COMMENT '外键表member_giftamount的id',
  `styp` int(11) DEFAULT NULL COMMENT '0提现到赠送金额，1提现到微信钱包',
  `partner_trade_no` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '提现金额',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `times` int(11) DEFAULT NULL COMMENT '提现次数',
  `state` int(11) DEFAULT NULL COMMENT '0处理中，1提现成功，2提现失败',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



#分享者浏览量(分享后推送相应图文)
CREATE TABLE IF NOT EXISTS `share_visited` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `stype` varchar(32) DEFAULT NULL COMMENT 'banner海报，pro服务商品(use_pro)使用中的',
  `source` varchar(32) DEFAULT NULL COMMENT 'sc商城,wxpt抢购',
  `distributionid` int(11) DEFAULT NULL COMMENT '外键表member_distribution的id',
  `wxid` varchar(32) DEFAULT NULL COMMENT '分享者wxid',
  `productid` int(11) DEFAULT NULL COMMENT '商品或服务id',
  `wid_wxid` varchar(32) DEFAULT NULL,
  `nickname` varchar(128) DEFAULT NULL,
  `headimgurl` varchar(128) DEFAULT NULL,
  `qrcodeinfo` varchar(255) DEFAULT NULL,
  `expire_seconds` int(11) DEFAULT NULL COMMENT '二维码有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#三级分享分销关系记录表
CREATE TABLE IF NOT EXISTS `member_distribution` (
`id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '来源:父类上一个关联id',
  `wid` int(11) DEFAULT NULL,
  `wxid` varchar(32) DEFAULT NULL COMMENT '下单订单人',
  `orderid` varchar(32) DEFAULT NULL COMMENT '下单订单号',
  `productinfo` text COMMENT '下单订单信息和赠送奖励',
  `from_info` text,
  `source` varchar(32) DEFAULT NULL COMMENT 'sc商城，wxpt抢购',
  `share_type` varchar(32) DEFAULT NULL COMMENT 'order分享订单,product分享商品服务,banner海报营销',
  `state` int(11) DEFAULT '0' COMMENT '结转状态0为未结转,1为结转',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#海报关系表
CREATE TABLE IF NOT EXISTS `banner_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `wid_wxid` varchar(64) DEFAULT NULL,
  `ycf_wxid` varchar(64) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `from_wid_wxid` varchar(64) DEFAULT NULL,
  `from_ycf_wxid` varchar(64) DEFAULT NULL,
  `from_nickname` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#海报参数设置表
CREATE TABLE IF NOT EXISTS `banner_market_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `banner` varchar(128) DEFAULT NULL,
  `gnum` decimal(8,2) DEFAULT NULL COMMENT '扫码关注获得',
  `gnum1` decimal(8,2) DEFAULT NULL COMMENT '一级推荐获得',
  `gnum2` decimal(8,2) DEFAULT NULL COMMENT '二级推荐',
  `gnum3` decimal(8,2) DEFAULT NULL,
  `n_time` int(11) DEFAULT NULL,
  `draw_num` decimal(8,2) DEFAULT NULL COMMENT '满(draw_num)可提现',
  `market_type` int(10) DEFAULT NULL COMMENT '0订单营销，1海报营销',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商品评价表
CREATE TABLE IF NOT EXISTS `comments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `wxid` varchar(255) DEFAULT NULL,
  `un` varchar(255) DEFAULT NULL,
  `content` text,
  `quality` int(11) DEFAULT '5',
  `speed` int(11) DEFAULT '5',
  `whole` int(11) DEFAULT '1',
  `time` int(11) DEFAULT NULL,
  `img1` varchar(255) DEFAULT '' COMMENT '上传图片1',
  `img2` varchar(255) DEFAULT '' COMMENT '上传图片2',
  `img3` varchar(255) DEFAULT '' COMMENT '上传图片3',
  `approved` int(11) DEFAULT '0' COMMENT '未审核：0，审核通过:1,不通过:2',
  `source` varchar(11) DEFAULT NULL COMMENT '商城sc/\\抢购wxpt',
  `pid` int(225) DEFAULT NULL COMMENT '父级评论',
  `mid` int(225) DEFAULT NULL COMMENT '会员ID',
  `uploaded` int(11) DEFAULT '0' COMMENT '0:不晒图片，1：晒图片',
  `psid` int(11) DEFAULT NULL COMMENT '商品或服务id',
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `agrees` int(11) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#评价点赞表
CREATE TABLE IF NOT EXISTS `comments_agrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(225) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '评价id',
  `agreed` int(11) DEFAULT NULL COMMENT '1是未点赞',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
