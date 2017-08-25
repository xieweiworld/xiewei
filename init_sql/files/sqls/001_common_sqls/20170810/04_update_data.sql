# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-03
########### 车之翼优化7
################################# END   - 2017-08-03
*/

# 1、初始化历史还款明细表
# call __proc__transfer_charge_repay_detail();	# 只有还款明细表中没有任何记录时，才会做初始化。

# 2、添加权限
# 美容施工统计 页面，单独通过页面功能来设置
# call __proc__add_right_to_all_sys_levels('Reports/FacialOperation');

# 出库管理四项按钮权限
call __proc__add_right_to_all_sys_levels('Billings/ProOutRecords-out1');
call __proc__add_right_to_all_sys_levels('Billings/ProOutRecords-out2');
call __proc__add_right_to_all_sys_levels('Billings/ProOutRecords-out3');
call __proc__add_right_to_all_sys_levels('Billings/ProOutRecords-out4');

# 有 支付方设置 权限的角色，添加上 美容施工统计权限
call __proc__add_right_to_customer_role_rights_by_right_code('Billings/Payers', 'Reports/FacialOperation');

# 有 出库管理 权限的角色，添加上 四项按钮权限
call __proc__add_right_to_customer_role_rights_by_right_code('Billings/ProOutRecords', 'Billings/ProOutRecords-out1');
call __proc__add_right_to_customer_role_rights_by_right_code('Billings/ProOutRecords', 'Billings/ProOutRecords-out2');
call __proc__add_right_to_customer_role_rights_by_right_code('Billings/ProOutRecords', 'Billings/ProOutRecords-out3');
call __proc__add_right_to_customer_role_rights_by_right_code('Billings/ProOutRecords', 'Billings/ProOutRecords-out4');

select '04' as 'Index', 'Update Data' as 'Title', 'Done' as 'Status';