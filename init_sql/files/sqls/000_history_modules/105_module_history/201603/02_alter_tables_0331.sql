#修改表结构的sql定义，存放在此文件中 

#2016-03-31 国寿及预约发布
#维修进度表	
alter table repair_process add column estimate_finish datetime DEFAULT NULL;

#国寿抢购积分
alter table dsqgrecord add column actual_credits int(11) DEFAULT '0' COMMENT '国寿实际支付的积分';