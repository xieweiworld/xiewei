
############################
####### 列转行经典用法 #######
############################


############## 一、中转数字表
# 创建中转数字表
drop table if exists __cross__join__digits__;
create table __cross__join__digits__(digit int(1));
# 往数字表中填充数据
insert into __cross__join__digits__(digit) values(0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

############## 二、中转序列表
# 创建中转序列表
drop table if exists __cross__join__sequences__;
CREATE TABLE __cross__join__sequences__ (sequence INT(3));
# 往序列表中填充数据: 0=>99 (因为上面最大数字为9，也可以更大，不般不必要，逗号分隔会达到 100 个？)
INSERT INTO __cross__join__sequences__ (
    SELECT distinct (D1.digit + D2.digit * 10) as sequence
    FROM __cross__join__digits__ D1 CROSS JOIN __cross__join__digits__ D2
);

############## 三、查询中转表
# 查询序列数据
select * from __cross__join__digits__;
select * from __cross__join__sequences__;


############## 四、使用示例应用到正式业务中
select '请参考示例' as TITLE, '进行SQL调整' as 'TASK';

/*


############## 以下为关键点
# 1、得到多少个逗号(,)分隔的值: LENGTH 灵活用法
# SELECT (LENGTH('AB,DE,FE,AD,FD') - LENGTH(REPLACE('AB,DE,FE,AD,FD', ',', '')) + 1) as 'values';
# 2、依次取出每项值: SUBSTRING_INDEX 灵活用法
# SUBSTRING_INDEX 正序、倒序


############## 以下为示例效果
# 创建临时表
DROP TABLE IF EXISTS `__comma__separated__strings__`;
CREATE TABLE IF NOT EXISTS `__comma__separated__strings__` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `strings` varchar(50) NOT NULL DEFAULT '' COMMENT '英文逗号分隔数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
# 写入临时表数据
INSERT INTO __comma__separated__strings__(strings) VALUES ('A'), ('B,CC,DD'), ('E'), ('FF,GG'), ('H');

# 得到相应的数据
SELECT
    t.id,
    SUBSTRING_INDEX(
		SUBSTRING_INDEX(t.strings, ',', s.sequence),
        ',' , -1) as 'value',
    s.sequence
FROM __cross__join__sequences__ s CROSS JOIN __comma__separated__strings__ t
WHERE
	s.sequence BETWEEN 1 AND (SELECT LENGTH(t.strings) - LENGTH(REPLACE(t.strings, ',', '')) + 1) 
	# 可加入t表其他条件
ORDER BY t.id
;

# 删除临时表
DROP TABLE IF EXISTS `__comma__separated__strings__`;


*/

