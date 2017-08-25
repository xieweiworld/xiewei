# 创建表的sql定义，存放在此文件中

# 商城新版业务

# 2016-12-09

# 商品描述模版表 sys_product_template
CREATE TABLE IF NOT EXISTS `sys_product_template` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid),wid=0为默认设置数据',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `content` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '说明文件对应路径',
  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '启用删除;1启用,0禁用',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2016-12-01

# 商城首页设置表 wmall_set_home
CREATE TABLE IF NOT EXISTS `wmall_set_home` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid),wid=0,为默认设置数据',
  `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '模块编码, 定义硬编码:Search,Banner,Category,Snapup,Hot,Latest,Recommend,Category_#id',
  `module` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '说明',
  `is_system` TINYINT NOT NULL DEFAULT 0 COMMENT '是否系统定义;1是,0否',
  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 首页分类表 wmall_set_category
CREATE TABLE IF NOT EXISTS `wmall_set_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `category_id` INT NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `name` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pic_url` VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 个人中心设置表 wmall_set_member
CREATE TABLE IF NOT EXISTS `wmall_set_member` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid),wid=0,系统默认数据',
  `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '编码,由系统定义的硬编码',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `is_system` TINYINT NOT NULL DEFAULT 0 COMMENT '是否系统定义;1是,0否',
  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商城banner设置表 wmall_set_banner
CREATE TABLE IF NOT EXISTS `wmall_set_banner` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid),wid=0,系统默认数据',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `image` VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'banner图片',
  `link_type` INT NOT NULL DEFAULT 0 COMMENT '链接内容:11精品,12会员卡商品,13服务项目商品;21优惠券,22代金券;31服务项目',
  `is_more` INT NOT NULL DEFAULT 0 COMMENT '链接数量:0单个,1多个',
  `enabled_at` DATE NULL DEFAULT NULL COMMENT '启用时间',
  `expired_at` DATE NULL DEFAULT NULL COMMENT '失效时间',
  #`is_enable` TINYINT NOT NULL DEFAULT 1 COMMENT '启用标记;1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',    
  #`sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商城banner内容表 wmall_set_banner_list
CREATE TABLE IF NOT EXISTS `wmall_set_banner_list` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '商城banner内容id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid),默认值0',
  `set_id` INT NOT NULL DEFAULT 0 COMMENT '商城banner设置id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 预约设置表 wmall_reserve_set
CREATE TABLE IF NOT EXISTS `wmall_reserve_set` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '时段分类:1工作日,2休息日',
  `code` INT NOT NULL DEFAULT 0 COMMENT '时段编码:1上午,2下午',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '时段名称',
  `start_time` TIME NULL DEFAULT NULL COMMENT '开始时段',
  `end_time` TIME NULL DEFAULT NULL COMMENT '结束时段',
  `intervals` INT NOT NULL DEFAULT 0 COMMENT '预约时间间隔分钟,如30,60',
  `limit_count` INT NOT NULL DEFAULT 0 COMMENT '每时段可预约人数',
  `total_count` INT NOT NULL DEFAULT 0 COMMENT '可预约总人数',
  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 预约时段明细表 wmall_reserve_periods
CREATE TABLE IF NOT EXISTS `wmall_reserve_periods` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '时段分类:1工作日,2休息日',
  `code` INT NOT NULL DEFAULT 0 COMMENT '时段编码:1上午,2下午',
  `start_time` TIME NULL COMMENT '开始时段',
  `end_time` TIME NULL COMMENT '结束时段',
  `limit_count` INT NOT NULL DEFAULT 0 COMMENT '每时段可预约人数',
  `total_count` INT NOT NULL DEFAULT 0 COMMENT '可预约总人数',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2016-12-09

