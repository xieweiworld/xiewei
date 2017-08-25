# 修改表结构的sql定义，存放在此文件中

##############  不建议反复执行本脚本   ##############

# 2017-03-11

# 初始化接收人绑定通知的code
update customer_receiver_template rt
inner join customer_weixin_template wt on /*rt.wid = wt.wid and*/ rt.tid = wt.id
set rt.code = wt.code
where rt.code = '' or rt.code is null;

# 删除商户模版，wid != send_wid 的， 未认证商户，不再生成send_wid为平台的商户模版数据
update customer_weixin_template
set is_enable = 0, is_delete = 1, wid = -wid, send_wid = -send_wid
where
wid > 0
and is_enable = 1
and is_delete = 0
and wid != send_wid 
and wid not in (0, 211, 689); # 此为正式平台
#and wid not in (0, 127, 370); # 此为测试平台

# 补上一次脚本未将wid设置为负数
update customer_weixin_template
set wid = -wid, send_wid = -send_wid
where wid > 0 and wid != send_wid
and wid not in (0, 211, 689); # 此为正式平台
#and wid not in (0, 127, 370); # 此为测试平台

# 2017-03-11

# 2017-03-22

# 商户微信通知查版数据表(customer_weixin_template)，删除wid字段，保留send_wid字段
# rename: id => tid
ALTER TABLE `customer_weixin_template` 
CHANGE COLUMN `id` `tid` INT(11) NOT NULL AUTO_INCREMENT ;
# drop & add pk
ALTER TABLE `customer_weixin_template` 
DROP COLUMN `tid`,
DROP COLUMN `wid`,
DROP PRIMARY KEY,
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT COMMENT '自增id' FIRST,
ADD PRIMARY KEY (`id`);


# 将商户接收人数据表(customer_receiver_template)的tid删除
ALTER TABLE `customer_receiver_template` DROP COLUMN `tid`;

# 将该表中的 send_wid < 0 的数据删除
# delete from customer_weixin_template where send_wid < 0;

select '02_update_datas_wxcode Finished' as 'DONE';
