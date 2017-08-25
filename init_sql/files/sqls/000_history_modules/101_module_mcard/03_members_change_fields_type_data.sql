
# 会员卡数据字段数据转换及初始化: mysql: '' 等于 0

# 将充值记录表 member_card_chongzhi.is_shift 更新为0(默认值是null)，以便程序转换数据
update member_card_chongzhi set is_shift = 0 where is_shift is null;

# 更新商品中ishyk: null => 0
update ai9me_product_cart set ishyk = 0 where ishyk is null;

# 0. 优先处理 会员表 member_base 中无时间值的数据
# 此时的 time,ctime 全为整形时间值
# 将充值时间更新到会员表中(会员表中时间为空的)  = 处理完充值表中的时间后
update member_base b inner join 
(select mid, min(time) as time from member_card_chongzhi where mid is not null group by mid) t
on b.id = t.mid
set b.time = t.time, b.add_date = from_unixtime(t.time), b.add_by = 'transform'
where (b.time = 0 or b.time is null) and b.add_date is null and b.add_by = '';
# 将最早生成订单时间来更新
ALTER TABLE `member_base` ADD INDEX `idx_member_base_wid_tel_asc` (`wid`, `tel`) USING BTREE ;
/* execution duration > 600s > */
update member_base b inner join 
(select wid, tel, min(time) as time from
(select wid, tel,  ctime as time from dsqgrecord where wid > 0 and tel > 0
union
select token as wid, tel, time from ai9me_product_cart where token > 0 and tel > 0) t
group by t.wid, t.tel) t
on b.wid = t.wid and b.tel = t.tel
set b.time = t.time, b.add_date = from_unixtime(t.time), b.add_by = 'transform'
where (b.time = 0 or b.time is null) and b.add_date is null and b.add_by = '';



set @zero_time = '0000-00-00 00:00:00';
# 时间类型处理

# 1. 会员表 member_base:  varchar => datetime
# 转换时间: time (time is empty or int): int => datetime
# int => date string
update `member_base` set time = from_unixtime(time), update_date = now(), update_by = 'init'
where time is not null and time > 0 and time != '';
# varchar => datetime
ALTER TABLE `member_base` CHANGE COLUMN `time` `time` DATETIME NULL DEFAULT NULL COMMENT '加入时间' ;
update `member_base` set time = null where time = @zero_time and @zero_time is not null and @zero_time != '';
# 时间为null的从充值记录表中更新时间: TODO

# 更新支付价格: paid_price: 应该从现有的充值记录表（type<5)中汇总后的 price 更新过来  【汇总】
update member_base b inner join 
(select mid,sum(price) as price from member_card_chongzhi where number > 0 and type < 5 and mid is not null and price > 0 group by mid) t
on b.id = t.mid
set b.paid_price = t.price, b.update_date = now(), b.update_by = 'transform'
where b.update_date is null and b.update_by = '';
# 更新会员来源: source: [暂不更新,不好确定]

# 更新车牌: cpai: 需冗余 member_auto 表中该会员的所有车牌 【汇总】
# [只处理单个车牌]
update member_base b inner join member_auto a
on b.id = a.mid
set b.cpai = a.cpai
where (b.cpai = '' or b.cpai is null) and a.cpai != '' and a.cpai is not null;

# 2. 车辆表 member_auto [无]
# 2. 会员卡表 member_card
# 更新会员卡来源: source:  [暂不更新,不好确定]

# 3. 会员奖励信息表 member_giftamount
# 添加 member_giftamount.mid 字段，由 wid, wxid 从 member_base 中取 id 过来更新
# 将 member_base.id => member_giftamount.mid
ALTER TABLE `member_base` ADD INDEX `idx_member_base_wid_wxid_asc` (`wid`, `wxid`) USING BTREE ;
ALTER TABLE `member_giftamount` ADD INDEX `idx_member_giftamount_wid_wxid_asc` (`wid`, `wxid`) USING BTREE ;
/* execution duration 460s */
update member_giftamount mg inner join member_base mb
on mg.wid = mb.wid and mg.wxid = mb.wxid 
set mg.mid = mb.id, mg.add_date = now(),  mg.add_by = 'init'
where mg.mid is null and mg.wxid is not null and mg.wid is not null;
# 将 member_card_chongzhi 中的会员最大连续签到天数 (sn) (type=5) => member_giftamount.sign_days
# max(sn) => sign_days
update member_giftamount g inner join 
(select  mid, max(sn) as sn  from member_card_chongzhi mc where type = 5 and mid is not null group by mid) c
on g.mid = c.mid
set g.sign_days = c.sn, g.update_date = now(), g.update_by = 'init'
where g.mid is not null and g.update_date is not null and g.update_by = '';