# 抢购设置表 wmall_snapup_set
CREATE TABLE IF NOT EXISTS `wmall_snapup_set` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '抢购类型:11会员卡商品,12服务项目商品,13普通商品,2卡券,21优惠券,22代金券,3服务项目',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '抢购类型对应的各商品id',
  `name` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '抢购名称',
  `is_chinalife` INT NOT NULL DEFAULT 0 COMMENT '国寿积分类抢购,1是,0否;type=1*,3时可能为1',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '抢购数量',
  `snap_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '抢购价格',
  `limit_count` INT NOT NULL DEFAULT 0 COMMENT '每人限抢数',
  `start_time` DATETIME NULL DEFAULT NULL COMMENT '抢购开始时间',
  `end_time` DATETIME NULL DEFAULT NULL COMMENT '抢购结束时间',
  `is_listed` TINYINT NOT NULL DEFAULT 0 COMMENT '是否立即上架;1是,0否',
  `listed_by` INT NOT NULL DEFAULT 0 COMMENT '上架人员',
  `listed_at` DATETIME NULL DEFAULT NULL COMMENT '上架时间',
  `duration` INT NOT NULL DEFAULT 0 COMMENT '有效时间',
  `promotion` INT NOT NULL DEFAULT 0 COMMENT '促销类别:1:一元抢购项目2: 特价服务项目3: 国寿积分项目',

  `is_period` TINYINT NOT NULL DEFAULT 0 COMMENT '是否启用抢购时段设置;1启用,0禁用',
  `start_period` TIME NULL DEFAULT NULL COMMENT '开始时段',
  `end_period` TIME NULL DEFAULT NULL COMMENT '结束时段',
  `period_interval` INT NOT NULL DEFAULT 0 COMMENT '时段间隔分钟数',
  `period_amount` INT NOT NULL DEFAULT 0 COMMENT '每时段抢购数量',

  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `sys_ser1` INT NOT NULL DEFAULT 0 COMMENT '平台服务大类',
  `sys_ser2` INT NOT NULL DEFAULT 0 COMMENT '平台服务小类',
  `audit_time` DATETIME NULL DEFAULT NULL COMMENT '审核时间',
  `audit_id` INT NOT NULL DEFAULT 0 COMMENT '审核人id',
  `audit_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '审核人帐号',
  `audit_info` VARCHAR(80) NOT NULL DEFAULT '' COMMENT '审核不通过原因',
  `audit_state` INT NOT NULL DEFAULT 0 COMMENT '审核人状态:0未审核,1审核中,2审核不通过,3审核通过',

  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 抢购时段明细表 wmall_snapup_periods
CREATE TABLE IF NOT EXISTS `wmall_snapup_periods` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `snap_id` INT NOT NULL DEFAULT 0 COMMENT '抢购设置id',
  `start_time` TIME NULL COMMENT '开始时段',
  `end_time` TIME NULL COMMENT '结束时段',
  `period_amount` INT NOT NULL DEFAULT 0 COMMENT '限抢数量',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 卡券表 wmall_coupon
CREATE TABLE IF NOT EXISTS `wmall_coupon` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '类型:1优惠券,2服务券',
  `is_market` INT NOT NULL DEFAULT 0 COMMENT '是否属于营销活动:1是,0否',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '卡券名称',
  `price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '卡券金额',
  `min_price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '最少消费金额',     
  `enabled_at` DATETIME NULL DEFAULT NULL COMMENT '领取开始时间',
  `expired_at` DATETIME NULL DEFAULT NULL COMMENT '领取结束时间',
  `duration` INT NOT NULL DEFAULT 7 COMMENT '获取券后几天内有效,999表示无限制',
  `total` INT NOT NULL DEFAULT 0 COMMENT '总数,-1表示无限制',
  `receivers` INT NOT NULL DEFAULT 0 COMMENT '已领取数量',
  `each_limit` INT NOT NULL DEFAULT 0 COMMENT '单人限领数量',
  `day_limit` INT NOT NULL DEFAULT 0 COMMENT '单人单日限领数量',
  `total_limit` INT NOT NULL DEFAULT 0 COMMENT '总限制领取数量',
  `share_limit` INT NOT NULL DEFAULT 0 COMMENT '单人可分享数量',
  `expire_day` INT NOT NULL DEFAULT 0 COMMENT '到期前提前提醒天数',
  `is_newbie_get` INT NOT NULL DEFAULT 0 COMMENT '仅限新顾客领取',
  `added_after` DATETIME NULL DEFAULT NULL COMMENT '限什么时候之后加入的顾客领取',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '卡券详情',
  `is_all` TINYINT NOT NULL DEFAULT 0 COMMENT '是否全部项目通用,1是,0否',

  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',      
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 卡券项目表 wmall_coupon_service
CREATE TABLE IF NOT EXISTS `wmall_coupon_service` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `coupon_id` INT NOT NULL DEFAULT 0 COMMENT '卡券id',
  `service_id` INT NOT NULL DEFAULT 0 COMMENT '服务id',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 卡券领用表 wmall_coupon_list
