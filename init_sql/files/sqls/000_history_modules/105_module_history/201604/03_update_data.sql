
#初始化数据
set sql_safe_updates=0;

update wx_paid_orders w set w.receiver = 211 where w.receiver is null;


#0429
set sql_safe_updates=0;

update wx_subscribes w set w.sub_type = 'subscribe' where w.sub_type is null;

update redpack_set r set r.isopen = 1;
#0429