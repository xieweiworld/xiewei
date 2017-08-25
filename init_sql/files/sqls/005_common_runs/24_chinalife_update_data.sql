# 调整数据

# 单次升级的过程中，允许多次执行本脚本

# 2017-03-06
###################################################
################# 商户费用结算相关数据初始化
###################################################

# 1. 初始化: finance_activities.clear_period
# 来源于结算时间的8位日期格式
update finance_activities
set clear_period = date_format(cleared_at, "%Y%m%d")
where clear_period = '' or clear_period is null;

# 2. 初始化: wx_paid_orders.returned_at，并将对应记录的 finished_at 清空
# state=0的数据，将finished_at值更新到returned_at
update wx_paid_orders
set returned_at = finished_at
where state = 0 and returned_at is null;
update wx_paid_orders
set finished_at = null
where state = 0 and returned_at is not null;

# 3. 初始化: wx_paid_orders.cleared_at
# state=6的数据，将fid关联的cleard_at值更新到本表中
update 
wx_paid_orders o inner join finance_activities f
on o.fid = f.id and o.wid = f.wid
set o.cleared_at = f.cleared_at
where fid > 0 and state = 6 and o.cleared_at is null;

###################################################
################# 国寿费用结算相关数据初始化
###################################################

# 1.将国寿的订单数据转入到新表： dsqgrecord(payment=7) => chinalife_paid_orders
# 相应的会员表中也无wid_wxid，故不加入到连接中
insert into chinalife_paid_orders(wid, wxid, wid_wxid, orderid, actual_price, actual_credit, integral, order_type, name, tel, cpai, code, body, state, time_end, finished_at, returned_at, cleared_at, fid, receiver, add_date, add_by)
select d.wid, d.wxid, '' as wid_wxid, d.orderid, d.actual_price, d.actual_credits as actual_credit, 1 as integral, 2 as order_type, d.name, d.tel, d.cpai, d.code, s.name as body, d.state, pay_time as time_end, d.finished_at, null as returned_at, d.cleared_at, 0 as fid, d.receiver, from_unixtime(ctime) as add_date, 'transfer' as add_by
#, p.id
from dsqgrecord d left join chinalife_paid_orders p on d.wid > 0 and d.wid = p.wid and d.orderid = p.orderid
left join fuwulist s on d.wid = s.wid and d.dsqgid = s.id
where d.payment = 7 and p.id is null;

######## 2,3,4: 不要单独重复运行2
# 2 将之前已结算的电子表格中的订单，生成相应的结算流水(chinalife_finance_activities) and
# 3 将流水号更新到费用结算表chinalife_paid_orders中，并修改状态为6及相应的结算时间。and
# 4 更新商户user表中相应已结算商户的累计结算积分、累计结算金额字段数据
insert into chinalife_finance_activities(wid, applied_at, cleared_at, clear_period, original_price, cleared_price, add_date, add_by)
select wid, '2017-02-27 18:55:01' as applied_at, '2017-02-28 13:06:01' as cleared_at, '结算书2月28日' as clear_period, original_price, cleared_price, now() as add_date, 'init' as add_by
from (
select wid, sum(actual_price) as original_price, sum(actual_price) as cleared_price
from chinalife_paid_orders
where state = 3 and fid = 0 and cleared_at is null and orderid in ('201612121009061740','161225132355012915','170107182317520139','170117122841617715','170117123407632111','170118094633500211','170118094734624412','170218115602826813','170224094935468106')
group by wid) t;
#select *, f.id from
update 
chinalife_paid_orders d
inner join chinalife_finance_activities f on d.state = 3 and d.wid = f.wid
set d.fid = f.id, d.cleared_at = f.cleared_at, d.state = 6
where d.fid = 0 and orderid in ('201612121009061740','161225132355012915','170107182317520139','170117122841617715','170117123407632111','170118094633500211','170118094734624412','170218115602826813','170224094935468106');
# select u.* from
update
user u
inner join pubs p on u.id = p.uid
inner join (
select wid, sum(cleared_price) as cleared_price
from chinalife_finance_activities
where clear_period = '结算书2月28日'
group by wid) t on t.wid = p.id
set u.cleared_price = t.cleared_price, u.cleared_credit = t.cleared_price * 1
where u.cleared_price = 0.0 and u.cleared_credit = 0.0;

# 2017-03-06

select '03_update_data_guoshou Finished' as 'DONE';