CREATE TABLE IF NOT EXISTS `wmall_coupon_list` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `coupon_id` INT NOT NULL DEFAULT 0 COMMENT '卡券id',
  `order_id` INT NOT NULL DEFAULT 0 COMMENT '商城订单ID,0:直接发送的卡券',
  `order_code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '商城订单编号',
  `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id',
  `type` INT NOT NULL DEFAULT 0 COMMENT '类型:1优惠券,2代金券',
  `source` INT NOT NULL DEFAULT 0 COMMENT '来源:1后台发送,2商城抢券,3关注领取',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '卡券名称',
  `price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '卡券金额',
  `min_price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '最少消费金额',
  `duration` INT NOT NULL DEFAULT 0 COMMENT '获取券后几天内有效,999表示无限制',
  `expire_day` INT NOT NULL DEFAULT 0 COMMENT '到期前提前提醒天数',
  `enabled_at` DATETIME NULL DEFAULT NULL COMMENT '领取后可用时间',
  `expired_at` DATETIME NULL DEFAULT NULL COMMENT '领取后过期时间',
  `remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '卡券详情',
  `is_all` TINYINT NOT NULL DEFAULT 0 COMMENT '是否全部项目通用,1是,0否',
  `is_picked` TINYINT NOT NULL DEFAULT 0 COMMENT '是否领取,1是,0否',
  `picked_time` DATETIME NULL DEFAULT NULL COMMENT '领取时间',
  `is_used` TINYINT NOT NULL DEFAULT 0 COMMENT '是否已用,1是,0否',
  `used_time` DATETIME NULL DEFAULT NULL COMMENT '使用时间',
  `verify_code` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '确认码',
  `verify_remark` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '确认备注',
  `verify_by` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '确认人',
  `bill_id` INT NOT NULL DEFAULT 0 COMMENT '对应的开单ID',
  `bill_code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '开单订单编号',
  `is_notice` INT NOT NULL DEFAULT 1 COMMENT '是否发送微信通知,0未发送,1已发送,2发送中,3发送失败',
  `notice_state` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '发送失败原因',

  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',      
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 卡券领用项目表 wmall_coupon_list_service
CREATE TABLE IF NOT EXISTS `wmall_coupon_list_service` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `list_id` INT NOT NULL DEFAULT 0 COMMENT '已领的卡券id',
  `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id',
  `service_id` INT NOT NULL DEFAULT 0 COMMENT '服务id',
  `service_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '服务名称',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商品分类表
CREATE TABLE IF NOT EXISTS `wmall_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '编码',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `icon` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图标地址',
  `remark` VARCHAR(2000) NOT NULL DEFAULT '' COMMENT '分类描述',
  `is_system` TINYINT NOT NULL DEFAULT 0 COMMENT '是否系统定义',
  `is_enable` TINYINT NOT NULL DEFAULT 0 COMMENT '启用标记;1启用,0禁用',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',    
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商品表 wmall_product
CREATE TABLE IF NOT EXISTS `wmall_product` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '类型:0:旧数据转入,1会员卡类商品,2精品类商品,3服务项目类商品,4抢购服务项目商品',
  `is_chinalife` INT NOT NULL DEFAULT 0 COMMENT '国寿积分项目商品,1是,0否',
  `is_internal` INT NOT NULL DEFAULT 0 COMMENT '内部商品,1是(type=4,5),0否(type为其他值)',
  `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '商品编码',
  `name` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `main_pic` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '默认存商品图片的第一张图',
  `pinyin` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '拼音全称',
  `chars` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '拼音首字母简称',

  `attach_id` INT NOT NULL DEFAULT 0 COMMENT '对应配件id',
  # `card_id` INT NOT NULL DEFAULT 0 COMMENT '对应卡片id', # 删除此字段
  `warning` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '注意事项',
  `description` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '描述信息文件路径',
  `template_id` INT NOT NULL DEFAULT 0 COMMENT '描述模版id',
  `is_remote` INT NOT NULL DEFAULT 0 COMMENT '是否上传远端存储:1是,0否',
  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '售价',
  `origin_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '原价',
  `chinalife_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '国寿积分价格',
  `is_show_op` INT NOT NULL DEFAULT 0 COMMENT '显示原价,1是,0否',

  `each_limit` INT NOT NULL DEFAULT 0 COMMENT '每人限购数量',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '剩余库存',
  `view_amount` INT NOT NULL DEFAULT 0 COMMENT '浏览量',
  `is_recommend` INT NOT NULL DEFAULT 0 COMMENT '是否推荐,1是,0否',
  `showinshops` INT NOT NULL DEFAULT 0 COMMENT '显示在商城,1是,0否',
  `showinventory` INT NOT NULL DEFAULT 0 COMMENT '显示库存,1是,0否',
  `showsoldcount` INT NOT NULL DEFAULT 0 COMMENT '显示销量,1是,0否',
  `origin_amount` INT NOT NULL DEFAULT 0 COMMENT '原有库存;配件时,以配件库存为准',
  `sale_count` INT NOT NULL DEFAULT 0 COMMENT '已售数量',
  `is_sale_now` TINYINT NOT NULL DEFAULT 0 COMMENT '立即开售,1是,0否',
  `saled_at` DATETIME NULL DEFAULT NULL COMMENT '开售开始时间',
  `expired_at` DATETIME NULL DEFAULT NULL COMMENT '开售结束时间',
  `durations` INT NOT NULL DEFAULT 7 COMMENT '有效天数',

  `is_install` TINYINT NOT NULL DEFAULT 0 COMMENT '提供安装,1是,0否',
  `express_mode` INT NOT NULL DEFAULT 0 COMMENT '配送方式:0无需配送,1快递配送,2车主自提',
  `express_fee` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '快递费',

  `car_brand` INT NOT NULL DEFAULT 0 COMMENT '适用品牌:0不限,1通用品牌,2专车专用',
  `car_model` INT NOT NULL DEFAULT 0 COMMENT '适用车型:0不限...',
  `status` INT NOT NULL DEFAULT 0 COMMENT '状态,0未上架,1已上架,2已下架',

  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 商品所属分类表 wmall_product_category
