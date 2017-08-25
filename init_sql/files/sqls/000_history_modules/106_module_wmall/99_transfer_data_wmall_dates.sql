# 初始化数据

# 商城新版业务，旧商城订单转换完成之后运行此脚本

# 2017-05-18

update wmall_order set add_date = added_date where added_date is not null;
update wmall_order set add_by = added_by where added_by != '';

update wmall_order_product set add_date = added_date where added_date is not null;
update wmall_order_product set add_by = added_by where added_by != '';

update wmall_order_payinfo set add_date = added_date where added_date is not null;
update wmall_order_payinfo set add_by = added_by where added_by != '';

# 2017-05-18

select '88' as 'Index', 'Update Wmall Dates' as 'Title', 'Done' as 'Status';
