# 初始化默认的商户配置表信息

# 2016-10-22 重新整理

# 平台默认提供的服务项目分类信息 sys_default_service
DROP TABLE IF EXISTS sys_default_service;
CREATE TABLE IF NOT EXISTS `sys_default_service` (
  `id` int(11) NOT NULL DEFAULT 0 COMMENT '分类id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码(正整数)',
  `name_pinyin` varchar(100) NOT NULL DEFAULT '' COMMENT '名称全拼',
  `name_chars` varchar(30) NOT NULL DEFAULT '' COMMENT '各名字首字母',
  `image_path` varchar(200) NOT NULL DEFAULT '' COMMENT '分类图片路径',
  `sort_no` tinyint NULL DEFAULT 0 COMMENT '排序码',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp COMMENT '新增时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_sys_default_service_name` (`name` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 添加默认(初始化给新商户的)服务项目
TRUNCATE TABLE sys_default_service;

set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(1, 0, '洗车', 'xiche', 'xc', 451, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(2, 0, '美容', 'meirong', 'mr', 452, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(3, 0, '维修保养', 'weixiubaoyang', 'wxby', 453, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(4, 0, '机修', 'jixiu', 'jx', 454, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(5, 0, '钣喷', 'banpen', 'bp', 455, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(6, 0, '改装', 'gaizhuang', 'gz', 456, @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(7, 0, '精品', 'jingpin', 'jp', 457, @sort:=@sort+1, '');
#insert into sys_default_service(id, pid, name, name_pinyin, name_chars, code, sort_no, image_path) value(8, 0, '配件', 'peijian', 'pj', 458, @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(101, 1, '普洗', 'puxi', 'px', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(102, 1, '精洗', 'jingxi', 'jx', @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(201, 2, '磨泥打蜡', 'monidala', 'mndl', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(202, 2, '抛光打蜡', 'paoguangdala', 'pgdl', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(203, 2, '室内清洗', 'shineiqingxi', 'snqx', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(204, 2, '臭氧消毒', 'chouyangxiaodu', 'cyxd', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(205, 2, '空调清洗', 'kongtiaoqingxi', 'ktqx', @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(301, 3, '常规保养', 'changguibaoyang', 'cgby', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(302, 3, '二级保养', 'erjibaoyang', 'ejby', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(303, 3, '油路清洗', 'youluqingxi', 'ylqx', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(304, 3, '四轮定位', 'silundingwei', 'sldw', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(305, 3, '四轮动平衡', 'silundongpingheng', 'sldph', @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(401, 4, '发动机中修', 'fadongjizhongxiu', 'fdjzx', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(402, 4, '发动机大修', 'fadongjidaxiu', 'fdjdx', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(403, 4, '变速箱', 'biansuxiang', 'bsx', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(404, 4, '底盘悬挂系统', 'dipanxuanguaxitong', 'dpxgxt', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(405, 4, '油电路', 'youdianlu', 'ydl', @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(501, 5, '钣金修复', 'banjinxiufu', 'bjxf', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(502, 5, '单幅喷漆', 'danfupenqi', 'dfpq', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(503, 5, '全车翻新', 'quanchefanxin', 'qcfx', @sort:=@sort+1, '');
set @sort=0;
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(601, 6, '音响改装', 'yinxianggaizhuang', 'yxgz', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(602, 6, '车身改色贴膜', 'cheshengaisetiemo', 'csgstm', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(603, 6, 'DVD导航一体机', 'DVDdaohangyitiji', 'ddhytj', @sort:=@sort+1, '');
insert into sys_default_service(id, pid, name, name_pinyin, name_chars, sort_no, image_path) value(604, 6, '疝气大灯改装', 'shanqidadenggaizhuang', 'sqddgz', @sort:=@sort+1, '');


select 'Re-init Data' as 'Title', 'sys_default_service' as 'Table', 'Done' as 'Status';
# 2016-10-22 重新整理
