# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### 商户帐号密码
################################# END   - 2017-08-16
*/

# 商户帐号密码
ALTER TABLE `user_staff` ADD COLUMN `passsalt` CHAR(6) NOT NULL DEFAULT '' COMMENT '密钥串' AFTER `password`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
