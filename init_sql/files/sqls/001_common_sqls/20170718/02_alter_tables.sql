# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-07-18
########### 管理员业务
################################# END   - 2017-07-18
*/

# 员工表：添加字段 is_init
ALTER TABLE `user_staff`
ADD COLUMN `is_init` INT NOT NULL DEFAULT '0' COMMENT '帐号初始化:0商户新增的员工,1系统新增的员工' AFTER `is_system`;

# 添加索引: wid
ALTER TABLE `user_staff`  ADD INDEX `idx_user_staff_wid` USING BTREE (`wid` ASC);

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';