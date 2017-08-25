# 0、修改系统权限菜单的sortno
update sys_right set sort_no= id*10; 


# 1、新增商户设置菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Manage/CustomerConfigs','商户设置','Platform','3','manage/customerconfigs','1',335);
select '11--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Manage/CustomerConfigs',3 ;

select '12--done';

# 2、新增钥匙凭码
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Billings/Keys','钥匙号设置','Billing004','3','billings/keys','1',795);
select '21--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/Keys',3 ;

select '22--done';

# 3、新增“作废的开单”
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Billings/Cancels','作废的开单','Billing001','3','billings/cancels','1',680);
select '31--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/Cancels',3 ;
select '32--done';

# 4、新增“开单折扣”
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,is_menu,sort_no) 
value(now(),'init','Billings/Discount','结算打折','Billing001','3','billings/discount','1',0,690);
select '41--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Billings/Discount',3 ;

select '42--done';

# 删除部分转入到 wx/files/sqls/billings/01_billings_create_tables_scripts.sql

# 6、会员卡充值/消费查询
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Members/RechargeHistory','会员卡充值记录','HYCenter','3','members/rechargehistory','1',482);
select '61--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Members/RechargeHistory',3 ;
select '62--done';

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) 
value(now(),'init','Members/ConsumeHistory','会员卡消费记录','HYCenter','3','members/consumehistory','1',484);
select '63--done';

INSERT into sys_level_right(level_id,right_code,right_levels)
SELECT 7,'Members/ConsumeHistory',3 ;

select '64--done';

# 删除部分转入到 wx/files/sqls/billings/01_billings_create_tables_scripts.sql