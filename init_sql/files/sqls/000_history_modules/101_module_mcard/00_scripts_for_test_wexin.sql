
################## 请不要执行本脚本 ##################

# 测试库中被错误的添加了字段 或 与正式库中字段不一致

/*

use test_weixin;

# 缺少字段在测试库
ALTER TABLE `member_card_xiaofei` 
ADD COLUMN `imported` int DEFAULT '0',
ADD COLUMN `amount` DECIMAL(8,2) NULL DEFAULT 0 COMMENT '消费金额或次数';

# 缺少字段在测试库
ALTER TABLE `member_base` 
ADD COLUMN `isattention` tinyint DEFAULT '0' COMMENT '0:未关注，1:已关注';

# 缺少字段在测试库
ALTER TABLE `member_card_chongzhi` 
ADD COLUMN `imported` int DEFAULT '0';

# 误加字段在测试库
ALTER TABLE `member_card_xiaofei` 
DROP COLUMN `add_date`,
DROP COLUMN `add_by`,
DROP COLUMN `update_date`,
DROP COLUMN `update_by`;


# 未发布在正式库
ALTER TABLE `member_card_libao_record`
DROP COLUMN `mid`;


# 未发布在正式库
ALTER TABLE `ai9me_product_cart` 
DROP COLUMN `introducer`;


# 误加字段在测试库
ALTER TABLE `ai9me_product_gift` 
DROP COLUMN `is_limit_car`;

*/
