# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-30
########### 车主库优化2
########### 一、将涉及到车牌的数据更新车牌为大写
################################# END   - 2017-06-30
*/

########### 一、将涉及到车牌的数据更新车牌为大写

update member_base set cpai = upper(cpai) where wid > 0 and cpai != '';

update member_auto set cpai = upper(cpai) where wid > 0 and cpai != '';

update member_card set cpai = upper(cpai) where wid > 0 and cpai != '';

update member_card_chongzhi set cpai = upper(cpai) where wid > 0 and cpai != '';

update member_card_xiaofei set cpai = upper(cpai) where wid > 0 and cpai != '';

update chinalife_car_credit set cpai = upper(cpai) where wid > 0 and cpai != '';

update chinalife_credit_history set cpai = upper(cpai) where wid > 0 and cpai != '';

update customer_scancode_payinfo set cpai = upper(cpai) where wid > 0 and cpai != '';

update customer_remind_record set cpai = upper(cpai) where wid > 0 and cpai != '';

update wmall_order set cpai = upper(cpai) where wid > 0 and cpai != '';

update order_billing set cpai = upper(cpai) where wid > 0 and cpai != '';

select '04' as 'Index', 'Update Data - cpai' as 'Title', 'Done' as 'Status';