CREATE TABLE IF NOT EXISTS `wmall_product_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `category_id` INT NOT NULL DEFAULT 0 COMMENT '分类id',

  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商品图片表 wmall_product_image
CREATE TABLE IF NOT EXISTS `wmall_product_image` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `qiniu_pic` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '在线地址',
  `big_pic` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '大图地址',
  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',

  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商品项目表 wmall_product_service
CREATE TABLE IF NOT EXISTS `wmall_product_service` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `service_id` INT NOT NULL DEFAULT 0 COMMENT '服务id',
  `service_name` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '服务项目名称',
  `origin_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '原价',
  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '售价',

  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商品配件表 wmall_product_attach
CREATE TABLE IF NOT EXISTS `wmall_product_attach` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商品id',
  `attach_id` INT NOT NULL DEFAULT 0 COMMENT '配件id',
  `attach_name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件名称',
  `attach_code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件编码',
  `attach_model` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件规格',
  `attach_brand` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '配件品牌',
  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '数量',

  `sort_no` INT NOT NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商城订单表 wmall_order
CREATE TABLE IF NOT EXISTS `wmall_order` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT '0' COMMENT '商户wid',
  `order_code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_type` INT NOT NULL DEFAULT 0 COMMENT '订单类别:1商品,2预约,3抢购',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '对应order_type时的各类设置id,但商品类为0',

  `wxid` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '平台微信id',
  `wid_wxid` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '商户微信id',
  `mid` INT NOT NULL DEFAULT '0' COMMENT '会员id',
  `is_chinalife` INT NOT NULL DEFAULT '0' COMMENT '是否是国寿积分类订单:1是,0否',
  `name` VARCHAR(20) DEFAULT '' COMMENT '购买人姓名',
  `mobile` VARCHAR(20) DEFAULT '' COMMENT '购买人手机',
  `cpai` VARCHAR(20) DEFAULT '' COMMENT '购买人车牌',
  `address` VARCHAR(100) DEFAULT '' COMMENT '购买人地址',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '订单备注',

  `is_expired` TINYINT NOT NULL DEFAULT 0 COMMENT '是否失效:1是,0否',
  `expiring_at` DATETIME DEFAULT NULL COMMENT '预计失效时间',
  `expired_at` DATETIME DEFAULT NULL COMMENT '实际失效时间',
  `expire_reason` INT NOT NULL DEFAULT 0 COMMENT '失效原因',
  `service_id` INT NOT NULL DEFAULT 0 COMMENT '预约服务id',
  `shop_id` INT NOT NULL DEFAULT 0 COMMENT '预约门店id',
  `reserve_date` DATE NULL DEFAULT NULL COMMENT '实际预约日期',
  `reserve_state` INT NOT NULL DEFAULT 0 COMMENT '预约状态:0未预约,1已预约,2取消预约',

  `period1` TIME NULL DEFAULT NULL COMMENT '预约时间段1',
  `period2` TIME NULL DEFAULT NULL COMMENT '预约时间段2',
  `is_paid` TINYINT NOT NULL DEFAULT 0 COMMENT '是否支付:1是,0否',

  `verify_code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '核销码,6位',
  `is_verified` TINYINT NOT NULL DEFAULT 0 COMMENT '是否核销:1是,0否',
  `verified_id` INT NOT NULL DEFAULT 0 COMMENT '核销门店id',
  `verified_at` DATETIME NULL DEFAULT NULL COMMENT '核销时间',
  `verified_by` INT NOT NULL DEFAULT 0 COMMENT '核销人id',
  `introducer_id` INT NOT NULL DEFAULT 0 COMMENT '介绍人id,客户员工',

  `is_bill` TINYINT NOT NULL DEFAULT 0 COMMENT '是否已开单:1是,0否',
  `billing_id` INT NOT NULL DEFAULT 0 COMMENT '开单表id,order_billing.id',
  `billing_time` DATETIME NULL DEFAULT NULL COMMENT '开单时间',
  `is_discuss` TINYINT NOT NULL DEFAULT 0 COMMENT '是否评价:1是,0否',

  `status` INT DEFAULT 0 COMMENT '订单状态:见文档定义',
  `is_pmall` TINYINT NOT NULL DEFAULT 0 COMMENT '来源于平台下单:1是,0否',
  `order_date` DATETIME NULL DEFAULT NULL COMMENT '下单时间',
  `order_shop` INT NOT NULL DEFAULT 0 COMMENT '下单门店ID',
  `duration` INT NOT NULL DEFAULT 0 COMMENT '订单有效天数',
  `finished_at` DATETIME NULL DEFAULT NULL COMMENT '完成时间',
  `is_arrived_shop` INT NOT NULL DEFAULT 0 COMMENT '是否到店:1是,0否',
  `arrived_shop_at` DATETIME NULL DEFAULT NULL COMMENT '到店时间',

  `express_mode` TINYINT NOT NULL DEFAULT 0 COMMENT '配送方式:1快递配送,2车主自提',
  `express_at` DATETIME NULL DEFAULT NULL COMMENT '配送时间',
  `express_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '快递公司名称或配送信息',
  `express_code` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '快递单号',
  `pick_date` DATETIME NULL DEFAULT NULL COMMENT '取货时间',
  `pick_remark` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '取货备注',

  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记;1删除,0未删',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 订单支付表 wmall_order_payinfo
