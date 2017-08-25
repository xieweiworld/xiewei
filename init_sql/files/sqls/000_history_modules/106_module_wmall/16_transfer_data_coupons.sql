# 初始化数据

# 商城新版业务：
# 1 先转入商户的卡券、会员的卡券
# 2 再将赠送金额及分销奖励 转入为赠送的代金券(就一张)及会员的代金券(就一张)

# 2017-04-10

# 一、商户的卡券定义转入到 商城卡券表 :  member_coupon => wmall_coupon + wmall_coupon_list
# 1、转入商户的卡券
insert into wmall_coupon(id, wid, type, is_market, name, price, min_price, enabled_at, expired_at, duration, total, receivers, each_limit, day_limit, total_limit, share_limit, expire_day, is_newbie_get, added_after, remark, is_all, is_enable, is_delete, sort_no, add_date, add_by)
select 
distinct 
id, wid, 1 as type, 0 as is_market, name, price, 0 as min_price, 
start_at as enabled_at, end_at as expired_at, ifnull(datediff(expired_at, enabled_at), 7) as duration, 
grabs as total, 0 as receivers, 
limitamount as each_limit, limitamount as day_limit, limitamount as total_limit, limitamount as share_limit, 
7 as expire_day, 0 as is_newbie_get, NULL as added_after,  '历史卡券' as remark, 
1 as is_all, 1 as is_enable, 
#0 as is_delete, 
(case when is_grab_on = 0 or (is_grab_on = 1 and end_at < now()) then 1 else 0 end) as is_delete,
0 as sort_no, created_at as add_date, 'transfer' as add_by
from member_coupon
where wid > 0 and price > 0 and shift_status = 0;

# 1、转入会员的卡券 为 优惠券
insert into wmall_coupon_list(wid, coupon_id, order_id, mid, mobile, wxid, wid_wxid, type, source, name, price, min_price, duration, expire_day, enabled_at, expired_at, remark, is_all, is_picked, picked_time, is_used, used_time, verify_code, verify_remark, verify_by, bill_id, is_notice, is_delete, sort_no, add_date, add_by)
select
# distinct
cl.wid, cl.cid as coupon_id, 0 as order_id, ifnull(cl.mid, 0) as mid, '' as mobile, '' as wxid, '' as wid_wxid, 
1 as type, 4 as source, cl.name, cl.price, 0 as min_price, ifnull(datediff(cl.expired_at, cl.enabled_at), 0) duration, 
7 as expire_day, cl.enabled_at, cl.expired_at, '历史卡券' as remark, 
1 as is_all, 1 as is_picked, cl.enabled_at as picked_time, 
(case when isused = 1 then 1 else 0 end) as is_used, 
(case when isused = 1 then date_add(cl.enabled_at, interval 30 day) else NULL end) as used_time, 
'' as verify_code, '' as verify_remark, '' as verify_by, 0 as bill_id, 1 as is_notice, 0 as is_delete, 0 as sort_no, ifnull(cl.created_at, now()) as add_date,  'transfer' as add_by
from member_coupon_list cl left join member_coupon c on cl.wid = c.wid and cl.cid = c.id
where cl.wid > 0 and cl.price > 0 and cl.shift_status = 0;

# 更新转换状态
update member_coupon
set shift_status = 2
where wid > 0 and price > 0 and shift_status = 0;

# 更新转换状态
update member_coupon_list
set shift_status = 2
where wid > 0 and price > 0 and shift_status = 0;


# 2、将商城卡券id调整为从 1000 开始
ALTER TABLE `wmall_coupon` AUTO_INCREMENT = 1000 ;

# 二、商户的卡券定义转入到 商城卡券表 :  member_coupon => wmall_coupon + wmall_coupon_list
# 先更新 mid
update member_giftamount g inner join member_base m on g.wid = m.wid and g.tel = m.tel
set g.mid = m.id
where g.wid > 0 and (g.mid is null or g.mid = 0) and amount > 0 and g.tel != '' and g.tel is not null and shift_status = 0;

update member_giftamount g inner join member_base m on g.wid = m.wid and g.wxid = m.wxid
set g.mid = m.id
where g.wid > 0 and (g.mid is null or g.mid = 0) and amount > 0 and g.wxid != '' and g.wxid is not null and shift_status = 0;

