
# 根据短信记录获取提醒超过两次的商户手机用户数据

CREATE OR REPLACE VIEW `tmp_unarrived_members` AS

select wid, mobile, count(id) as total
from sms_events
where biz_type = 5 and is_valid = 0 and is_sent = 1 and sent_at is not null
group by wid, mobile
having total > 1;

