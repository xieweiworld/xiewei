
# 更新部分车型、品牌、车系的字母代码中含 * 字符为正确的字符，或直接替换为空

# select * from sys_car_series where brand_char like '%*%' or series_char like '%*%';

# select * from sys_car_series where brand_code = '97';

# 讴歌
update sys_car_series
set brand_char = replace(brand_char, '*', 'O'),
series_char = replace(series_char, '*', 'O')
where brand_code = '84';


# 阿尔法・罗密欧
update sys_car_series
set brand_char = replace(brand_char, '*', ''),
series_char = replace(series_char, '*', '')
where brand_code = '92';

# 阿斯顿・马丁
update sys_car_series
set brand_char = replace(brand_char, '*', '')
where brand_code = '97';


# 罗孚
update sys_car_series
set brand_char = replace(brand_char, '*', 'F'),
series_char = replace(series_char, '*', 'F')
where brand_code = '101';

# 威麟
update sys_car_series
set brand_char = replace(brand_char, '*', 'L'),
series_char = replace(series_char, '*', 'L')
where brand_code = '140';


# 瑞麒
update sys_car_series
set brand_char = replace(brand_char, '*', 'Q'),
series_char = replace(series_char, '*', 'Q')
where brand_code = '142';

# 广汽传祺
update sys_car_series
set brand_char = replace(brand_char, '*', 'Q'),
series_char = replace(series_char, '*', 'Q')
where brand_code = '147';


# 东风・郑州日产
update sys_car_series
set brand_char = replace(brand_char, '*', ''),
series_char = replace(series_char, '*', 'Q')
where brand_code = '235';


# 上喆汽车
update sys_car_series
set brand_name = '上喆汽车',
brand_char = replace(brand_char, '*', 'Z')
where brand_code = '244';


# 保斐利
update sys_car_series
set brand_char = replace(brand_char, '*', 'F'),
series_char = replace(series_char, '*', 'F')
where brand_code = '184';

# 乔治・巴顿
update sys_car_series
set brand_char = replace(brand_char, '*', ''),
series_char = replace(series_char, '*', '')
where brand_code = '226';


# 赛麟SALEEN
update sys_car_series
set brand_char = replace(brand_char, '*', 'L'),
series_char = replace(series_char, '*', 'L')
where brand_code = '239';

# 潍柴欧睿
update sys_car_series
set brand_char = replace(brand_char, '*', 'R'),
series_char = replace(series_char, '*', 'R')
where brand_code = '247';

# 奔驰
update sys_car_series
set series_char = replace(series_char, '*', 'T')
where brand_code = '2';

# 标致
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '5';

# 丰田
update sys_car_series
set series_char = replace(series_char, '*', 'X')
where brand_code = '7';

# 大众
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '8';

# 斯柯达
update sys_car_series
set series_char = replace(series_char, '*', 'X')
where brand_code = '10';

# 现代
update sys_car_series
set series_char = replace(series_char, '*', 'Y')
where brand_code = '13';

# 铃木
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '16';

# 福特
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '17' and series_code != 'n3866';
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '17' and series_code = 'n3866';

# 马自达
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '18' and series_char != 'n2566' and series_char != 'n2944';
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '18' and (series_char = 'n2566' or series_char = 'n2944');

# 沃尔沃
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '19';

# 长城
update sys_car_series
set series_char = replace(series_char, '*', 'X')
where brand_code = '21';

# 三菱
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '25';

# 本田
update sys_car_series
set series_char = replace(series_char, '*', 'B')
where brand_code = '26';

# 本田
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '28';

# 日产
update sys_car_series
set series_char = replace(series_char, '*', 'L')
where brand_code = '30' and series_code = 'n1679';

update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '30' and series_code = 'n1698';

update sys_car_series
set series_char = replace(series_char, '*', 'L')
where brand_code = '30' and series_code = 'n2409';

update sys_car_series
set series_char = replace(series_char, '*', 'X')
where brand_code = '30' and series_code = 'n2190';





# 哈飞
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '31';

# 奇瑞
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '42';

# 一汽
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '53';


# 中华
update sys_car_series
set series_char = replace(series_char, '*', 'T')
where brand_code = '60';

# 广汽吉奥
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '63';

# 福迪
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '67';

# 福迪
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '67';

# 宝龙
update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '68';

# 新凯
update sys_car_series
set series_char = replace(series_char, '*', 'T')
where brand_code = '71';

# 劳斯莱斯
update sys_car_series
set series_char = replace(series_char, '*', 'M')
where brand_code = '80' and series_code = 'n3884';
update sys_car_series
set series_char = replace(series_char, '*', 'Y')
where brand_code = '80' and series_code = 'n4634';

# 兰博基尼
update sys_car_series
set series_char = replace(series_char, '**', 'BF')
where brand_code = '86';

# 西雅特
update sys_car_series
set series_char = replace(series_char, '*', 'S')
where brand_code = '87';

# 林肯
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '95';

# 雷诺
update sys_car_series
set series_char = replace(series_char, '*', 'B')
where brand_code = '99';

# 斯巴鲁
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '111';

# 道奇
update sys_car_series
set series_char = replace(series_char, '*', 'K')
where brand_code = '113';

# 福田
update sys_car_series
set series_char = replace(series_char, '*', 'J')
where brand_code = '128';

# 昌河
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '129';

# 长安轿车
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '129';

# 长安商用
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '159' and series_code = 'n4728';
update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '159' and series_code = 'n4729';
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '159' and series_code = 'n4054';
update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '159' and series_code = 'n3823';


# 猎豹汽车
update sys_car_series
set series_char = replace(series_char, '**', 'QL')
where brand_code = '153';
update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '153';

# 长安商用
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '159';

# 长安轿车
update sys_car_series
set series_char = replace(series_char, '*', 'R')
where brand_code = '136';

# 特斯拉
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '189';

# 飞驰商务车
update sys_car_series
set series_char = replace(series_char, '*', 'T')
where brand_code = '199';

# 蓝海房车
update sys_car_series
set series_char = replace(series_char, '*', 'T')
where brand_code = '200';

# 蓝海房车
update sys_car_series
set series_char = replace(series_char, '*', '')
where brand_code = '205';

# 江铃集团轻汽
update sys_car_series
set series_char = replace(series_char, '*', 'Q')
where brand_code = '224';


# 输出提示信息
select '04(update) - finished' as 'status';
