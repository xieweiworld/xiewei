# 调整数据

# 单次升级的过程中，不要重复运行此文件，以避免重复充值，默认已关闭充值操作

# 2017-05-10

# 香蜜湖支公司：(wid=1142, lbsid=3547, price=17450)
set @wid = 1142;
set @lbsid = 3547;
set @prices = 17450;

set @start_time = '2017-05-03 11:38:00';

# 1、添加一条香蜜湖支公司的充值记录
################ 不要重复运行 ################
call __proc__chinalife_agency_credit_recharge(@wid, @lbsid, @prices);
################ 不要重复运行 ################

# 2、将以下表创建时间从 2017-05-03 11:38:00 之后导入的积分记录的 is_branch 设置为 1
#### chinalife_car_credit
#### chinalife_credit_history
update chinalife_car_credit set is_branch = 1 where is_branch = 0 and wid = @wid and lbsid = @lbsid and add_date >= @start_time;
update chinalife_credit_history set is_branch = 1 where is_branch = 0 and wid = @wid and lbsid = @lbsid and add_date >= @start_time;

# 3、更新该 chinalife_agency_creditlimit 表中香蜜湖支公司的可用额度
################ 不建议重复运行 ################
set @used_credits = ifnull((select sum(total_credit) as credits from chinalife_car_credit where wid = @wid and lbsid = @lbsid and is_branch = 1 and add_date >= @start_time), 0);
update chinalife_agency_creditlimit
set use_credits = total_credits - @used_credits
where wid = @wid and lbsid = @lbsid;
################ 不建议复运行 ################

# 2017-05-10

select '04_init_data Finished' as 'DONE';
