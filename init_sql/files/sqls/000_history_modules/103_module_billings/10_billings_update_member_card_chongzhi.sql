# 将余额转存的数据字段初始化下数据

# 2016-12-14

# 设置 type=1, is_cleared=1
update member_card_chongzhi
set is_cleared = 1, type = 1
where source = 23 and is_cleared = 0 and type is null;

# 设置 card_id 设置为会员的第一张储值卡,因若会员存在，是不能使用余额转存功能的
update member_card_chongzhi c inner join
(select cz.id, c.mid, cz.card_id, c.wid, min(c.id) as cardid from member_card_chongzhi cz inner join member_card c on cz.wid = c.wid and cz.mid = c.mid
where cz.source = 23 and cz.card_id is null
group by c.mid,c.wid) t on c.wid = t.wid and c.mid = t.mid
inner join member_card d on c.wid = d.wid and c.mid = d.mid and t.cardid = d.id
set c.card_id = t.cardid, c.card_code = d.card_code
where c.source = 23 and c.card_id is null;

select '10-DONE';