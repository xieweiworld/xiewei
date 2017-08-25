# 初始化数据

# 商城新版业务：
# 1 将商户设置的首次关注赠送金额(redpack_set)，转入为营销活动‘赠品’券(wmall_coupon.type=3)
# 2 将商户的赠品券设置为新的首次关注赠送活动并开启(market_subscribe_set, market_subscribe_coupon)
# 3 卡券类因数量少且包含压缩数据(redpack_set.act_type = 'coupon')，只有2~3条，系统发布后，手动添加。

# 2017-05-27

set @now = now();
set @sub_type = 7;  # 先使用type=7临时存储，后续还原为1
# 1 将商户设置的首次关注赠送金额，转入为营销活动‘赠品’券(wmall_coupon.type=3)
insert into wmall_coupon(wid, type, is_market, name, price, min_price, enabled_at, expired_at, duration, total, receivers, each_limit, day_limit, total_limit, share_limit, expire_day, is_newbie_get, added_after, remark, is_all, is_enable, is_delete, sort_no, add_date, add_by)
select 
distinct 
wid, @sub_type as type, 1 as is_market, share_title as name, money as price, 0 as min_price, 
star_at as enabled_at, end_at as expired_at, ifnull(datediff(end_at, star_at), 0) as duration, 
floor(max_amount/money) as total,  ceil(sent_amount/money)as receivers, 
1 as each_limit, 1 as day_limit, floor(max_amount/money) as total_limit, 0 as share_limit, 
7 as expire_day, 0 as is_newbie_get, NULL as added_after,  '关注赠送卡券' as remark, 
1 as is_all, 1 as is_enable, 0 as is_delete,
0 as sort_no, star_at as add_date, 'transfer' as add_by
from redpack_set
where wid > 0 and money > 0 and act_type = 'subscribe' and isopen = 1 and end_at > @now and shift_status = 0;

# 2、转入首次关注赠送设置表及关系表
insert into market_subscribe_set(wid, amount, accepts, start_date, end_date, content, is_enable, add_date, add_by)
select
# distinct
wid, floor(max_amount/money) as amount, ceil(sent_amount/money) as accepts, star_at as start_date, end_at as end_date, 
'' as content, isopen as is_enable, star_at as add_date, 'transfer' as add_by
from redpack_set
where wid > 0 and money > 0 and act_type = 'subscribe' and isopen = 1 and end_at > @now and shift_status = 0;
# 关系表
insert into market_subscribe_coupon(wid, coupon_id, is_delete, add_date, add_by)
select
wc.wid, wc.id as coupon_id, wc.is_delete, wc.add_date, 'transfer' as add_by
from wmall_coupon wc
left join market_subscribe_coupon sc on wc.wid = sc.wid and wc.id = sc.coupon_id
where type = @sub_type and sc.coupon_id is null;
update wmall_coupon set type = 1 where type = @sub_type; # 还原为1

# 更新转换状态
update redpack_set
set shift_status = 2
where wid > 0 and money > 0 and act_type = 'subscribe' and isopen = 1 and end_at > @now and shift_status = 0;

# 2017-05-27

select '16' as 'Index', 'Transfer Markets' as 'Title', 'Done' as 'Status';
