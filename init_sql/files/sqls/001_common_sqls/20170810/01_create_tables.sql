# 创建表的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-03
########### 车之翼优化7
################################# END   - 2017-08-03
*/

# 还款明细表 order_charge_repay_detail
CREATE TABLE IF NOT EXISTS `order_charge_repay_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `wid` int(11) DEFAULT '0' COMMENT '商户id(wid)',
  `store_id` int(11) DEFAULT '0' COMMENT '所属门店id',
  `mid` int(11) DEFAULT '0' COMMENT '车主id',           
  `charge_detail_id` int(11) DEFAULT '0' COMMENT '挂帐明细ID',
  `repay_id` int(11) DEFAULT '0' COMMENT '还款ID',
  `repay_amount` decimal(8,2) DEFAULT '0.00' COMMENT '还款金额',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序码',
  `is_delete` int(11) DEFAULT '0' COMMENT '删除标记:0未删除,1已删除',
  `add_date` datetime DEFAULT NULL COMMENT '新增时间',
  `add_by` varchar(30) DEFAULT '' COMMENT '新增人',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `update_by` varchar(30) DEFAULT '' COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


select '01' as 'Index', 'Create Tables' as 'Title', 'Done' as 'Status';