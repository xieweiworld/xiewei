
####### 些脚本文件为分析数据的脚本，用到三个表： sys_car_series, new_car_series（要加上id列，且多了最后一列 f15 字段）, final_car_series（最后会删除字段：id, f15），三个表主要字段顺序保持一致

#######  可将原表数据导了后，再导入到测试环境中后，再进行分析操作
#######  最后导出新数据sql后，再在正式环境中执行

#######  先将车型库的excel文件数据，导入到表 new_car_series 中后进行分析

select * from sys_car_series;
select * from new_car_series;

/*
ALTER TABLE `sys_car_series`  ADD INDEX `idx_sys_car_series_model_code` USING BTREE (`model_code` ASC);
ALTER TABLE `new_car_series`  ADD INDEX `idx_sys_car_series_model_code` USING BTREE (`model_code` ASC);


ALTER TABLE `sys_car_series`  ADD INDEX `idx_sys_car_series_brand_code` USING BTREE (`brand_code` ASC);
ALTER TABLE `sys_car_series`  ADD INDEX `idx_sys_car_series_series_code` USING BTREE (`series_code` ASC);
*/


# brand_series is null
select * from sys_car_series where brand_series is null;
select * from sys_car_series where model_name is null;

select distinct brand_code, series_code, model_code from sys_car_series;
select distinct brand_code, series_code, model_code from new_car_series;

/*
# 1 将 brand_code, series_code, model_code 无重复的标记 不删除
update new_car_series n
inner join (
select brand_code, series_code, model_code, count(id) as total, min(id) as min_id
from `new_car_series`
group by brand_code, series_code, model_code
having total = 1
) t on n.id = t.min_id
set f15 = 0
where f15 is null;
# 2 将 brand_code, series_code, model_code 有重复的标记保留最小的ID
update new_car_series n
inner join (
select brand_code, series_code, model_code, count(id) as total, min(id) as min_id
from `new_car_series`
group by brand_code, series_code, model_code
having total > 1
) t on n.id = t.min_id
set f15 = 0
where f15 is null;

# 3 将剩下的标记为删除
update new_car_series
set f15 = 1
where f15 is null;

# 4 只查未标记为删除的
create table if not exists final_car_series
select 
n.*
# n.id, s.id, n.brand_name, n.brand_series, n.series_name, n.model_name, n.model_code, s.brand_name, s.brand_series, s.series_name, s.model_name, s.model_code
from
new_car_series n left join sys_car_series s on n.model_code = s.model_code and n.brand_code = s.brand_code and n.series_code = s.series_code
where n.f15 = 0 and s.id is null;
*/

# 最终的总数量
select * from final_car_series;

# 无重复的了
select brand_code, series_code, model_code, count(id) as total, min(id) as min_id
from final_car_series
group by brand_code, series_code, model_code
having total > 1;

# 5 更新*为相应的值
select  id, brand_code, brand_name, brand_char from sys_car_series where brand_char like '%*%';
select  id, brand_code, brand_name, series_name, series_code, series_char from sys_car_series where series_char like '%*%';

select  brand_code, brand_name, brand_char from final_car_series where brand_char like '%*%';
select  brand_code, brand_name, series_name, series_code, series_char from final_car_series where series_char like '%*%';

# 更新 brand_char
#  update final_car_series set brand_char = replace(brand_char, '*', '<>') where brand_code = '<>';
# 先生成更新sql
select distinct
concat("update final_car_series set brand_char = replace(brand_char, '*', '", brand_name, "') where brand_code = '", brand_code, "';") as sqls,
'TTTTTTTTTTTT' as separate, brand_char, brand_code, brand_name
from final_car_series where brand_char like '%*%';
###   =======>
/*
update final_car_series set brand_char = replace(brand_char, '*', 'O') where brand_code = '84';
update final_car_series set brand_char = replace(brand_char, '*', '') where brand_code = '92';
update final_car_series set brand_char = replace(brand_char, '*', '') where brand_code = '97';
update final_car_series set brand_char = replace(brand_char, '*', 'L') where brand_code = '140';
update final_car_series set brand_char = replace(brand_char, '*', 'Q') where brand_code = '142';
update final_car_series set brand_char = replace(brand_char, '*', 'Q') where brand_code = '147';
update final_car_series set brand_char = replace(brand_char, '*', '') where brand_code = '226';
*/

