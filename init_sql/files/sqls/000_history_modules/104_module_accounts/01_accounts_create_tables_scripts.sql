# 商户多账号系统数据库表结构定义


# 创建并初始化：平台默认商户角色权限表数据
DROP TABLE IF EXISTS sys_default_role_right;
CREATE TABLE IF NOT EXISTS `sys_default_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_code` varchar(20) NOT NULL DEFAULT '' COMMENT '角色编码',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `parent_code` varchar(20) NOT NULL DEFAULT '' COMMENT '父级角色编码',
  `right_code` varchar(20) NOT NULL DEFAULT '' COMMENT '权限编码',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `is_system` int(11) DEFAULT 0 COMMENT '系统级别角色:0否1是',
  `add_date` datetime NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) NULL DEFAULT '' COMMENT '新增人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_sdrr_role_code_right_code` (`role_code` ASC, `right_code` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 创建平台菜单模块表
CREATE TABLE IF NOT EXISTS `sys_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `right_code` varchar(100) NOT NULL COMMENT '权限编码',
  `right_name` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `parent_code` varchar(100) DEFAULT NULL COMMENT '上级权限编码,第一级为:root',
  `menu_type` int DEFAULT 1 COMMENT '菜单类型:1:顶部菜单2:左侧分组3:左侧菜单4:模块标签项5:功能按钮',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单路径',
  `sort_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序码',
  `is_available` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效:0:无效,1:有效',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_sys_right_right_code` (`right_code` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户级别权限表
CREATE TABLE IF NOT EXISTS `sys_level_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `level_id` int DEFAULT 0 COMMENT '客户级别编号',
  `right_code` varchar(100) DEFAULT NULL COMMENT '权限编码',
  `right_levels` int DEFAULT 4 COMMENT '默认权限:1:老板,2:店长,4:普通员工',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户角色表
CREATE TABLE IF NOT EXISTS `customer_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `lbsid` int DEFAULT 0 COMMENT '门店id',
  `role_code` varchar(20) NOT NULL COMMENT '角色编码',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `parent_code` varchar(20) DEFAULT NULL COMMENT '上级角色编码',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `full_path` varchar(250) DEFAULT NULL COMMENT '全路径',
  `is_system` int(11) DEFAULT '0' COMMENT '系统级权限:1:是,0:否',
  `is_delete` int(11) DEFAULT '0' COMMENT '删除标记:0未删除,1:已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户角色权限表
CREATE TABLE IF NOT EXISTS `customer_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `right_code` varchar(100) DEFAULT NULL COMMENT '权限编码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户员工角色权限表
CREATE TABLE IF NOT EXISTS `user_staff_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `usid` int DEFAULT 0 COMMENT '商户员工id',
  `right_code` varchar(100) DEFAULT NULL COMMENT '权限编码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户配置参数表 customer_configs
CREATE TABLE IF NOT EXISTS `customer_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '32位唯一标识',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置参数名称',
  `value` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT 'l',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_customer_configs_wid_name` (`wid` ASC, `name` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 商户钥匙凭码表
CREATE TABLE IF NOT EXISTS `customer_carkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID,无关联',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `keys` varchar(20) NOT NULL COMMENT '角色编码',
  `addr` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `is_enable` int(11) DEFAULT '1' COMMENT '是否可用:1:是,0:否',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `is_delete` int(11) DEFAULT '0' COMMENT '删除标记:0未删除,1:已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



#########  平台日志记录功能相关表

# 商户登录日志表
CREATE TABLE IF NOT EXISTS `log_user_logins` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '32位唯一标识',
  `wid` int DEFAULT 0 COMMENT '商户wid',
  `lbsid` int DEFAULT 0 COMMENT '门店id',
  `source` int DEFAULT 0 COMMENT '登录来源:1商户登录,2运营登录,3门店登录',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip地址',
  `login_id` int NOT NULL DEFAULT 0 COMMENT '登录账号id',
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录账号name',
  `login_time` timestamp DEFAULT current_timestamp COMMENT '登录时间',
  `login_year` int DEFAULT 0 COMMENT '登录年',
  `login_month` int DEFAULT 0 COMMENT '登录月',
  `login_day` int DEFAULT 0 COMMENT '登录日',
  `login_interval` int DEFAULT 0 COMMENT '距上次登录间隔秒数',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# 会员访问日志表
CREATE TABLE IF NOT EXISTS `log_member_requests` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '32位唯一标识',
  `wxid` varchar(60) NOT NULL DEFAULT '' COMMENT '平台wxid',
  `request_wid` int DEFAULT 0 COMMENT '商户wid,url get参数',
  `session_wid` int DEFAULT 0 COMMENT '商户wid,session get参数',
  `wid_wxid` varchar(60) NOT NULL DEFAULT '' COMMENT '平台wxid',
  `source` int DEFAULT 0 COMMENT '登录来源:1公众菜单访问,2页面点击后访问,3直接打开后访问',

  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '功能模块',
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方式:get,post,head,put,delete',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '页面url,不带页面参数',
  `queries` varchar(200) NOT NULL DEFAULT '' COMMENT '页面参数,非post数据',
  `referrer` varchar(200) NOT NULL DEFAULT '' COMMENT '上级来源页面',

  `menu_id` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单id标识',
  `menu_name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `up_menu_id` varchar(20) NOT NULL DEFAULT '' COMMENT '上级菜单id标识',
  `up_menu_name` varchar(20) NOT NULL DEFAULT '' COMMENT '上级菜单名称',

  `log_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip地址',
  `log_id` int NOT NULL DEFAULT 0 COMMENT '登录账号id',
  `log_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录账号name',
  `log_time` timestamp DEFAULT current_timestamp COMMENT '登录时间',
  `log_year` int DEFAULT 0 COMMENT '登录年',
  `log_month` int DEFAULT 0 COMMENT '登录月',
  `log_day` int DEFAULT 0 COMMENT '登录日',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT NULL COMMENT '新增人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


#########  平台日志记录功能相关表

select '01-DONE';