# 创建表的sql定义，存放在此文件中

# publishing

###### [START] 处理服务名称更换记录日志
# 服务名称更换记录表
CREATE TABLE IF NOT EXISTS `log_customer_services` (
	`id` int(11) NOT NULL DEFAULT 0 COMMENT '修改的项目id',
    `wid` int(11) DEFAULT 0 COMMENT '商户id',
    `pid` int(11) DEFAULT 0 COMMENT '上级id',
    `service_name1` varchar(20) DEFAULT '' COMMENT '修改前的服务分类名称',
    `service_name2` varchar(20) DEFAULT '' COMMENT '修改后的服务项目名称',
    `add_date` datetime DEFAULT NULL COMMENT '变更时间',
    `add_by` varchar(30) DEFAULT '' COMMENT '变更人'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
###### [FINISH] 处理服务名称更换记录日志