# 更新 series_char
#   update final_car_series set series_char = replace(series_char, '*', '<>') where brand_code = '<>' and series_code = '<>';
# 先生成更新sql
select distinct concat("update final_car_series set series_char = replace(series_char, '*', '", series_name, "-----", series_char, "') where brand_code = '", brand_code, "' and series_code = '", series_code, "';") as sqls,
'TTTTTTTTTTTT' as separate, series_char, brand_code, brand_name, series_name, series_code
from final_car_series where series_char like '%*%';
###   =======>
/*
update final_car_series set series_char = replace(series_char, '*', 'T') where brand_code = '2' and series_code = 'n3038';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '5' and series_code = 'n3396';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '7' and series_code = 'n4016';
update final_car_series set series_char = replace(series_char, '*', 'H') where brand_code = '10' and series_code = 'n2674';
update final_car_series set series_char = replace(series_char, '*', 'H') where brand_code = '10' and series_code = 'n3885';
update final_car_series set series_char = replace(series_char, '*', 'Y') where brand_code = '13' and series_code = 'n4151';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '16' and series_code = 'n5081';
update final_car_series set series_char = replace(series_char, '*', 'H') where brand_code = '17' and series_code = 'n3924';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '17' and series_code = 'n4528';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '18' and series_code = 'n3514';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '18' and series_code = 'n3963';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '19' and series_code = 'n4703';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '19' and series_code = 'n4737';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '21' and series_code = 'n2587';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '21' and series_code = 'n2857';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '25' and series_code = 'n3686';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '25' and series_code = 'n3102';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '26' and series_code = 'n2780';
update final_car_series set series_char = replace(series_char, '*', 'B') where brand_code = '26' and series_code = 'n4117';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '27' and series_code = 'n2679';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '27' and series_code = 'n2678';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '28' and series_code = 'n4041';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '30' and series_code = 'n2190';
update final_car_series set series_char = replace(series_char, '*', 'L') where brand_code = '30' and series_code = 'n2409';
update final_car_series set series_char = replace(series_char, '*', 'L') where brand_code = '30' and series_code = 'n2795';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '30' and series_code = 'n2696';
update final_car_series set series_char = replace(series_char, '*', 'X') where brand_code = '36' and series_code = 'n4945';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '42' and series_code = 'n4981';
update final_car_series set series_char = replace(series_char, '*', 'A') where brand_code = '42' and series_code = 'n4514';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '53' and series_code = 'n4084';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '63' and series_code = 'n2226';
update final_car_series set series_char = replace(series_char, '*', 'T') where brand_code = '71' and series_code = 'n3952';
update final_car_series set series_char = replace(series_char, '*', 'O') where brand_code = '84' and series_code = 'n4780';
update final_car_series set series_char = replace(series_char, '*', 'O') where brand_code = '84' and series_code = 'n2358';
update final_car_series set series_char = replace(series_char, '*', 'O') where brand_code = '84' and series_code = 'n3723';
update final_car_series set series_char = replace(series_char, '*', 'O') where brand_code = '84' and series_code = 'n2360';
update final_car_series set series_char = replace(series_char, '*', 'O') where brand_code = '84' and series_code = 'n2359';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '92' and series_code = 'n4598';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '92' and series_code = 'n4985';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '92' and series_code = 'n2127';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '92' and series_code = 'n2128';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '92' and series_code = 'n2129';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n4765';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n2974';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n2140';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n2720';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n2736';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n2620';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n3415';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n3558';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '97' and series_code = 'n3538';
update final_car_series set series_char = replace(series_char, '*', 'J') where brand_code = '128' and series_code = 'n4716';
update final_car_series set series_char = replace(series_char, '*', 'J') where brand_code = '128' and series_code = 'n4934';
update final_car_series set series_char = replace(series_char, '*', 'J') where brand_code = '128' and series_code = 'n4393';
update final_car_series set series_char = replace(series_char, '*', 'J') where brand_code = '128' and series_code = 'n4563';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '129' and series_code = 'n4336';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '129' and series_code = 'n2595';
update final_car_series set series_char = replace(series_char, '*', 'L') where brand_code = '140' and series_code = 'n2687';
update final_car_series set series_char = replace(series_char, '*', 'L') where brand_code = '140' and series_code = 'n2828';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n2843';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n2700';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n3106';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n2688';
update final_car_series set series_char = replace(series_char, '*', 'L') where brand_code = '142' and series_code = 'n3147';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n2192';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '142' and series_code = 'n3264';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4418';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4766';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4479';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4281';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4325';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '147' and series_code = 'n4903';
update final_car_series set series_char = replace(series_char, '*', 'QL') where brand_code = '153' and series_code = 'n2506';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '153' and series_code = 'n2284';
update final_car_series set series_char = replace(series_char, '*', 'QL') where brand_code = '153' and series_code = 'n2499';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '155' and series_code = 'n5052';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '159' and series_code = 'n4909';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '159' and series_code = 'n3823';
update final_car_series set series_char = replace(series_char, '*', 'R') where brand_code = '159' and series_code = 'n5088';
update final_car_series set series_char = replace(series_char, '*', 'T') where brand_code = '214' and series_code = 'n5101';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '224' and series_code = 'n4604';
update final_car_series set series_char = replace(series_char, '*', 'Q') where brand_code = '224' and series_code = 'n4339';
update final_car_series set series_char = replace(series_char, '*', '') where brand_code = '226' and series_code = 'n4361';
update final_car_series set series_char = replace(series_char, '*', 'P') where brand_code = '274' and series_code = 'n5059';
update final_car_series set series_char = replace(series_char, '*', 'P') where brand_code = '274' and series_code = 'n5061';
*/

# 导出 final_car_series 数据至系统表 sys_car_series 中 
alter table final_car_series drop column id, drop column f15;
select * from final_car_series;

# 最后，通过 Navicat for MySql 导致 final_car_series 数据，带列标题的，且要替换掉导出文件中的 final_car_series 为 sys_car_series 即可，运行该 sql 文件了。