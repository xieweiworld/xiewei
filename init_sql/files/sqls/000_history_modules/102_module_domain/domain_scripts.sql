# 修改域名相关的scripts定义, 可以反复执行此文件

# 1.商户自动配置微信参数
CREATE TABLE IF NOT EXISTS `wx_mp_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT 0 COMMENT '所属商户',
  `is_update` int(11) DEFAULT 0 COMMENT '更新标记:0未更新,1已更新',
  `add_date` datetime NULL DEFAULT NULL COMMENT '新增时间',
  `update_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `wid_unique` (`wid` ASC)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 2.生成待设置参数的微信支付商户列表,平台提醒客户提供微信账号及密码登录后自动设置
insert into wx_mp_configs(wid, add_date)
select distinct receiver, now() from
(select receiver from dsqgrecord where payment = 0 and wid = receiver and receiver != 211
union
select receiver from ai9me_product_cart where payment = 5 and token = receiver and receiver != 211) t
where receiver > 0 and receiver not in (select wid from wx_mp_configs)
order by receiver asc;

# 3.微信菜单调整字段
ALTER TABLE `menu` 
CHANGE COLUMN `ispost` `ispost` TINYINT(1) NULL DEFAULT 0 COMMENT '是否发布菜单:1已发布0未发布' ,
ADD COLUMN `isupdate` TINYINT(1) NULL DEFAULT NULL COMMENT '更换域名发布菜单0:待发布,1:已发布' AFTER `ispost`;

# 4.替换旧域名为新域名
set @domain1 = 'www.zh50.cn';
set @domain2 = 'zh50.cn';
set @domain = 'www.yichefu.cn';
# 4.1 微信菜单配置表
#select *, instr(menu, @domain2) as i, REPLACE(REPLACE(menu, @domain1, @domain), @domain2, @domain) as new_name from menu
update menu set menu = REPLACE(REPLACE(menu, @domain1, @domain), @domain2, @domain)
where menu is not null and menu != '' and instr(menu, @domain2) > 0;
# 4.2 分享商品链接表
update redpack set url = REPLACE(REPLACE(url, @domain1, @domain), @domain2, @domain)
where url is not null and url != '' and instr(url, @domain2) > 0;
