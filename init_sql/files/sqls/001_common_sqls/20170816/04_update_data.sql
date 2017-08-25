# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-16
########### 商户帐号密码
################################# END   - 2017-08-16
*/

# 1、更新test0帐号的密码及salt值
# 先备份
create table if not exists user_staff_2017081601 select * from user_staff;
# 更新帐号(test0)的密码信息
update user_staff
set 
	`password` = 'befcd082d6b9b2d29c6877cad38d38cf', /* test0 / cs123456 */
	`passsalt` = '6VyEfj'
where wid = 319 
	and login_id = 'test0' 
	and is_system = 1
	and passsalt = ''
;

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';