CREATE TABLE IF NOT EXISTS `wmall_order_payinfo` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT DEFAULT '0' COMMENT '商户id(wid)',
  `order_id` INT DEFAULT '0' COMMENT '单据id',
  `order_code` VARCHAR(50) DEFAULT '' COMMENT '订单编号',
  `receiver` INT DEFAULT '0' COMMENT '订单收款商户wid',
  `out_trade_no` VARCHAR(32) DEFAULT '' COMMENT '微信交易识别码',
  `wx_attach` VARCHAR(127) DEFAULT '' COMMENT '支付附加数据',

  `paid_credits` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '国寿支付积分值',
  `credit_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '国寿支付积分价格',
  `order_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `paid_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总价格',
  `weixin_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '微信支付价格',            
  `vcard_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '储值卡支付价格',
  `express_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '快递费用',
                                                                              
  `mcard_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '会员卡总抵扣',
  `product_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `discount_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '优惠总金额,基本为0',
  `reward_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额抵扣,新版商城为0',
  `coupon_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '抵用券抵扣金额',
  `coupon_id` INT DEFAULT '0' COMMENT '抵用券id',

  `payment` INT DEFAULT '0' COMMENT '支付方式:见文档定义',
  `is_paid` INT DEFAULT '0' COMMENT '是否支付:1是,0否',
  `paid_at` DATETIME DEFAULT NULL COMMENT '支付时间',
  `is_delete` INT DEFAULT '0' COMMENT '删除标记:0未删除,1已删除',
  `add_date` DATETIME DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 订单商品表 wmall_order_product
CREATE TABLE IF NOT EXISTS `wmall_order_product` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid',
  `order_id` INT NOT NULL DEFAULT 0 COMMENT '订单id',
  `order_code` VARCHAR(50) DEFAULT '' COMMENT '订单编号',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商城商品ID，抢购类的也会隐含生成相应的商品数据',
  `product_name` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_type` INT NOT NULL DEFAULT 0 COMMENT '同wmall_product.type定义',
  `main_pic` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '默认来源于商品的main_pic',

  `has_service` INT NOT NULL DEFAULT 0 COMMENT 'product_type=3时,是否有项目',
  `has_attach` INT NOT NULL DEFAULT 0 COMMENT 'product_type=3时,是否有配件',

  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `origin_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '购买数量',
  `car_brand` INT NOT NULL DEFAULT 0 COMMENT '适用品牌:0不限,1通用品牌,2专车专用',
  `car_model` INT NOT NULL DEFAULT 0 COMMENT '适用车型:0不限...',

  `is_install` TINYINT NOT NULL DEFAULT 0 COMMENT '是否安装:1是,0否',
  `express_mode` TINYINT NOT NULL DEFAULT 0 COMMENT '配送方式:0无需配送,1快递配送,2车主自提',

  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 订单项目表 wmall_order_service
CREATE TABLE IF NOT EXISTS `wmall_order_service` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid',
  `order_id` INT NOT NULL DEFAULT 0 COMMENT '订单id',
  `order_code` VARCHAR(50) DEFAULT '' COMMENT '订单编号',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商城商品ID，抢购类的也会隐含生成相应的商品数据',
  `service_id` INT NOT NULL DEFAULT 0 COMMENT '服务项目id',
  `service_name` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '服务项目名称',
  `origin_price` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT '原价',
  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '服务售价',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 订单配件表 wmall_order_attach
CREATE TABLE IF NOT EXISTS `wmall_order_attach` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid',
  `order_id` INT NOT NULL DEFAULT 0 COMMENT '订单id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商城商品ID，抢购类的也会隐含生成相应的商品数据',
  `attach_id` INT NOT NULL DEFAULT 0 COMMENT '配件id',
  `attach_name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件名称',
  `attach_code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件编码',
  `attach_model` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配件规格',
  `attach_brand` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '配件品牌',
  `sale_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '数量',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 订单评论表 wmall_order_comment
