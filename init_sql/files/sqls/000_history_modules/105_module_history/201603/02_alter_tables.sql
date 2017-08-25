#修改表结构的sql定义，存放在此文件中

#平台活动添加区域
alter table platform_activities add column areaid int(11) DEFAULT '0' COMMENT '0所有地区，否则为城市';

#服务添加创建时间
alter table fuwulist add column created_at datetime DEFAULT NULL;