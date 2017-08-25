
# 车主关怀按项目服务提醒2次后未到店继续该项目服务的会员列表

CREATE OR REPLACE VIEW `vw_unarrived_members` AS

select t.wid, mobile, sex, name, cpai, m.id as mid 
from tmp_unarrived_members t
inner join member_base m
on t.wid = m.wid
and t.mobile = m.tel;
