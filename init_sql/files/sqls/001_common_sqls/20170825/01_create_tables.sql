# 创建表的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### SCRM优化二之【中】优先级
################################# END   - 2017-08-16
*/

# 客户资料设置必填字段表
CREATE TABLE IF NOT EXISTS `customer_require_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `wid` int(11) DEFAULT '0' COMMENT '商户wid,wid=0表示默认值',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT '表名',
  `field_name` varchar(50) NOT NULL DEFAULT '' COMMENT '字段',
  `is_system` int(11) DEFAULT '0' COMMENT '是否系统定义:1:是,0:否',
  `is_require` int(11) DEFAULT '0' COMMENT '是否必填:1:是,0:否',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `is_delete` int(11) DEFAULT '0' COMMENT '删除标记:0未删除,1:已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

# 系统任务队列表
CREATE TABLE IF NOT EXISTS `sys_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(32) NOT NULL DEFAULT '' COMMENT '任务类别',
  `data` varchar(1024) NOT NULL DEFAULT '' COMMENT '任务所需数据',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务优先级,越大则越优先执行',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务状态:0未执行,1执行中,2已执行',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_sys_queue_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1841283 DEFAULT CHARSET=utf8;


select '01' as 'Index', 'Create Tables' as 'Title', 'Done' as 'Status';