# 初始化微信推送通知数据，初始化默认商户(wid=0, 211)给定的模版：收款成功通知 (OPENTM405544716)

# 2017-03-06  -  可以反复执行，不会添加重复模版

##### 注意wid,send_wid的各类值：

###################################################################################
###################  以下为正式平台初始化数据 #########################################
###################################################################################

# 1、将收款成功通知的数据初始化到平台(wid = 0, send_wid = 211)
set @wid = 0; set @send_wid = 211;
set @tcode = 'OPENTM405544716', @template_id = 'SszJJDZt2UlWmi6_K9pI26-7oplr1lBl1nobYGIOi_Q';
insert into customer_weixin_template(wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select t.wid, t.send_wid, t.type, t.code, t.title, t.post_data, t.template_id, t.is_enable, t.is_delete, t.add_date, t.add_by
from
(select @wid as wid, @send_wid as send_wid, 1 as type, @tcode as code, '收款成功通知' as title, 
'{{first.DATA}}
收款商户：{{keyword1.DATA}}
收款金额：{{keyword2.DATA}}
收款时间：{{keyword3.DATA}}
{{remark.DATA}}' as post_data, @template_id as template_id, 1 as is_enable, 0 as is_delete, '2017-03-06 15:45:01' as add_date, 'init' as add_by) t
left join customer_weixin_template st on t.wid = st.wid and t.code  = st.code
where t.code = @tcode and st.id is null; # 防止重复写入同一模版数据


# 2、将收款成功通知的数据初始化到平台(wid = 211, send_wid = 211) # 短信费用收款
set @wid = 211; set @send_wid = 211;
set @tcode = 'OPENTM405544716', @template_id = 'SszJJDZt2UlWmi6_K9pI26-7oplr1lBl1nobYGIOi_Q';
insert into customer_weixin_template(wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select t.wid, t.send_wid, t.type, t.code, t.title, t.post_data, t.template_id, t.is_enable, t.is_delete, t.add_date, t.add_by
from
(select @wid as wid, @send_wid as send_wid, 1 as type, @tcode as code, '收款成功通知' as title, 
'{{first.DATA}}
收款商户：{{keyword1.DATA}}
收款金额：{{keyword2.DATA}}
收款时间：{{keyword3.DATA}}
{{remark.DATA}}' as post_data, @template_id as template_id, 1 as is_enable, 0 as is_delete, '2017-03-06 15:45:01' as add_date, 'init' as add_by) t
left join customer_weixin_template st on t.wid = st.wid and t.code  = st.code
where t.code = @tcode and st.id is null; # 防止重复写入同一模版数据


###################################################################################
###################  以下为测试平台初始化数据 #########################################
###################################################################################
/*

# 1、将收款成功通知的数据初始化到平台(wid = 0, send_wid = 127)
set @wid = 0; set @send_wid = 127;
set @tcode = 'OPENTM405544716', @template_id = 'Qq3vpEHAV4ccyqTeYfm2sYINfe7p3XgZUYdm5hOOmzo';
insert into customer_weixin_template(wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select @wid as wid, @send_wid as send_wid, 1 as type, 'OPENTM405544716' as code, '收款成功通知' as title, 
'{{first.DATA}}
收款商户：{{keyword1.DATA}}
收款金额：{{keyword2.DATA}}
收款时间：{{keyword3.DATA}}
{{remark.DATA}}' as post_data, 'Qq3vpEHAV4ccyqTeYfm2sYINfe7p3XgZUYdm5hOOmzo' as template_id, 1 as is_enable, 0 as is_delete, '2017-03-06 15:45:01' as add_date, 'abc' as add_by
;

# 2、将收款成功通知的数据初始化到平台(wid = 127, send_wid = 127) # 短信费用收款
set @wid = 127; set @send_wid = 127;
set @tcode = 'OPENTM405544716', @template_id = 'Qq3vpEHAV4ccyqTeYfm2sYINfe7p3XgZUYdm5hOOmzo';
insert into customer_weixin_template(wid, send_wid, type, code, title, post_data, template_id, is_enable, is_delete, add_date, add_by)
select t.wid, t.send_wid, t.type, t.code, t.title, t.post_data, t.template_id, t.is_enable, t.is_delete, t.add_date, t.add_by
from
(select @wid as wid, @send_wid as send_wid, 1 as type, @tcode as code, '收款成功通知' as title, 
'{{first.DATA}}
收款商户：{{keyword1.DATA}}
收款金额：{{keyword2.DATA}}
收款时间：{{keyword3.DATA}}
{{remark.DATA}}' as post_data, @template_id as template_id, 1 as is_enable, 0 as is_delete, '2017-03-06 15:45:01' as add_date, 'init' as add_by) t
left join customer_weixin_template st on t.wid = st.wid and t.code  = st.code
where t.code = @tcode and st.id is null; # 防止重复写入同一模版数据


*/

select '10_init_defaults_OPENTM405544716 Finished' as 'DONE';

# 2017-03-06