# 4. 会员积分表 member_point
# 将 获得积分流水表数据 member_card_chongzhi (type > 4) => member_point
insert into member_point(wid, mid,wxid,wid_wxid,points,category_type,libao_id,remark,add_date,add_by)
select cc.wid, mid, wxid, wid_wxid, actual_amount as points, type as category_type, null as libao_id, description as remark, now() as add_date, 'transform' as add_by
from member_card_chongzhi cc left join member_base mb
on cc.mid = mb.id
where type > 4;

# 将 消费积分流水表数据(member_card_xiaofei) 转入到 member_point
# [无数据] 会员卡消费表中无积分消费流水

# 会员积分数据转换
# 将 member_point 获得(5,6,7)的 points 之和 转到 member_giftamount.credits 中
update member_giftamount g inner join 
(select  mid, sum(points) as points from member_point where category_type in (5, 6,7) and mid is not null group by mid) p
on g.mid = p.mid
set g.credits = p.points, g.update_date = now(), g.update_by = 'init'
where g.mid is not null and g.update_date is not null and g.update_by = '';

# 5. 会员卡充值记录表
# 处理时间字段: member_card_chongzhi.time: int => varchar => datetime
# int => varchar
ALTER TABLE `member_card_chongzhi` CHANGE COLUMN `time` `time` VARCHAR(20) NULL DEFAULT NULL COMMENT '实际充值时间' ;
# timestamp value => varchar value
update `member_card_chongzhi` set time = from_unixtime(time) where time is not null;
# varchar => datetime
ALTER TABLE `member_card_chongzhi` CHANGE COLUMN `time` `time` DATETIME NULL DEFAULT NULL COMMENT '实际充值时间' ;
# time => add_date, now => update_date
update `member_card_chongzhi` set add_date = time where time is not null and add_date is null;
update `member_card_chongzhi` set time = null where time = @zero_time and @zero_time is not null and @zero_time != '';

# card_id: 由 card_code 查询id转入
ALTER TABLE `member_card_chongzhi` ADD INDEX `idx_member_card_chongzhi_mid_card_code_asc` (`mid`, `card_code`) USING BTREE ;
ALTER TABLE `member_card` ADD INDEX `idx_member_card_mid_card_code_asc` (`mid`, `card_code`) USING BTREE ;
update member_card_chongzhi c inner join member_card d
on c.mid = d.mid and c.card_code = d.card_code
set c.card_id = d.id
where c.mid > 0 and c.card_code != '' and c.card_code is not null and (c.card_id is null or c.card_id = 0);

# payment: 有order_id的为微信支付(4)，无则为现金(1)
update member_card_chongzhi set payment = 4 where order_id is not null and order_id != '' and payment is null; 
update member_card_chongzhi set payment = 1 where (order_id is null or order_id = '') and payment is null;

# product_name: 从 product_id 转
update member_card_chongzhi c inner join ai9me_product p
on c.product_id = p.id
set c.product_name = p.name
where (c.product_name is null or c.product_name = '') and c.product_id is not null;
# service_name: 从 service_id 转
update member_card_chongzhi c inner join ditu_fuwu s
on c.service_id = s.id
set c.service_name = s.name
where (c.service_name is null or c.service_name = '') and c.service_id is not null;
# number:
update member_card_chongzhi c inner join member_base b
on c.mid = b.id
set c.number = b.tel
where (c.number is null or c.number = '') and b.tel is not null and b.tel != '';
# name: 
update member_card_chongzhi c inner join member_base b
on c.mid = b.id
set c.name = b.name
where (c.name is null or c.name = '') and b.name is not null and b.name != '';
# gender: 
update member_card_chongzhi c inner join member_base b
on c.mid = b.id
set c.gender = b.sex
where (c.gender is null or c.gender = '') and b.sex is not null and b.sex != '';
# cpai: 从会员表的冗余字段转入
update member_card_chongzhi c inner join member_base b
on c.mid = b.id
set c.cpai = b.cpai
where (c.cpai is null or c.cpai = '') and b.cpai is not null and b.cpai != '';