update member_giftamount g inner join member_base m on g.wid = m.wid and g.wid_wxid = m.wid_wxid
set g.mid = m.id
where g.wid > 0 and (g.mid is null or g.mid = 0) and amount > 0 and g.wid_wxid != '' and g.wid_wxid is not null and shift_status = 0;

# 将 amount 做为 代金券 转入
# 1、默认转入一张满0元，抵0元的商户代金券
####  有效开始日期 按转入数据时计算
####  有效截止日期 按转入时间+365天计算，会员已领用卡券按1年有效期计算
####  经统计旧数据：旧数据的分销奖励超过1块的，大概在 17 条左右，基本上都在2016-07左右或没有时间或没有mid，且距目前大概1年左右，不转入 total 数据
# 先用 type=5 表示赠送金额的代金券，后续恢复为type=1
set @duration = 365;  ### days
set @gift_type = 5;
insert into wmall_coupon(wid, type, is_market, name, price, min_price, enabled_at, expired_at, duration, total, receivers, each_limit, day_limit, total_limit, share_limit, expire_day, is_newbie_get, added_after, remark, is_all, is_enable, is_delete, sort_no, add_date, add_by)
select 
distinct 
wid, @gift_type as type, 0 as is_market, '代金券(赠送金额)' as name, 0 as price, 0 as min_price, 
now() as enabled_at, date_add(now(), interval @duration day) as expired_at, @duration as duration, 
0 as total, 0 as receivers, 1 as each_limit, 0 as day_limit, 0 as total_limit, 0 as share_limit, 
7 as expire_day, 0 as is_newbie_get, NULL as added_after, '赠送金额转入，有效期365天' as remark, 
1 as is_all, 1 as is_enable, 1 as is_delete, 0 as sort_no, now() as add_date, 'transfer' as add_by
from member_giftamount
where wid > 0 and (amount) > 0 and shift_status = 0;
# 2、将会员的赠送金额，做为一张可用代金券转入 到 卡券领用表 中
insert into wmall_coupon_list(wid, coupon_id, order_id, mid, mobile, wxid, wid_wxid, type, source, name, price, min_price, duration, expire_day, enabled_at, expired_at, remark, is_all, is_picked, picked_time, is_used, used_time, verify_code, verify_remark, verify_by, bill_id, is_notice, is_delete, sort_no, add_date, add_by)
select
g.wid, c.id as coupon_id, 0 as order_id, ifnull(g.mid, 0) as mid, ifnull(tel, '') as mobile, ifnull(wxid, '') as wxid, ifnull(wid_wxid, '') as wid_wxid, 
1 as type, 4 as source, c.name, (g.amount) as price, 0 as min_price, 
@duration as duration, 7 as expire_day, now() as enabled_at, date_add(now(), interval @duration day) as expired_at, 
c.remark, 1 as is_all, 1 as is_picked, ifnull(g.add_date, now()) as picked_time, 0 as is_used, NULL as used_time, 
'' as verify_code, '' as verify_remark, '' as verify_by, 0 as bill_id, 1 as is_notice, 0 as is_delete, 0 as sort_no, now() as add_date,  'transfer' as add_by
from member_giftamount g
left join wmall_coupon c on g.wid = c.wid
where c.is_market = 0 and c.type = @gift_type and c.id is not null and
g.wid > 0 and (g.amount) > 0 and g.shift_status = 0;
# 恢复为type=1
update wmall_coupon set type = 1 where type = @gift_type;


# 3、将商城卡券id调整为从 1000 开始
ALTER TABLE `wmall_coupon` AUTO_INCREMENT = 2000 ;

# 4、更新已领用卡券的数量
update wmall_coupon c 
inner join (
select wc.id, wc.wid, count(cl.id) as total from
wmall_coupon wc 
inner join wmall_coupon_list cl on wc.wid = cl.wid and wc.id = cl.coupon_id
where wc.wid > 0
group by wc.wid, wc.id
) t on c.wid = t.wid and c.id = t.id
set c.receivers = t.total
where c.receivers != t.total;

# 5、更新旧表：转换完成，更新旧表标记
update member_giftamount
set shift_status = 2
where wid > 0 and (amount) > 0 and shift_status = 0;

# 2017-04-10

select '16' as 'Index', 'Transfer Coupons' as 'Title', 'Done' as 'Status';
