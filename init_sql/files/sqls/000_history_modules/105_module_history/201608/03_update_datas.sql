# 初始化数据

########## [START] 处理多一个手机号、一个微信号存在多mid的问题

# 1.初始化 member_auto.wid: 根据 member_atuo.mid 对应的 member_base.wid 来初始化
# 先删除 mid 为 0 且 cpai 为空或null的数据
delete from member_auto where mid = 0 and (cpai is null or cpai = '');
# 更新 mid : 先根据 cpai 更新 mid，因扫码付款的记录未存到 mid
# [可能导致1个会员存在多辆相同的车牌]
update member_auto a inner join member_base m on a.cpai = m.cpai
set a.mid = m.id
where a.mid = 0 and a.cpai != '' and m.wid > 0;
# 更新 wid
update member_auto a inner join member_base m on a.mid = m.id
set a.wid = m.wid
where a.wid = 0 and m.wid > 0;
# 更新 wid, mid
update member_auto a inner join member_base m on m.cpai = a.cpai
set a.wid = m.wid, a.mid = m.id
where a.wid = 0 and a.mid = 0;
# 更新 wid
update member_auto a inner join member_base m on m.cpai = a.cpai and a.mid = m.id
set a.wid = m.wid
where a.cpai != '' and a.wid = 0 and m.wid is not null and a.mid > 0;
update member_auto a inner join member_base m on a.mid = m.id
set a.wid = m.wid
where a.wid = 0 and a.mid > 0 and m.wid is not null and m.wid != 0;	
# SHOUD delete cars: 无会员的车辆数据，且车辆不知道是哪个商户的
# DELETE from member_auto where wid = 0 and mid > 0 and add_date is null and mid not in (select id from member_base);
select * from member_auto where wid = 0 and mid > 0 and add_date is null and mid not in (select id from member_base);
# 剩余未更新到 wid 的车辆
select count(id) as total_wid_is_zero from member_auto where wid = 0;
select count(id) as total_mid_is_zero from member_auto where mid = 0;
select count(id) as total_mwid_is_zero from member_auto where wid = 0 or mid = 0;

# 2.初始化 ai9me_product_cart.mid: 根据该表中的 tel 或 wecha_id 或 cpai 来初始化
# wecha_id 优先
update ai9me_product_cart o inner join member_base m on o.token = m.wid and o.wecha_id = m.wxid
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid > 0 and m.wxid != '' and  m.wxid is not null;
# tel 其次
update ai9me_product_cart o inner join member_base m on o.token = m.wid and o.tel = m.tel
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid > 0 and m.tel != '' and  m.tel is not null;
# cpai 再次
update ai9me_product_cart o inner join member_base m on o.token = m.wid and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid > 0 and m.cpai != '' and  m.cpai is not null;
# update by abs(member_base.wid) with member_base.wid < 0
update ai9me_product_cart o inner join member_base m on o.token = abs(m.wid) and o.wecha_id = m.wxid
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid < 0 and m.wxid != '' and  m.wxid is not null;
update ai9me_product_cart o inner join member_base m on o.token = abs(m.wid) and o.tel = m.tel
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid < 0 and m.tel != '' and  m.tel is not null;
update ai9me_product_cart o inner join member_base m on o.token = abs(m.wid) and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.token > 0 and m.wid < 0 and m.cpai != '' and  m.cpai is not null;

# 剩余未更新到 mid 的订单
select count(id) as total_mid_is_zero from ai9me_product_cart where mid = 0 and token > 0;

# 3.初始化 dsqgrecord.mid: 根据该表中的 tel 或 wxid 或 cpai 来初始化
# wxid 优先
update dsqgrecord o inner join member_base m on o.wid = m.wid and o.wxid = m.wxid
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.wxid != '' and  m.wxid is not null;
# tel 其次
update dsqgrecord o inner join member_base m on o.wid = m.wid and o.tel = m.tel
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.tel != '' and  m.tel is not null;
# cpai 再次
update dsqgrecord o inner join member_base m on o.wid = m.wid and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.cpai != '' and  m.cpai is not null;
# update by abs(member_base.wid) with member_base.wid < 0
update dsqgrecord o inner join member_base m on o.wid = abs(m.wid) and o.wxid = m.wxid
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.wxid != '' and  m.wxid is not null;
update dsqgrecord o inner join member_base m on o.wid = abs(m.wid) and o.tel = m.tel
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.wxid != '' and  m.tel is not null;
update dsqgrecord o inner join member_base m on o.wid = abs(m.wid) and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.wxid != '' and  m.cpai is not null;

# 剩余未更新到 mid 的订单
select count(id) as total_mid_is_zero from dsqgrecord where mid = 0 and wid > 0 and orderid != '' and orderid is not null;

# 4.初始化 yyfw_records.mid: 根据该表中的 mobile 或 wxid 或 cpai 来初始化
# wxid 优先
update yyfw_records o inner join member_base m on o.wid = m.wid and o.wxid = m.wxid
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.wxid != '' and  m.wxid is not null;
# mobile 其次
update yyfw_records o inner join member_base m on o.wid = m.wid and o.mobile = m.tel
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.tel != '' and  m.tel is not null;
# cpai 再次
update yyfw_records o inner join member_base m on o.wid = m.wid and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid > 0 and m.cpai != '' and  m.cpai is not null;
# update by abs(member_base.wid) with member_base.wid < 0
update yyfw_records o inner join member_base m on o.wid = abs(m.wid) and o.wxid = m.wxid
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.wxid != '' and  m.wxid is not null;
update yyfw_records o inner join member_base m on o.wid = abs(m.wid) and o.mobile = m.tel
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.tel != '' and  m.tel is not null;
update yyfw_records o inner join member_base m on o.wid = abs(m.wid) and o.cpai = m.cpai
set o.mid = m.id
where o.mid = 0 and o.wid > 0 and m.wid < 0 and m.cpai != '' and  m.cpai is not null;

# 剩余未更新到 mid 的订单
select count(id) as total_mid_is_zero from yyfw_records where mid = 0 and wid > 0;

########## [FINISH] 处理多一个手机号、一个微信号存在多mid的问题
