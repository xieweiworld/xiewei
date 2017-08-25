# 初始化默认的商户设配表信息

# 2016-12-10

set @wid = 0;  # 0表示是平台默认的数据

delete from customer_set where wid = @wid;

INSERT INTO customer_set(`wid`, `show_name`, `address`, `map_addr`, `sms_name`, `approve_status`, `approving_at`, `approved_at`, `amount`, `is_fans_update`, `cus_tel`, `link_man`, `link_tel`, `wx_center_name`, `pre_date_hours`, `online_discount`, `add_date`, `add_by`) 
VALUE(@wid, '易车服', '广东省深圳市南山区', '{0,0}', '易车服', 0, NULL, NULL, 0, 0, '4000036778', '小易', '4000036778', '个人中心', 6, 10, '2016-12-10 15:44:00', 'init');

select * from customer_set where wid = @wid;

select 'Re-init Data' as 'Title', @wid as 'WID', 'customer_set' as 'Table', 'Done' as 'Status';

# 2016-10-20
