# 初始化默认的商户配置表信息

# 2017-06-05 重新整理本数据表，可以重新生成

# 默认的 sys_car_colors 权限数据
truncate table sys_car_colors;

# 初始化车辆颜色系统定义数据
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('白色', 'BaiSe', 'BS', 'White', '#FBF7F7', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('银色', 'YinSe', 'YS', 'Silver', '#C0C0C0', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('灰色', 'HuiSe', 'HS', 'Gray', '#808080', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('黑色', 'HeiSe', 'HS', 'Black', '#000000', 0, '2017-06-15 18:00:01', 'init');

insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('棕色', 'ZongSe', 'ZS', 'Brown', '#A52A2A', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('黄色', 'HuangSe', 'HS', 'Yellow', '#FFFF00', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('橙色', 'ChengSe', 'CS', 'Orange', '#FFA500', 1, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('金色', 'JinSe', 'JS', 'Gold', '#FFD700', 0, '2017-06-15 18:00:01', 'init');
	
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('蓝色', 'LanSe', 'LS', 'Blue', '#0000FF', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('绿色', 'LvSe', 'LS', 'Green', '#008000', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('紫色', 'ZiSe', 'ZS', 'Purple', '#800080', 0, '2017-06-15 18:00:01', 'init');
insert into sys_car_colors(name, pinyin, chars, code, hex16, is_delete, add_date, add_by) value('红色', 'HongSe', 'HS', 'Red', '#FF0000', 0, '2017-06-15 18:00:01', 'init');

select * from sys_car_colors;

select 'Re-init Data' as 'Title', 'sys_car_colors' as 'Table', 'Done' as 'Status';
