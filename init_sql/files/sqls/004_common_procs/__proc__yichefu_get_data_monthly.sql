
# 用 MySQL-Front 无法执行经脚本
# 需要通过 MySQLWorkbench 或 通过 phpMyAdmin 在线站点 执行此脚本

# 平台数据汇总
# 年月 商户数 门店数 粉丝数（关注数－取消关注数） 操作数 会员数 使用会员卡人数 消费人数 重复消费人数 复购率 交易额 订单数

# call __proc__yichefu_get_data_monthly(12, 0, '');

drop procedure if exists __proc__yichefu_get_data_monthly;

DELIMITER //; 
# months:  整数值，统计月数，最近 months 个月，默认 30。
# imports: 整数值，用户来源，0所有的, 1导入的(即qq<0的), 2正常的(即非导入的)，默认 0。
# levels:  字符串，用户等级，逗号分隔的用户等级值列表，如 '1,2,3' , 参考 sys_customer_level.level_id 值列表, 默认 ''。
CREATE PROCEDURE __proc__yichefu_get_data_monthly(in months int, in imports int, in levels varchar(250))
PROC_START_POINT: BEGIN
	declare month_format, current_month varchar(10);
	declare now_date datetime;
	declare month_index int;

	if months is null or months = '' or months < 1 then
		set months = 30;
	end if;

	if imports is null or imports = '' then
		set imports = 0;
	end if;

	if levels is null or levels = '' then
		set levels = '';
	end if;

	if months > 100 then
		select '参数错误(months)：统计月数参数超过100个月啦' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	if imports not in (0, 1, 2) then
		select '参数错误(imports)：用户来源参数只支持(0,1,2)' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	if length(levels) > 250 then
		select '参数错误(levels)：用户等级参数超过250个字符咯' as ERROR;
		LEAVE PROC_START_POINT;
	end if;

	select months as month, imports as source, levels as level;
	select '数据统计中......' as STATUS;

	# 删除临时表
	###################################
	drop temporary table if exists __tmp_tbl__data_monthly;
	drop temporary table if exists __tmp_tbl__data_user_detail;
	drop temporary table if exists __tmp_tbl__data_user;
	drop temporary table if exists __tmp_tbl__data_lbs;
	drop temporary table if exists __tmp_tbl__data_subscribe;
	drop temporary table if exists __tmp_tbl__data_unsubscribe;
	drop temporary table if exists __tmp_tbl__data_operation;
	drop temporary table if exists __tmp_tbl__data_member;
	drop temporary table if exists __tmp_tbl__data_card_member;
	drop temporary table if exists __tmp_tbl__data_buy_member;
	drop temporary table if exists __tmp_tbl__data_more_member;
	drop temporary table if exists __tmp_tbl__data_order;
	###################################

	set month_format = '%Y-%m';
	set now_date = now();
	set current_month = DATE_FORMAT(now_date, month_format);
	
	drop temporary table if exists __tmp_tbl__data_monthly;
	CREATE TEMPORARY TABLE __tmp_tbl__data_monthly select current_month as 'month';
	
	set month_index = 1;
	while month_index < months do
		set current_month = DATE_FORMAT(date_add(now_date, interval -month_index month), month_format);
		insert into __tmp_tbl__data_monthly(`month`) value(current_month);
		set month_index = month_index + 1;
	end while;

	# select * from __tmp_tbl__data_monthly;


	# 生成结果
	###################################

	# 商户数: 根据 商户来源，用户等级 查询商户数
	CREATE TEMPORARY TABLE __tmp_tbl__data_user_detail
	select distinct id, id as uid, rtime
	from user
	where ((imports = 0) or (imports = 1 and qq < 0) or ( imports = 2 and (qq >= 0 or qq is null)))
			and ((levels = '') or (find_in_set(level_id, levels) and levels != ''))
	;
	CREATE TEMPORARY TABLE __tmp_tbl__data_user
	select DATE_FORMAT(rtime, '%Y-%m') as month, count(id) as users
	from __tmp_tbl__data_user_detail
	#where ((imports = 0) or (imports = 1 and qq < 0) or (imports = 2 and (qq >= 0 or qq is null)))
	#		and ((levels = '') or (find_in_set(level_id, levels) and levels != ''))
	group by month;

	# 门店数，无时间字段，给总数，但也是从上述商户中查询总数
	CREATE TEMPORARY TABLE __tmp_tbl__data_lbs
	select DATE_FORMAT(now(), '%Y-%m') as month, count(id) as lbs_count
	from lbs
	where uid in (select distinct uid from __tmp_tbl__data_user_detail);

	# 关注数
	CREATE TEMPORARY TABLE __tmp_tbl__data_subscribe
	select DATE_FORMAT(ctime, '%Y-%m') as month, sum(CASE WHEN total is null THEN 1 when total = 0 then 1 ELSE total END) as subscribes
	from data_statistics
	where wid > 0 and type = 1
	group by month;

	# 取消关注数
	CREATE TEMPORARY TABLE __tmp_tbl__data_unsubscribe
	select DATE_FORMAT(ctime, '%Y-%m') as month, sum(CASE WHEN total is null THEN 1 when total = 0 then 1 ELSE total END) as unsubscribes
	from data_statistics
	where wid > 0 and type = 5
	group by month;

	# 操作数
	CREATE TEMPORARY TABLE __tmp_tbl__data_operation
	select DATE_FORMAT(ctime, '%Y-%m') as month, sum(CASE WHEN total is null THEN 1 when total = 0 then 1 ELSE total END) as operations
	from data_statistics
	where wid > 0
	group by month;

	# 会员数，无时间字段，给总数
	CREATE TEMPORARY TABLE __tmp_tbl__data_member
	select DATE_FORMAT(now(), '%Y-%m') as month, count(id) as members
	from member_base
	where wid > 0;

	# 使用会员卡人数
	CREATE TEMPORARY TABLE __tmp_tbl__data_card_member
	select month, sum(card_members) as card_members
	from
	(
	select from_unixtime(time, '%Y-%m') as month, count(id) as card_members
	from member_card_chongzhi
	where wid > 0 and is_cleared = 1 and type in (1, 2, 3, 4)
	group by month

	union all

	select from_unixtime(time, '%Y-%m') as month, count(id) as card_members
	from member_card_xiaofei
	where wid > 0 and type in (1, 2, 3, 4)
	) t
	group by month
	order by month asc;


	# 消费人数
	CREATE TEMPORARY TABLE __tmp_tbl__data_buy_member
	select month, sum(buy_members) as buy_members
	from
	(
	select from_unixtime(ctime, '%Y-%m') as month, count(tel) as buy_members
	from
	(
	select distinct ctime, tel
	from dsqgrecord
	where wid > 0 and tel is not null and tel != ''
	) t
	group by month

	union all

	select from_unixtime(time, '%Y-%m') as month, count(tel) as buy_members
	from
	(
	select distinct time, tel
	from ai9me_product_cart
	where token > 0 and tel is not null and tel != ''
	) t
	group by month
	) m
	group by month;


	# 重复消费人数
	CREATE TEMPORARY TABLE __tmp_tbl__data_more_member
	select month, sum(buy_members) as more_members
	from
	(
	select from_unixtime(ctime, '%Y-%m') as month, tel, count(id) as buy_members
	from dsqgrecord
	where wid > 0 and tel is not null and tel != ''
	group by month, tel
	having buy_members > 1

	union all

	select from_unixtime(time, '%Y-%m') as month, tel, count(id) as buy_members
	from ai9me_product_cart
	where token > 0 and tel is not null and tel != ''
	group by month, tel
	having buy_members > 1
	) m
	group by month;

	# 复购率


	# 交易额、订单数
	CREATE TEMPORARY TABLE __tmp_tbl__data_order
	select month, sum(actual_prices) as actual_prices, sum(total_orders) as total_orders
	from
	(
	select from_unixtime(ctime, '%Y-%m') as month, sum(actual_price) as actual_prices, count(id) as total_orders
	from dsqgrecord 
	where state > 1 and ctime is not null and ctime > 0
	group by month

	union all

	select from_unixtime(time, '%Y-%m') as month, sum(actual_price) as actual_prices, count(id) as total_orders
	from ai9me_product_cart
	where ishyk = 0 and status > 1 and time is not null and time > 0
	group by month
	) t
	group by month;

	###################################
	

	# 取结果
	###################################

	select basic.month,
	user.users,
	lbs.lbs_count,
	subscribe.subscribes,
	unsubscribe.unsubscribes,
	operation.operations,
	member.members,
	card.card_members,
	buy.buy_members,
	more.more_members,
	concat(round(100 * ifnull(more.more_members,0) / ifnull(buy.buy_members, 1)), '%') as more_ratio,
	orders.actual_prices,
	orders.total_orders
	from __tmp_tbl__data_monthly basic
	left join __tmp_tbl__data_user user on basic.month = user.month
	left join __tmp_tbl__data_lbs lbs on basic.month = lbs.month
	left join __tmp_tbl__data_subscribe subscribe on basic.month = subscribe.month
	left join __tmp_tbl__data_unsubscribe unsubscribe on basic.month = unsubscribe.month
	left join __tmp_tbl__data_operation operation on basic.month = operation.month
	left join __tmp_tbl__data_member member on basic.month = member.month
	left join __tmp_tbl__data_card_member card on basic.month = card.month
	left join __tmp_tbl__data_buy_member buy on basic.month = buy.month
	left join __tmp_tbl__data_more_member more on basic.month = more.month
	left join __tmp_tbl__data_order orders on basic.month = orders.month;

	###################################


	# 删除临时表
	###################################
	drop temporary table if exists __tmp_tbl__data_monthly;
	drop temporary table if exists __tmp_tbl__data_user_detail;
	drop temporary table if exists __tmp_tbl__data_user;
	drop temporary table if exists __tmp_tbl__data_lbs;
	drop temporary table if exists __tmp_tbl__data_subscribe;
	drop temporary table if exists __tmp_tbl__data_unsubscribe;
	drop temporary table if exists __tmp_tbl__data_operation;
	drop temporary table if exists __tmp_tbl__data_member;
	drop temporary table if exists __tmp_tbl__data_card_member;
	drop temporary table if exists __tmp_tbl__data_buy_member;
	drop temporary table if exists __tmp_tbl__data_more_member;
	drop temporary table if exists __tmp_tbl__data_order;
	###################################
END //; 
DELIMITER ;

