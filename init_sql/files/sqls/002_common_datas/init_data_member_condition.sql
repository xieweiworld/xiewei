# 初始化默认的商户会员条件表信息

# 2017-06-27

set @wid = 0;  # 0表示是平台默认的数据

delete from member_condition where wid = @wid;

INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 1, 1, 1, '购买储值卡单次实付满额自动成为会员', now(), 'init');
INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 2, 1, 1, '购买次卡单次实付满额自动成为会员', now(), 'init');
INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 3, 1, 1, '购买年卡单次实付满额自动成为会员', now(), 'init');
INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 4, 1, 1, '购买套餐卡单次实付满额自动成为会员', now(), 'init');

INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 5, 1, 1, '维修开单单次消费实付满额自动成为会员', now(), 'init');
INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 6, 1, 0, '美容开单单次消费实付满额自动成为会员', now(), 'init');
# INSERT INTO member_condition(`wid`, `type`, `amount`, `is_enable`, `remark`, `add_date`, `add_by`) value(@wid, 7, 1, 0, '微信端绑定后自动成为会员', now(), 'init');

select * from member_condition where wid = @wid;

select 'Re-init Data' as 'Title', @wid as 'WID', 'member_condition' as 'Table', 'Done' as 'Status';

# 2017-06-27
