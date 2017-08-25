#修改表结构的sql定义，存放在此文件中


####   不要运行此文件，此文件已发布  ####

####   添加默认虚拟员工：已由 __proc__add_virtual_user_staff 替代  ####  2017-02-07


############ 为车之翼(3035)、深荣昌(1789)做开单优化的字段调整

# 出库表（order_product_out） 增加“出库人部门ID”字段
ALTER TABLE  `order_product_out` ADD COLUMN `out_dept` INT NULL DEFAULT 0 COMMENT  '出库部门id' AFTER `out_price`;

# 员工表扩充字段定义
ALTER TABLE `user_staff` 
CHANGE COLUMN `deleted` `deleted` INT(11) NULL DEFAULT '0' COMMENT '是否删除:0未删除,1已删除,2离职,3虚拟员工' ;

# 开单表增加门店ID字段
ALTER TABLE order_billing ADD COLUMN lbs_id int(11) NOT NULL DEFAULT '0' COMMENT '门店ID' AFTER receive_by;

# 商户门店表增加is_delete字段
ALTER TABLE lbs ADD COLUMN is_delete tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除:0未删除,1已删除';


############ 初始化数据
# 出库表 出库部门id: 根据出库人所在部门初始化
update order_product_out p inner join user_staff u on p.wid = u.wid and p.out_man = u.id
set p.out_dept = u.dept_id
where p.out_dept = 0 and u.dept_id > 0;

# 出库表 领用部门id: 根据领用人所在部门初始化
update order_product_out p inner join user_staff u on p.wid = u.wid and p.receive_staff = u.id
set p.receive_dept = u.dept_id
where p.receive_dept = 0 and u.dept_id > 0;

# 开单表lbsid：将接单人(receive_by)的所在门店初始化到开单表的门店(lbs_id)中
update
#select b.id, b.wid, b.receive_by, b.lbs_id, u.id,u.wid,u.lbsid from
order_billing b inner join user_staff u
on b.receive_by = u.id and b.wid = u.wid
set b.lbs_id = u.lbsid
where b.lbs_id = 0 and b.receive_by > 0 and u.lbsid > 0;

# 员工没有门店的，更新为第一个门店
update
#select b.id, b.wid, b.receive_by, b.lbs_id, t.lbsid,t.wid  from
order_billing b inner join (select min(id) as lbsid, wid from lbs group by wid) t
on b.wid = t.wid
set b.lbs_id = t.lbsid
where b.lbs_id = 0 and t.lbsid is not null;

# 还有未更新的话，就是该商户没有门店
select id, wid, receive_by, lbs_id from order_billing where (lbs_id = 0 or lbs_id is null) and receive_by > 0 and wid > 0;

# 车之翼、深荣昌、ycf测试号 添加默认虚拟员工：已由 __proc__add_virtual_user_staff 替代此功能
# 3035: 维修部 214, 美容部 215
# 1789: 维修部 211, 美容部 212
# 319: 维修部 4, 美容部 2

/*
####### 以下为测试平台下的测试商户，添加默认虚拟员工：已由 __proc__add_virtual_user_staff 替代此功能
#  236: 维修部 6, 美容部 72  
#  244: 维修部 36, 美容部 73

*/

select 'Done for 30_billings_optimize_customers.sql' as 'DONE';
