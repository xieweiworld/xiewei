
# 新增表、初始化新表数据、修改表结构

# select *, from_unixtime(time) as ctime from member_base where time is not null and time != '' and time > 0;

-- 建立临时 以便处理 chinaarea 区域表
CREATE TABLE IF NOT EXISTS `temp_chepai` (
  `areaid` varchar(10) CHARACTER SET utf8 DEFAULT '',
  `fullname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `shortname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cpai` varchar(50) CHARACTER SET utf8 DEFAULT ''
) ;


# 省市区域表 chinaarea
ALTER TABLE `chinaarea` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `pid` `pid` INT NULL DEFAULT 0 ,
CHANGE COLUMN `typ` `typ` INT NULL DEFAULT 0 COMMENT '1省2市3县区4片区' ,
CHANGE COLUMN `ord` `ord` char(6) NULL DEFAULT '6位区域编码' ,
CHANGE COLUMN `name` `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '名称' ,
ADD COLUMN `shortname` VARCHAR(10) NULL DEFAULT '' COMMENT '省份简称(粤)' AFTER `name`,
ADD COLUMN `firstword` VARCHAR(10) NULL DEFAULT '' COMMENT '默认车牌首字母(B)' AFTER `shortname`,
ADD COLUMN `sortno` INT NULL DEFAULT 0 COMMENT '排序码' AFTER `firstword`,
ADD COLUMN `isdel` INT NULL DEFAULT 0 COMMENT '删除标记' AFTER `sortno`,
ADD COLUMN `add_date` DATETIME NULL COMMENT '新增时间' AFTER `isdel`,
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人' AFTER `add_date`,
ADD COLUMN `update_date` DATETIME NULL COMMENT '最后编辑时间' AFTER `add_by`,
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '编辑人' AFTER `update_date`;


# 新增 - 数据字典表 sys_data_dicts
CREATE TABLE IF NOT EXISTS `sys_data_dicts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级项目id',
  `type` int(11) NULL DEFAULT 0 COMMENT '所属类型:1支付类型,2:会员卡分类',
  `name` varchar(20) NULL DEFAULT '' COMMENT '字典名称',
  `code` varchar(20) NULL DEFAULT '' COMMENT '字典编码',
  `remark` varchar(30) NULL DEFAULT '' COMMENT '备注',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_type_UNIQUE` (`type`, `code` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 初始化数据字典
# 1.支付方式
truncate table sys_data_dicts;
insert into sys_data_dicts(type, code, name, add_date, add_by) value(1, '1', '现金', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(1, '2', '刷银行卡', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(1, '3', '支付宝', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(1, '4', '微信支付', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(1, '9', '其他', now(), 'init');
# 2.会员卡类型
insert into sys_data_dicts(type, code, name, add_date, add_by) value(2, '1', '充值卡', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(2, '2', '次卡', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(2, '3', '年卡', now(), 'init');
insert into sys_data_dicts(type, code, name, add_date, add_by) value(2, '4', '套餐卡', now(), 'init');


# 新增 - 客户级别 sys_customer_level
CREATE TABLE IF NOT EXISTS `sys_customer_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `level_id` varchar(10) NOT NULL  COMMENT '客户级别,实为int',
  `level_name` varchar(20) NULL DEFAULT '' COMMENT '级别名称',
  `is_available` varchar(30) NULL DEFAULT 1 COMMENT '是否有效:0:无效,1:有效',
  `add_date` datetime NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `level_id_UNIQUE` (`level_id` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

truncate table sys_customer_level;
# 原已注释级别
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(1, '普通用户', 0, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(2, '普通版会员', 0, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(3, '标准版会员', 0, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(4, '钻石版会员', 0, now(), 'init');
# 原正使用级别
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(5, '行业版会员', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(6, '免费体验用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(7, '超级管理员', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(8, '网络注册用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(9, '会员卡版用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(10, '商城版用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(11, '无公众号用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(12, '车服管家平台', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(13, '三级分销用户', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(14, '商城及三级分销', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(15, '会员卡及三级分销', 1, now(), 'init');
insert into sys_customer_level(level_id, level_name, is_available, add_date, add_by) value(16, '收银开单用户', 1, now(), 'init');


# 新增 - 会员积分表 member_point
CREATE TABLE IF NOT EXISTS `member_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL,
  `wxid` varchar(50) DEFAULT NULL DEFAULT '',
  `wid_wxid` varchar(50) DEFAULT NULL DEFAULT '',
  `points` int(11) DEFAULT 0 COMMENT '正数:获得积分,负数:消费积分',
  `category_type` int(11) DEFAULT NULL COMMENT '积分类型(5:签到积分,6:充值赠送积分,7:消费赠送积分,8:积分兑换商品)',
  `libao_id` int(11) DEFAULT NULL COMMENT '兑换礼包商品id',
  `remark` varchar(200) NULL DEFAULT '' COMMENT '备注',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 新增 - 充值服务明细表 member_card_chongzhi_service
CREATE TABLE IF NOT EXISTS `member_card_chongzhi_service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cz_id` INT NULL DEFAULT NULL COMMENT '充值记录id',
  `product_id` INT NULL DEFAULT NULL COMMENT '商品id',
  `service_id` INT NULL DEFAULT NULL COMMENT '服务分类id,可能是由商品id对应出来的服务',
  `service_name` varchar(50) NULL DEFAULT '' COMMENT '服务名称',
  `amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '充值金额或次数',
  `duration` INT NULL DEFAULT 0 COMMENT '有效期(天数)',
  `single_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '充值金额或次数',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`))
ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户会员卡号流水表
CREATE TABLE IF NOT EXISTS `member_card_sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL COMMENT '商户wid',
  `type` int(11) NOT NULL COMMENT '会员卡类型:1储值卡,2次卡,3年卡,4套餐卡',
  `sequence` int(11) NOT NULL COMMENT '当前可用流水号',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`type`,`wid`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 车辆品牌车系车型表 sys_car_series
CREATE TABLE IF NOT EXISTS `sys_car_series` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(20) NULL DEFAULT '' COMMENT '品牌名称',
  `brand_char` VARCHAR(20) NULL DEFAULT '' COMMENT '品牌首字母',
  `brand_code` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '品牌编码',
  `brand_logo` VARCHAR(200) NULL DEFAULT '' COMMENT '品牌图标',
  `brand_series` VARCHAR(20) NULL DEFAULT '' COMMENT '车系分类',
  `series_name` VARCHAR(50) NULL DEFAULT '' COMMENT '车系名称',
  `series_char` VARCHAR(20) NULL DEFAULT '' COMMENT '车系首字母',
  `series_code` VARCHAR(20) NULL DEFAULT '' COMMENT '车系编码',
  `series_price` VARCHAR(20) NULL DEFAULT '' COMMENT '车系价格',
  `series_state` VARCHAR(20) NULL DEFAULT '' COMMENT '车系状态',
  `model_name` VARCHAR(50) NULL DEFAULT '' COMMENT '车型名称',
  `model_code` VARCHAR(20) NULL DEFAULT '' COMMENT '车型编码',
  `model_price` VARCHAR(20) NULL DEFAULT '' COMMENT '车型价格',
  `model_state` VARCHAR(20) NULL DEFAULT '' COMMENT '车型状态',
  `is_show` INT NULL DEFAULT 1 COMMENT '是否显示',
  `is_delete` INT NULL DEFAULT 0 COMMENT '是否删除',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  PRIMARY KEY (`id`))
ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 1、会员表: member_base
# 修改字段
ALTER TABLE `member_base` 
CHANGE COLUMN `wid` `wid` INT NULL DEFAULT NULL COMMENT '商户id',
CHANGE COLUMN `wxid` `wxid` VARCHAR(50) NULL DEFAULT NULL COMMENT '平台微信id',
CHANGE COLUMN `wid_wxid` `wid_wxid` VARCHAR(50) NULL DEFAULT NULL COMMENT '商户微信id' AFTER `wxid`,
CHANGE COLUMN `sex` `sex` VARCHAR(11) NULL DEFAULT '' COMMENT '性别',
CHANGE COLUMN `tel` `tel` varchar(20) NULL DEFAULT '' COMMENT '手机号码',
CHANGE COLUMN `cpai` `cpai` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '冗余车牌',
CHANGE COLUMN `status` `status` TINYINT(4) NULL DEFAULT 0 COMMENT '0:正常,1:删除',
CHANGE COLUMN `time` `time` VARCHAR(30) NOT NULL DEFAULT 0 COMMENT '加入时间',
CHANGE COLUMN `headimgurl` `headimgurl` VARCHAR(200) NULL DEFAULT '' COMMENT '头像地址',
CHANGE COLUMN `nickname` `nickname` VARCHAR(50) NULL DEFAULT '' COMMENT '会员微信呢称',
CHANGE COLUMN `remark` `remark` VARCHAR(200) NULL DEFAULT '' COMMENT '备注';


# 添加字段
 ALTER TABLE `member_base` 
ADD COLUMN `is_check` INT NULL DEFAULT 0 COMMENT '是否已验证手机号' AFTER `remark`,
ADD COLUMN `password` CHAR(32) NULL DEFAULT '' COMMENT '会员密码' AFTER `is_check`,
ADD COLUMN `salt` CHAR(6) NULL DEFAULT '' COMMENT '会员密码私钥串' AFTER `password`,
ADD COLUMN `pay_password` CHAR(32) NULL DEFAULT '' COMMENT '支付密码' AFTER `salt`,
ADD COLUMN `pay_salt` CHAR(6) NULL DEFAULT '' COMMENT '支付密码私钥串' AFTER `pay_password`,
ADD COLUMN `paid_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '购卡实际支付价格',
ADD COLUMN `source` INT NULL DEFAULT NULL COMMENT '会员来源(1:历史数据导入,2:门店记录,21:线下收银,23:余额转存22:线下办卡,3:微信注册,31:抢购,32:商城,33:转赠,34:扫码支付,35:购买会员卡)',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';


# 2、车辆表 member_auto
# 修改字段
ALTER TABLE `member_auto` 
CHANGE COLUMN `pid` `mid` INT(11) NOT NULL COMMENT '对应的会员ID',
CHANGE COLUMN `cartype` `brand_name` VARCHAR(20) NULL DEFAULT '' COMMENT '车辆品牌',
CHANGE COLUMN `carclass` `series_name` VARCHAR(20) NULL DEFAULT '' COMMENT '车系名称',
ADD COLUMN `model_name` VARCHAR(20) NULL DEFAULT '' COMMENT '车型名称',
ADD COLUMN `brand_code` VARCHAR(20) NULL DEFAULT '' COMMENT '品牌编码',
ADD COLUMN `series_code` VARCHAR(20) NULL DEFAULT '' COMMENT '车系编码',
ADD COLUMN `model_code` VARCHAR(20) NULL DEFAULT '' COMMENT '车型编码',
ADD COLUMN `bxcompany` VARCHAR(20) NULL DEFAULT '' COMMENT '保险公司';

# 添加字段
ALTER TABLE `member_auto` 
ADD COLUMN `is_delete` INT NULL DEFAULT 0 COMMENT '删除标记,0:未删,1:已删',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';


# 3、会员信息表 member_giftamount
# 修改字段
ALTER TABLE `member_giftamount` 
CHANGE COLUMN `wid` `wid` INT NOT NULL COMMENT '商户wid',
CHANGE COLUMN `wxid` `wxid` VARCHAR(50) NULL DEFAULT ''  COMMENT '平台openid',
CHANGE COLUMN `wid_wxid` `wid_wxid` VARCHAR(64) NULL DEFAULT '' COMMENT '商户公众号openid',
CHANGE COLUMN `wait_total` `wait_total` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '待获得奖励',
CHANGE COLUMN `auth_wid` `auth_wid` INT NULL DEFAULT NULL COMMENT '授权公众号openid',
CHANGE COLUMN `tel` `tel` VARCHAR(30) NULL DEFAULT ''  COMMENT '手机号码';

# 新增字段
ALTER TABLE `member_giftamount` 
ADD COLUMN `mid` INT NULL DEFAULT NULL COMMENT '会员id' AFTER `wid`,
ADD COLUMN `sign_days` INT NOT NULL DEFAULT 0 COMMENT '连续签到天数',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';


# 5、会员已获积分商品表 member_card_gift
# 会员已获的礼包/商品表
ALTER TABLE `member_card_gift` 
CHANGE COLUMN `mid` `mid` INT(8) NULL DEFAULT NULL COMMENT '会员ID' AFTER `wid`,
CHANGE COLUMN `times` `times` INT(11) NOT NULL DEFAULT 0 COMMENT '可用数量' ;

# 添加字段
ALTER TABLE `member_card_gift` 
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';


# 6、会员卡表 member_card
# 修改字段
ALTER TABLE `member_card`
CHANGE COLUMN `wxid` `wxid` varchar(50) NULL DEFAULT NULL COMMENT '平台微信id',
CHANGE COLUMN `type` `type` INT NULL DEFAULT NULL COMMENT '卡类型:1充值卡,2:次卡,3:年卡,4:套餐卡',
CHANGE COLUMN `mid` `mid` INT(11) NULL DEFAULT NULL COMMENT 'member_base的会员ID' AFTER `wid`,
CHANGE COLUMN `number` `mobile` VARCHAR(20) NULL DEFAULT '' COMMENT '手机号码' AFTER `mid`,
CHANGE COLUMN `code` `card_code` VARCHAR(20) NULL DEFAULT '' COMMENT '会员卡卡号,四类卡号' AFTER `wxid`,
CHANGE COLUMN `cpai` `cpai` VARCHAR(20) NULL DEFAULT '' COMMENT '冗余车牌',
CHANGE COLUMN `status` `status` TINYINT(4) NULL DEFAULT 0 COMMENT '0:正常,1:删除,2:其他';


# 添加字段
ALTER TABLE `member_card`
ADD COLUMN `pid` INT NULL DEFAULT NULL COMMENT '赠送卡所对应的父卡id' AFTER `id`,
ADD COLUMN `source` INT NULL DEFAULT NULL COMMENT '参考会员来源',
ADD COLUMN `is_main` INT NULL DEFAULT 1 COMMENT '主卡标识:1主卡,0非主卡',
ADD COLUMN `is_give` INT NULL DEFAULT 0 COMMENT '赠送卡标识:1赠送卡,0非赠送卡',
ADD COLUMN `is_enable` INT NULL DEFAULT 0 COMMENT '启用标识:1启用,0未启用',
ADD COLUMN `is_limit_car` INT NULL DEFAULT 0 COMMENT '是否限制车辆使用',
ADD COLUMN `car_id` INT NULL DEFAULT NULL COMMENT '车辆ID(不是车牌)',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';


# 7、充值流水表
# 有些字段需要在转换数据后删除
ALTER TABLE `member_card_chongzhi` 
CHANGE COLUMN `number` `number` varchar(20) NULL DEFAULT '' COMMENT '手机号码' ,
CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '剩余充值金额或次数' ,
CHANGE COLUMN `actual_amount` `actual_amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '实际充值金额或次数' ,
CHANGE COLUMN `present_amount` `present_amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '赠送金额或次数' ,
CHANGE COLUMN `type` `type` TINYINT(4) NULL DEFAULT NULL COMMENT '充值类型:1充值卡,2次卡,3年卡,4套餐卡',
CHANGE COLUMN `descript` `description` VARCHAR(200) NULL DEFAULT '' COMMENT '备注';

ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `service_name` VARCHAR(50) NULL DEFAULT '' COMMENT '服务名称' AFTER `service_id`,
ADD COLUMN `product_name` VARCHAR(50) NULL DEFAULT '' COMMENT '服务名称' AFTER `product_id`,
ADD COLUMN `payment` TINYINT NULL DEFAULT NULL COMMENT '支付方式:1现金,2银行卡,3支付宝,4微信,9其他' AFTER `price`,
ADD COLUMN `card_id` INT NULL DEFAULT NULL AFTER `subtype`,
ADD COLUMN `is_main` INT NULL DEFAULT 1 COMMENT '主卡标识:1主卡,0非主卡',
ADD COLUMN `enabled_at` DATETIME NULL DEFAULT NULL COMMENT '卡启用时间',
ADD COLUMN `name` VARCHAR(20) NULL DEFAULT '' COMMENT '名称',
ADD COLUMN `gender` VARCHAR(10) NULL DEFAULT '' COMMENT '性别',
ADD COLUMN `cpai` VARCHAR(20) NULL DEFAULT '' COMMENT '车牌',
ADD COLUMN `is_limit_car` INT NULL DEFAULT 0 COMMENT '限制车辆:0不限制,1限制',
ADD COLUMN `sale` VARCHAR(20) NULL DEFAULT '' COMMENT '销售人员',
ADD COLUMN `reward_type` INT NULL DEFAULT NULL COMMENT '提成类型:0固定提成,1:按比例提',
ADD COLUMN `reward_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '提成类型金额',
ADD COLUMN `actual_reward` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '实际提成金额',
ADD COLUMN `single_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '单次施工价格',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `is_shift` int NULL DEFAULT NULL COMMENT '是否转换数据:0:未转换,1:已转换';


# 8、消费流水表
ALTER TABLE `member_card_xiaofei` 
CHANGE COLUMN `mid` `mid` INT(11) NULL DEFAULT NULL COMMENT 'member_base的会员ID',
CHANGE COLUMN `type` `type` INT(11) NULL DEFAULT NULL COMMENT '消费类型,见数据库文档',
CHANGE COLUMN `order_id` `order_id` varchar(50) NULL DEFAULT NULL COMMENT '所属商城订单、抢购订单',
CHANGE COLUMN `amount` `amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '消费金额或次数',
CHANGE COLUMN `content` `content` VARCHAR(255) NULL DEFAULT '' COMMENT '消费内容(可能包括消费项目名称)';

ALTER TABLE `member_card_xiaofei` 
ADD COLUMN `card_id` int NULL DEFAULT NULL AFTER `mid`,
ADD COLUMN `consume_code` VARCHAR(20) NULL DEFAULT '' COMMENT '单次消费流水号',
ADD COLUMN `service_name` VARCHAR(50) NULL DEFAULT '' COMMENT '消费卡时的服务名称',
ADD COLUMN `cpai` VARCHAR(20) NULL DEFAULT '' COMMENT '消费时的车牌号',
ADD COLUMN `is_main` INT NULL DEFAULT 1 COMMENT '主卡标识:1主卡,0非主卡',
ADD COLUMN `verify_mode` INT NULL DEFAULT 0 COMMENT '验证方式:0:不验证,1:短信验证,2:密码验证,3:扫码验证',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人';

# 会员卡券表 member_coupon
ALTER TABLE `member_coupon`
CHANGE COLUMN `pic` `pic` VARCHAR(64) NULL DEFAULT '' COMMENT '卡券图片路径' ;

# 会员卡等级表 member_card_level
ALTER TABLE `member_card_level`
CHANGE COLUMN `lever_bg` `lever_bg` VARCHAR(64) NULL DEFAULT '' COMMENT '等级图片path' ;

ALTER TABLE `member_card_level` 
ADD COLUMN `is_delete` INT NULL DEFAULT 0 COMMENT '是否删除',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';

# 商户提供的礼包/商品表
ALTER TABLE `member_card_libao`
ADD COLUMN `total` INT NULL DEFAULT 0 COMMENT '已兑换礼包总数',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';

# 商户的会员礼包消费记录表 member_card_libao_record
ALTER TABLE `member_card_libao_record`
CHANGE COLUMN `type` `type` tinyint NULL DEFAULT NULL COMMENT '0:普通积分,1:每月赠送积分,2:积分商品消费记录', 
CHANGE COLUMN `status` `status` tinyint NULL DEFAULT 0 COMMENT '状态:0:未消费,1:已消费', 
CHANGE COLUMN `number` `number` varchar(20) NULL DEFAULT '' COMMENT '会员手机号', 
CHANGE COLUMN `inte` `inte` int NULL DEFAULT 0 COMMENT '礼包积分', 
ADD COLUMN `mid` INT NULL DEFAULT NULL COMMENT '会员id' AFTER `wid`,
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人';

# 积分规则表
ALTER TABLE `member_card_interule` 
ADD COLUMN `is_delete` INT NULL DEFAULT 0 COMMENT '是否删除',
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';

# 商品提成设置表
ALTER TABLE `commission` 
CHANGE COLUMN `commission_type` `commission_type` int NULL DEFAULT 0 COMMENT '提成类型:0固定提成,1比例提成', 
CHANGE COLUMN `commission_ratio` `commission_ratio` decimal(8,2) NULL DEFAULT 0 COMMENT '提成金额/提成比例', 
ADD COLUMN `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
ADD COLUMN `add_by` VARCHAR(30) NULL DEFAULT '' COMMENT '新增人',
ADD COLUMN `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
ADD COLUMN `update_by` VARCHAR(30) NULL DEFAULT '' COMMENT '最后更新人';

# 商城订单表
ALTER TABLE `ai9me_product_cart` 
CHANGE COLUMN `ishyk` `ishyk` int DEFAULT 0 COMMENT '0:普通商品,1:会员卡',
CHANGE COLUMN `status` `status` decimal(8,2) NULL DEFAULT 0 COMMENT '订单状态:-1已失效,0未支付,1已支付',
ADD COLUMN `introducer` int NULL DEFAULT NULL COMMENT '介绍人(客户员工)';

# 会员卡商品扩展表
ALTER TABLE `ai9me_product_card` 
CHANGE COLUMN `card_type` `card_type` tinyint(4) DEFAULT NULL COMMENT '会员卡类型:1充值卡,2次卡,3年卡,4套餐卡',
ADD COLUMN `is_limit_car` INT NULL DEFAULT 0 COMMENT '限制车辆:0不限制,1限制',
ADD COLUMN `single_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '单次施工价格';


# 会员卡商品赠送扩展表
ALTER TABLE `ai9me_product_gift` 
ADD COLUMN `is_limit_car` INT NULL DEFAULT 0 COMMENT '限制车辆:0不限制,1限制',
ADD COLUMN `single_price` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '单次施工价格';


# 输出提示信息
select '01 - finished' as 'status';
