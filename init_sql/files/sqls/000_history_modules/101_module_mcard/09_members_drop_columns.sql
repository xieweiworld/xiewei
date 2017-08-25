
# 在会员卡版本稳定后，再考虑删除不需要的字段

# 删除临时索引
ALTER TABLE `member_base` DROP INDEX `idx_member_base_wid_tel_asc`;
ALTER TABLE `member_base` DROP INDEX `idx_member_base_wid_wxid_asc`;
ALTER TABLE `member_giftamount` DROP INDEX `idx_member_giftamount_wid_wxid_asc`;
ALTER TABLE `member_card_chongzhi` DROP INDEX `idx_member_card_chongzhi_mid_card_code_asc`;
ALTER TABLE `member_card` DROP INDEX `idx_member_card_mid_card_code_asc`;

# 删除字段
ALTER TABLE `member_base` 
DROP COLUMN `address`,
DROP COLUMN `carkilometre`,
DROP COLUMN `sale_date`,
DROP COLUMN `order_number`,
DROP COLUMN `identify_number`,
DROP COLUMN `cpai_register`,
DROP COLUMN `last_jieche`,
DROP COLUMN `last_date`,
DROP COLUMN `weixiu_money`,
DROP COLUMN `weixiu_times`,
DROP COLUMN `first_date`,
DROP COLUMN `buy_date`,
DROP COLUMN `danganhao`,
DROP COLUMN `chejia`,
DROP COLUMN `engine`,
DROP COLUMN `next_bylong`,
DROP COLUMN `bylong`,
DROP COLUMN `next_bytime`,
DROP COLUMN `bytime`,
DROP COLUMN `next_bxtime`,
DROP COLUMN `bxtime`,
DROP COLUMN `carclass`,
DROP COLUMN `cartype`,
DROP COLUMN `birthday`,
DROP COLUMN `qq`,
DROP COLUMN `xingge`,
DROP COLUMN `isattention`,
DROP COLUMN `lxtel`;

ALTER TABLE `member_auto` 
DROP COLUMN `order_number`,
DROP COLUMN `identify_number`;

ALTER TABLE `member_card_gift` 
DROP COLUMN `number`;

ALTER TABLE `member_card` 
DROP COLUMN `inte`,
DROP COLUMN `chongzhi`,
DROP COLUMN `name`,
DROP COLUMN `pwd`;

# 删除 原积分数据
# delete from member_card_chongzhi where type in (5,6,7);

ALTER TABLE `member_card_chongzhi` 
# DROP COLUMN `imported`,
DROP COLUMN `product_id`,
DROP COLUMN `pic`,
DROP COLUMN `sn`,
DROP COLUMN `subtype`,
DROP COLUMN `card_code`;

# 删除程序转换数据时用的字段
# ALTER TABLE `member_card_chongzhi` DROP COLUMN `is_shift`;

# 保留type字段,且扩展type定义
ALTER TABLE `member_card_xiaofei` 
# DROP COLUMN `imported`,
DROP COLUMN `service_id`,
DROP COLUMN `card_code`,
DROP COLUMN `code`,
DROP COLUMN `pic`,
DROP COLUMN `sn`;

ALTER TABLE `member_card_level` 
DROP COLUMN `des`;

# 删除 subtype
ALTER TABLE `ai9me_product_card` 
DROP COLUMN `subtype`;


# 输出提示信息
select '09 - finished' as 'status';
