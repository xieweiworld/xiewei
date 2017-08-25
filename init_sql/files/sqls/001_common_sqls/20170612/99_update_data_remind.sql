# 更新表数据的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-06-12
########### 车主库优化
################################# END   - 2017-06-12
*/


########### 前提：需要先将新的默认(wid=0)的关怀记录数据，添加到数据表中；然后再初始化现有商户关怀记录 ###########


# 一、初始化关怀提醒内容
# 1、生日提醒(care_type=8)
set @care_type = 8;
insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) 
select nr.wid, yr.care_type, yr.amount, yr.is_sms, yr.is_wechat, yr.is_enable, yr.remark, yr.content, yr.sort_no, now() as add_date, 'init' as add_by
# , tr.id as trid, rr.id as rrid
from (select distinct wid from customer_remind where wid > 0 and care_type != @care_type) nr
cross join (select * from customer_remind where wid = 0 and care_type = @care_type) yr
left join customer_remind tr on nr.wid = tr.wid and yr.care_type = tr.care_type
left join (select distinct wid, id, care_type from customer_remind where wid > 0 and care_type = @care_type) rr on nr.wid = rr.wid and yr.care_type = rr.care_type
where rr.id is null;
# 2、驾驶证到期提醒(care_type=9)
set @care_type = 9;
insert into customer_remind(wid, care_type, amount, is_sms, is_wechat, is_enable, remark, content, sort_no, add_date, add_by) 
select nr.wid, yr.care_type, yr.amount, yr.is_sms, yr.is_wechat, yr.is_enable, yr.remark, yr.content, yr.sort_no, now() as add_date, 'init' as add_by
# , tr.id as trid, rr.id as rrid
from (select distinct wid from customer_remind where wid > 0 and care_type != @care_type) nr
cross join (select * from customer_remind where wid = 0 and care_type = @care_type) yr
left join customer_remind tr on nr.wid = tr.wid and yr.care_type = tr.care_type
left join (select distinct wid, id, care_type from customer_remind where wid > 0 and care_type = @care_type) rr on nr.wid = rr.wid and yr.care_type = rr.care_type
where rr.id is null;


select '99' as 'Index', 'Update Data-Remind' as 'Title', 'Done' as 'Status';