CREATE TABLE IF NOT EXISTS `wmall_order_comment` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` INT NOT NULL DEFAULT 0 COMMENT '上一级评论id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid',
  `order_id` INT NOT NULL DEFAULT 0 COMMENT '订单id',
  `product_id` INT NOT NULL DEFAULT 0 COMMENT '商城商品ID，抢购类的也会隐含生成相应的商品数据',
  `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id',
  `ranks` INT NOT NULL DEFAULT 0 COMMENT '商户星级1~5',
  `content` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `stars` INT NOT NULL DEFAULT 0 COMMENT '商品星级1~5',
  `image1` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图片1地址',
  `image2` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图片2地址',
  `image3` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图片3地址',
  `image4` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图片4地址',
  `image5` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '图片5地址',

  `is_delete` INT DEFAULT '0' COMMENT '是否删除:1是,0否',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 订单操作日志表 customer_order_logs
CREATE TABLE IF NOT EXISTS `customer_order_logs` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户wid',

  `order_id` INT NOT NULL DEFAULT 0 COMMENT '订单id',
  `order_code` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_type` INT NOT NULL DEFAULT 0 COMMENT '订单类别:1商品,2预约,3抢购,4开单,5购买短信',

  `source` INT DEFAULT '0' COMMENT '操作来源:1微信端,2后台端,3APP端4定时任务',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者ip',
  `operate_type` INT DEFAULT '0' COMMENT '操作类别,各种业务动作type',
  `operate_action` VARCHAR(20) DEFAULT '0' COMMENT '操作动作,各种业务动作action',
  `operate_text` VARCHAR(20) DEFAULT '0' COMMENT '操作名称,各种业务动作text',
  `operate_at` DATETIME NULL DEFAULT NULL COMMENT '操作时间',
  `is_member` INT DEFAULT '0' COMMENT '是否会员:1是,0否',
  `operate_id` INT DEFAULT '0' COMMENT '操作员id:usid,mid',
  `operate_by` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作员:账号或手机',
  `operate_name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作员姓名',
  `operate_remark` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '操作说明',

  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 2017-04-11