# 6 会员礼包消费记录表 member_card_libao_record
# 初始化mid: 由 member_base(wid, number) => mid
update member_card_libao_record l inner join member_base b
on l.wid = b.wid and l.number = b.tel
set l.mid = b.id, l.add_date = now(), l.add_by = 'transform'
where l.mid is null and l.add_date is null and l.add_by is null;

# member_card_libao_record.time: int => varchar => datetime
# int => varchar
ALTER TABLE `member_card_libao_record` CHANGE COLUMN `time` `time` VARCHAR(20) NULL DEFAULT NULL COMMENT '时间' ;
# timestamp value => varchar value
update `member_card_libao_record` set time = from_unixtime(time) where time is not null;
# varchar => datetime
ALTER TABLE `member_card_libao_record` CHANGE COLUMN `time` `time` DATETIME NULL DEFAULT NULL COMMENT '时间' ;
update `member_card_libao_record` set time = null where time = @zero_time and @zero_time is not null and @zero_time != '';


# 6. 所有的会员卡记录 => 会员卡充值服务记录
# 需要由PHP程序处理 [已提供]
# member_card_chongzhi.present_info/present_services => member_card_chongzhi_service
# 包括 cz_id,product_id,service_id,service_name,amount,duration
# single_price初始化为0


# 7. 会员卡消费记录表 member_card_xiaofei
# member_card_xiaofei.time: int => varchar => datetime
# int => varchar
ALTER TABLE `member_card_xiaofei` CHANGE COLUMN `time` `time` VARCHAR(20) NULL DEFAULT NULL COMMENT '实际消费时间' ;
# timestamp value => varchar value
update `member_card_xiaofei` set time = from_unixtime(time) where time is not null;
# varchar => datetime
ALTER TABLE `member_card_xiaofei` CHANGE COLUMN `time` `time` DATETIME NULL DEFAULT NULL COMMENT '实际消费时间' ;
# time => add_date, now => update_date
update `member_card_xiaofei` set add_date = time where time is not null and add_date is null;
update `member_card_xiaofei` set time = null where time = @zero_time and @zero_time is not null and @zero_time != '';

# 重定义字段值 source 
# 0 => 32, 1 => 22, 3 => 31, 4 => 34, 7 => 21
update `member_card_xiaofei` set source = 32 where source = 0;
update `member_card_xiaofei` set source = 22 where source = 1;
update `member_card_xiaofei` set source = 31 where source = 3;
update `member_card_xiaofei` set source = 34 where source = 4;
update `member_card_xiaofei` set source = 21 where source = 7;

# 重定义字段值 type 
# 1 => 11, 2 => 12
update `member_card_xiaofei` set type = 11 where type = 1;
update `member_card_xiaofei` set type = 12 where type = 2;

# consume_code: 不转
# card_id: 不转(无法确定id)

# service_name:  
# 从 service_id 转
update member_card_xiaofei x inner join ditu_fuwu s
on x.service_id = s.id
set x.service_name = s.name
where x.service_name is null and x.service_id is not null;
# 从 content 转
update member_card_xiaofei 
set service_name = content
where (service_name is null or service_name = '') and content is not null and content != '';
# 从 service_id 转到 content
update member_card_xiaofei x inner join ditu_fuwu s
on x.service_id = s.id
set x.content = s.name
where (x.content is null and x.content != '') and x.service_id is not null;
# number
update member_card_xiaofei x inner join member_base b
on x.mid = b.id
set x.number = b.tel
where (x.number is null or x.number = '') and b.tel is not null and b.tel != '';
# cpai: 从会员表的冗余字段转入
update member_card_xiaofei x inner join member_base b
on x.mid = b.id
set x.cpai = b.cpai
where (x.cpai is null or x.cpai = '') and b.cpai is not null and b.cpai != '';

# 8. 提成比例表
# 转换提成类型: 1固定提成 | 2比例提成   =>  提成类型: 0固定提成 | 1比例提成
update commission set commission_type = 2, update_date = now(), update_by = 'init' where commission_type = 1 and update_date is null and update_by is null;
update commission set commission_type = 1, update_date = now(), update_by = 'init' where commission_type = 0 and update_date is null and update_by is null;

# 输出提示信息
select '03 - finished' as 'status';
