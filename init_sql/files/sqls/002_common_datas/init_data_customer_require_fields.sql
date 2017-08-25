# 初始化默认的客户资料设置必填信息表

# 2017-08-16

set @wid = 0;  # 0表示是平台默认的数据

delete from customer_require_fields where wid = 0;

set @index = 10;

# 系统级定义的配置信息

# 车主信息
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'tel', 1, 1, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'name', 1, 1, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'sex', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'birthday', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'drive_end_at', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'hobby', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'address', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_base', 'remark', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;

# 车辆信息
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'cpai', 1, 1, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'brand_name', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'chejia', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'engine', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'color', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'capacity', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'carkilometre', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'buy_date', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'next_njtime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'bylong', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'bytime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'next_bxtime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'next_bylong', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'next_bytime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'bxcompany', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'remark', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'member_auto', 'parking_stall', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;

# 开单信息
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'cpai', 1, 1, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'member_mobile', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'member_name', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'car_brand', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;                                                                                                                                 
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'engine', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'chejia', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'carkilometre', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'buy_date', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'next_njtime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;                                                                                                                                    
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'next_bylong', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;                                                                                                                                     
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'next_bxtime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;                                                                                                                                     
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'bxcompany', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'next_bytime', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;                                                                                                                                      
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'member_statement', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'fault_notes', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;
insert into customer_require_fields(sort_no, wid, table_name, field_name, is_system, is_require, add_date, add_by) value(@index, @wid, 'order_billing', 'remark', 0, 0, '2017-08-16 18:12:01', 'init');
set @index = @index + 10;

# 2017-08-16


select 'Re-init Data' as 'Title', @wid as 'WID', 'customer_require_fields' as 'Table', 'Done' as 'Status';

