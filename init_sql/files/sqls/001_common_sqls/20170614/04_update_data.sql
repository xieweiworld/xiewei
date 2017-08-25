# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-14
########### 车之翼6-2
################################# END   - 2017-06-14
*/


# 初始化：复核表type=1
update order_billing_more set type = 1 where wid > 0 and type = 0;

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';