# 商城商品、抢购设置审核信息表 wmall_audit_info
CREATE TABLE IF NOT EXISTS `wmall_audit_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `type` INT NOT NULL DEFAULT 0 COMMENT '审核对象类型:1商城商品,2抢购设置',
  `type_id` INT NOT NULL DEFAULT 0 COMMENT '审核对象id,商品id或抢购设置id',
  `sys_ser1` INT NOT NULL DEFAULT 0 COMMENT '平台服务大类',
  `sys_ser2` INT NOT NULL DEFAULT 0 COMMENT '平台服务小类',
  `audit_time` DATETIME NULL DEFAULT NULL COMMENT '审核时间',
  `audit_id` INT NOT NULL DEFAULT 0 COMMENT '审核人id',
  `audit_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '审核人帐号',
  `audit_info` VARCHAR(80) NOT NULL DEFAULT '' COMMENT '审核不通过原因',
  `audit_state` INT NOT NULL DEFAULT 0 COMMENT '审核人状态:0未审核,1审核中,2审核不通过,3审核通过',

  `is_chinalife` INT NOT NULL DEFAULT 0 COMMENT '是否是国寿积分类',
  `is_one_price` INT NOT NULL DEFAULT 0 COMMENT '是否是一元购买类',
  `is_special_price` INT NOT NULL DEFAULT 0 COMMENT '是否是特价优惠类',

  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 2017-04-25
# 商户公众平台模板表 customer_mp_templates
CREATE TABLE IF NOT EXISTS `customer_mp_templates` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `template_id` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '模板id',
  `title` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '模板标题',
  `primary_industry` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '一级行业',
  `deputy_industry` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '二级行业',
  `content` VARCHAR(300) NOT NULL DEFAULT '' COMMENT '模板内容',
  `example` VARCHAR(300) NOT NULL DEFAULT '' COMMENT '模板示例',
  `remark` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '备注,内部使用',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '如果从公众平台中删除了,则为1;否则为0',

  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# 2017-04-25
# 营销功能-首次关注设置表 market_subscribe_set
CREATE TABLE IF NOT EXISTS `market_subscribe_set` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `amount` INT NOT NULL DEFAULT 0 COMMENT '总设置数量',
  `accepts` INT NOT NULL DEFAULT 0 COMMENT '已领用数量',
  `start_date` DATETIME NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` DATETIME NULL DEFAULT NULL COMMENT '结束时间',
  `content` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '关注后下发内容',
  `is_enable` INT NOT NULL DEFAULT 0 COMMENT '是否开启:1是,0否',

  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 营销功能-首次关注卡券表 market_subscribe_coupon
CREATE TABLE IF NOT EXISTS `market_subscribe_coupon` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `coupon_id` INT NOT NULL DEFAULT 0 COMMENT '卡券id',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '是否删除:1是,0否',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 营销功能-首次关注卡券发送表 market_subscribe_member
CREATE TABLE IF NOT EXISTS `market_subscribe_member` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `wid` INT NOT NULL DEFAULT 0 COMMENT '商户id(wid)',
  `wid_wxid` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '商户wxid',
  `mid` INT NOT NULL DEFAULT 0 COMMENT '会员id',
  `is_picked` INT NOT NULL DEFAULT 0 COMMENT '是否领取赠送:1是,0否',
  `expiring_at` DATETIME NULL DEFAULT NULL COMMENT '预计失效时间,+24h',
  `is_delete` INT NOT NULL DEFAULT 0 COMMENT '是否删除:1是,0否',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 微信通知发送日志表
CREATE TABLE IF NOT EXISTS `weixin_template_send_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送类型 1: 发送给用户 2:发送给商户接受者',
  `send_wid` int(11) NOT NULL DEFAULT '0' COMMENT '发送方',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `tel` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `wxid` char(28) NOT NULL DEFAULT '' COMMENT '用户wxid',
  `template_code` char(16) NOT NULL DEFAULT '' COMMENT '模板code',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '模板通知内容',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '发送状态码',
  `msg` varchar(32) NOT NULL DEFAULT '' COMMENT '发送状态码说明',
  `sent_at` datetime DEFAULT NULL COMMENT '发送时间',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` varchar(30) NOT NULL DEFAULT '' COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



select '01' as 'Index', 'Create Tables' as 'Title', 'Done' as 'Status';