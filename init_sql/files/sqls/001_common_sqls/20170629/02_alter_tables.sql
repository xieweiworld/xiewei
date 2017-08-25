# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-21
########### 车主库优化2
################################# END   - 2017-06-21
*/

# 车主库表添加：车主类型
ALTER TABLE `member_base`
ADD COLUMN `type` INT NOT NULL DEFAULT '1' COMMENT '车主类型:0系统散客,1普通车主(普通散客),2会员' AFTER `initial`;

# 删除不使用的字段(实际不删除,在文档中标记)
# ALTER TABLE `member_base` DROP COLUMN is_member;
# ALTER TABLE `member_base` DROP COLUMN is_guest;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';