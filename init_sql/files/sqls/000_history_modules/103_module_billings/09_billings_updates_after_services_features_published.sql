# 开单系统数据库表结构定义更新

# 商户品牌表添加字段: 删除标记
ALTER TABLE `order_brand` 
ADD COLUMN `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除' AFTER `name`;

# 收银订单表添加字段: 进厂公里数、购车日期
ALTER TABLE `order_billing` 
ADD COLUMN `carkilometre` INT NULL DEFAULT 0 COMMENT '进厂公里数' AFTER `bxcompany`,
ADD COLUMN `buy_date` DATETIME NULL DEFAULT NULL COMMENT '购车日期' AFTER `carkilometre`;

# 添加 年检到期时间
ALTER TABLE `member_auto` 
ADD COLUMN `next_njtime` varchar(20) NULL DEFAULT '' COMMENT '年检到期时间' AFTER `series_name`;
# 转入数据
update member_auto
set next_njtime = bxtime
where bxtime is not null and bxtime != '' 
  and bxtime > '2016-08-30' and bxtime > 2015;

# 更改 type, brand 字段类型
ALTER TABLE `order_product` 
CHANGE COLUMN `product_type` `product_type` INT NOT NULL DEFAULT 0 COMMENT '产品分类' ,
CHANGE COLUMN `product_brand` `product_brand` INT NOT NULL DEFAULT 0 COMMENT '所属品牌' ;

ALTER TABLE `order_product_change_detail` 
CHANGE COLUMN `product_type` `product_type` INT NOT NULL DEFAULT 0 COMMENT '产品分类' ,
CHANGE COLUMN `product_brand` `product_brand` INT NOT NULL DEFAULT 0 COMMENT '所属品牌' ;

ALTER TABLE `order_product_in_detail` 
CHANGE COLUMN `product_type` `product_type` INT NOT NULL DEFAULT 0 COMMENT '产品分类' ,
CHANGE COLUMN `product_brand` `product_brand` INT NOT NULL DEFAULT 0 COMMENT '所属品牌' ;

ALTER TABLE `order_product_out_detail` 
CHANGE COLUMN `product_type` `product_type` INT NOT NULL DEFAULT 0 COMMENT '产品分类' ,
CHANGE COLUMN `product_brand` `product_brand` INT NOT NULL DEFAULT 0 COMMENT '所属品牌' ;

ALTER TABLE `order_product_return_detail` 
CHANGE COLUMN `product_type` `product_type` INT NOT NULL DEFAULT 0 COMMENT '产品分类' ,
CHANGE COLUMN `product_brand` `product_brand` INT NOT NULL DEFAULT 0 COMMENT '所属品牌' ;



# 重建商品分类表
DROP TABLE IF EXISTS sys_product_type;
DROP TABLE IF EXISTS customer_product_type;

# 平台产品分类表 sys_product_type
CREATE TABLE IF NOT EXISTS `sys_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE TABLE sys_product_type;

set @idx=0, @pid=0, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'润滑油品/化学品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'深度养护品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'车灯/照明',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'汽车用品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'维修配件',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'轮胎及相关',@sort:=@sort+1,now(),'init');
set @idx=100, @pid=1, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'机油润滑油',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'刹车油/制动液',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'助力转向油',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'防冻冷却液/冷却液',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'手动挡变速箱油',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'自动挡变速箱油',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'空调制冷剂/冷媒',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');
set @idx=200, @pid=2, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'汽油添加剂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'发动机抗磨保护剂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'发动机内部清洗剂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'水箱添加剂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'空调养护产品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'节气门清洗剂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'刹车系统养护',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'三元催化清洗',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');
set @idx=300, @pid=3, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'大灯近光',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'大灯远光',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'行车雾灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'氙气大灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'信号灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'刹车灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'日间行车灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'车内照明灯',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');
set @idx=400, @pid=4, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'儿童安全座椅',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'后备箱垫',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'枕类腰靠件',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'脚垫',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'座垫',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'汽车香水',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'空气净化',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'车蜡',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'行车记录仪',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'汽车挂件摆件',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'汽车贴膜',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'雨刮片',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'清洁用品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'安全救生用品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'维修用品',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');
set @idx=500, @pid=5, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'下摆臂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'求龙套',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'高压点火线',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'点火线圈/高压包',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'离合器三件套',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'减振器',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'传动轴',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'刹车系统',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');
set @idx=600, @pid=6, @sort=0;
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'轮胎',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'轮胎养护',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'胎压表',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'车载充气泵',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'胎压监测',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'轮毂',@sort:=@sort+1,now(),'init');
insert into sys_product_type(id, pid, name,sort_no, add_date, add_by) value(@idx:=@idx+1,@pid,'其他',@sort:=@sort+1,now(),'init');


# 商户产品分类表 customer_product_type
CREATE TABLE IF NOT EXISTS `customer_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `wid` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',

  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
  `remark` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  
  `sort_no` int(11) NULL DEFAULT 0 COMMENT '排序码',
  `is_enable` int(11) DEFAULT 1 COMMENT '启用标记:0禁用,1启用',
  `is_delete` int(11) DEFAULT 0 COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`, `wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 重置自增id为 1001 开始
ALTER TABLE `customer_product_type` AUTO_INCREMENT = 1001 ;


select '09-DONE';