# 修改表结构的sql定义，存放在此文件中

# 5.25fuwulist
ALTER TABLE fuwulist change column status status tinyint(4) DEFAULT '1' COMMENT '0：未审核，1：正在审核，2:审核不通过，3：审核通过';
# 5.25

# pubs表加入jsapi_ticket信息存储
ALTER TABLE pubs add column jsapiticket text COMMENT 'jsapi_ticket';
ALTER TABLE pubs add column ticket_time int(11) DEFAULT NULL COMMENT 'jsapi_ticket有效期';

# redpack_set表加入卡包信息存储
ALTER TABLE redpack_set add column couponinfo text COMMENT '赠送卡券(卡包)信息';

ALTER TABLE ai9me_pay_set change column showid showid int(11) DEFAULT NULL COMMENT '页面显示支付方式排序';

ALTER TABLE lbs ADD COLUMN `ord` INT NULL DEFAULT 0 COMMENT '排序越大越靠前';
