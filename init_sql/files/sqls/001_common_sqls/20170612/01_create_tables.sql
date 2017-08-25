# 创建表的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-12
########### 车主库优化
################################# END   - 2017-06-12
*/

# 车辆颜色表 sys_car_colors
CREATE TABLE IF NOT EXISTS `sys_car_colors` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '颜色中文名称',
  `code` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '颜色英文名称',
  `hex16` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '颜色16进制值',
  `is_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '启用删除;1启用,0删除',
  `add_date` DATETIME NULL DEFAULT NULL COMMENT '新增时间',
  `add_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '新增人',
  `update_date` DATETIME NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_by` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


select '01' as 'Index', 'Create Tables' as 'Title', 'Done' as 'Status';