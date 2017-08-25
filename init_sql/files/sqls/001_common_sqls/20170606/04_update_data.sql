# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-06
########### 车之翼优化6.1
################################# END   - 2017-06-06
*/

#################################【正式】
# 初始化挪车提成: (之前已添加过有流程控制的服务项目)
update customer_services_process set reward_amount11 = 0.8 where reward_amount11 = 0.0 and wid = 3035; # 车之翼

# 车之翼、深荣昌：出库领料人增加“后勤部”
call __proc__add_virtual_user_staff(3035, '后勤部');
call __proc__add_virtual_user_staff(1789, '后勤部');


/*
#################################【测试】
# 初始化挪车提成: (之前已添加过有流程控制的服务项目)
update customer_services_process set reward_amount11 = 0.8 where reward_amount11 = 0.0 and wid = 500;
# 出库领料人增加“后勤部”
call __proc__add_virtual_user_staff(500, '后勤部');

#################################【开发】
# 初始化挪车提成: (之前已添加过有流程控制的服务项目)
update customer_services_process set reward_amount11 = 0.8 where reward_amount11 = 0.0 and wid = 236;
# 出库领料人增加“后勤部”
call __proc__add_virtual_user_staff(236, '后勤部');
*/

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';