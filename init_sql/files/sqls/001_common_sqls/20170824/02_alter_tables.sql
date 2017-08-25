# 修改表结构的sql定义，存放在此文件中
# 注明时间、功能描述、分隔线

/*
################################# START - 2017-08-18
########### 商城核销门店优化
################################# END   - 2017-08-18
*/

# 会员卡消费表：添加 status
ALTER TABLE `member_card_xiaofei` ADD COLUMN `status` INT NULL DEFAULT 1 COMMENT '消费状态:1已生效,0未生效' AFTER `type`;

select '02' as 'Index', 'Alter Tables' as 'Title', 'Done' as 'Status';
