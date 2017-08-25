# 初始化微信推送通知数据，初始化给定的模版的商户接收者：收款成功通知 (OPENTM405544716)

# 0、前提条件，需要通过平台功能中的初始单个微信通知模版的功能，将现有设置过有微信模版通知的商户先初始化此通知后，再执行此脚本

# 2017-03-06  -  可以反复执行

# 1、复制‘新订单提醒’的接收者，做为此通知的接收者
set @tcode = 'OPENTM405544716';
insert into customer_receiver_template(wid, rid, tid)
select t1.wid, t1.rid, t1.tid
#, t2.id
from
(select rt.wid, rt.rid, wt.id as tid
from customer_receiver_template rt 
inner join customer_weixin_template wt
on rt.wid = wt.wid
where rt.tid = 4 and wt.code = @tcode) t1
left join customer_receiver_template t2 on t1.wid = t2.wid and t1.rid = t2.rid and t1.tid = t2.tid
where t2.id is null;  # 防止重复写入该横版的该通知的绑定信息


select '11_init_receiver_OPENTM405544716 Finished' as 'DONE';

# 2017-03-06
