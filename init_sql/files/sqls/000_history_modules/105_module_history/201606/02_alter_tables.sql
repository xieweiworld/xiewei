# 修改表结构的sql定义，存放在此文件中

# publishing
# 审核客户服务
ALTER TABLE `user_agency` ADD COLUMN `need_audit_service` TINYINT NULL DEFAULT 0 COMMENT '审核客户服务:1:需要审核,0不需审核';
# publishing

#6.12维修进程改版
ALTER TABLE repair_process change column state state int(11) DEFAULT '0' COMMENT '0进行中,1已完成,-1已删除';
ALTER TABLE repair_process add column pid int(11) DEFAULT NULL COMMENT '所属进度id';
ALTER TABLE repair_process add column repair_leader varchar(32) DEFAULT NULL COMMENT '负责人';
ALTER TABLE repair_process add column address varchar(128) DEFAULT NULL COMMENT '门店地址';
#6.12维修进程改版

#6.17投票活动改进
ALTER TABLE `vote_platforms` 
CHANGE COLUMN `start_at` `start_at` DATETIME NULL DEFAULT NULL COMMENT '开始时间' ,
CHANGE COLUMN `end_at` `end_at` DATETIME NULL DEFAULT NULL COMMENT '结束时间' ,
CHANGE COLUMN `created_at` `created_at` DATETIME NULL DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `vote_platforms` 
ADD COLUMN `page_bg_color` VARCHAR(50) NULL DEFAULT NULL COMMENT '微信端页面整体背景色',
ADD COLUMN `page_main_color` VARCHAR(50) NULL DEFAULT NULL COMMENT '微信端投票数字颜色、按钮可用时背景色',
ADD COLUMN `page_remark_bg_color` VARCHAR(50) NULL DEFAULT NULL COMMENT '备注内容的背景色',
ADD COLUMN `page_thank_color` VARCHAR(50) NULL DEFAULT NULL COMMENT '谢谢参与文字颜色',
ADD COLUMN `page_notice_text` VARCHAR(50) NULL DEFAULT NULL COMMENT '活动首页公告文字',
ADD COLUMN `page_notice_color` VARCHAR(50) NULL DEFAULT NULL COMMENT '首页公告文字颜色' ;

ALTER TABLE `vote_users` 
CHANGE COLUMN `votes` `votes` INT(11) NULL DEFAULT NULL COMMENT '门店会员投票数(冗余)' ,
CHANGE COLUMN `created_at` `created_at` DATETIME NULL DEFAULT NULL COMMENT '创建时间' ;

ALTER TABLE `vote_members` 
ADD COLUMN `voted_at` DATETIME NULL DEFAULT NULL COMMENT '投票时间';

ALTER TABLE `vote_members` 
CHANGE COLUMN `vid` `vid` INT(11) NULL DEFAULT NULL COMMENT '投票活动号' ,
CHANGE COLUMN `wid` `wid` INT(11) NULL DEFAULT NULL COMMENT '商户号wid' ,
CHANGE COLUMN `wxid` `wxid` VARCHAR(64) NULL DEFAULT NULL COMMENT '平台wxid' ,
CHANGE COLUMN `created_at` `created_at` DATE NULL DEFAULT NULL COMMENT '投票日期';
#6.17投票活动改进

#0627
# 添加会员所属短信分组
ALTER TABLE `member_base` 
ADD COLUMN `sms_groups` varchar(200) NULL DEFAULT NULL COMMENT '会员所属分组名,逗号分隔及结尾';
#0627

