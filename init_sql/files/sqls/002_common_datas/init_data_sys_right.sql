# 初始化默认的商户配置表信息

# 2016-10-22 重新整理本数据表，可以重新生成

#TODO 备份下原来的数据到新表中，如：sys_right_<当时时间>

# 默认的 sys_right 权限数据
truncate table sys_right;

# 20161022 导出的数据
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Home','首页','',1,'',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 15:50:01','init','Platform','平台功能','',1,'',1,15);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Member','会员','',1,'',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Billing','开单','',1,'',1,30);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Product','商城','',1,'',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-09 10:20:16','init','Inventory','库存','',1,'',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-09 10:20:16','init','Finance','财务','',1,'',1,43);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-09 10:20:16','init','Mall','商城','',1,'',1,47);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Market','营销中心','',1,'',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Setting','设置','',1,'',1,60);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Data','数据中心','',1,'',1,70);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','AppRight','App权限','',1,'',1,80,2);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','HomeGroup','常用业务','Home',2,'',1,80);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Platform','平台功能','Home',2,'',1,90);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','ChinaLife','中国人寿','Home',2,'',1,100);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-11-05 17:50:42','init','UserCenter/Index','商户首页','HomeGroup',3,'usercenter/index',1,100,0);   
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features01','待处理订单','HomeGroup',3,'wmalls/features01',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features02','订单核销','HomeGroup',3,'wmalls/features02',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features04','开单管理','HomeGroup',3,'wmalls/features04',1,30);# 2016-11-08 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features05','会员管理','HomeGroup',3,'wmalls/features05',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features06','会员卡管理','HomeGroup',3,'wmalls/features06',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Wmalls/Features03','预约查询','HomeGroup',3,'wmalls/features03',1,60);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 19:20:16','init','UserCenter/ScanCode','扫码付款','HomeGroup',3,'usercenter/scancode',1,70);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-11-08 19:20:16','init','Adds/Orders5','扫码付款订单','HomeGroup',3,'adds/orders5',0,150,0);


insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 15:50:01','init','Platform001','平台商城管理','Platform',2,'',1,80);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 15:50:01','init','Platform002','平台管理','Platform',2,'',1,90);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 15:50:01','init','Platform003','系统设置','Platform',2,'',1,100);

#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/ServiceList','平台服务分类','Platform001',3,'manage/servicelist',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/Audit_Service','商品审核','Platform001',3,'manage/audit_service',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/ChinalifePubss','国寿合作商户','Platform001',3,'manage/chinalifepubs',1,35);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/Recommend','平台推荐商户','Platform001',3,'manage/recommend',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/ActSet','平台活动设置','Platform001',3,'manage/actset',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Finance','商户费用结算','Platform001',3,'manage/finance',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/ChinaLife_Finance','国寿费用结算','Platform001',3,'manage/chinalife_finance',1,60);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Periods','商户结算周期','Platform001',3,'manage/periods',1,70);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/ChinaLife_Periods','国寿结算周期','Platform001',3,'manage/chinalife_periods',1,80);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/SmsApprove','短信签名审核','Platform002',3,'manage/smsApprove',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-01 16:04:16','init','Manage/SMSList','平台短信记录','Platform002',3,'manage/smslist',1,20); # 2016-11-01 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/SmsPayList','短信费用记录','Platform002',3,'manage/smspaylist',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-15 11:22:16','init','Notice/Index','系统公告管理','Platform002',3,'notice/index',1,40); # 2017-02-15 add
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Vote/VoteList','平台投票活动','Platform002',3,'vote/votelist',1,50);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-10-28 16:47:30','init','UserCenter/SMSList','商户短信记录','Setting',3,'usercenter/smslist',0,70, 0); # 2016-10-28 新增
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/SMS_Store','短信群发客户','Platform002',3,'manage/sms_store',1,340);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/BackupAudit','自动备份审核','Platform002',3,'manage/backupaudit',1,60);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','VendorLevel/VendorLevels','商户级别列表','Platform003',3,'vendorLevel/vendorLevels',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 10:20:14','init','Manage/CustomerConfigs','商户设置','Platform003',3,'manage/customerconfigs',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Initial','后台数据管理','Platform003',3,'manage/initial',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/DBConfigs','车主查询数据配置','Platform003',3,'manage/dbconfigs',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/AppDashboards','APP栏目管理','Platform003',3,'manage/AppDashboards',1,50);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Achievements','商户流水管理','Platform',3,'manage/achievements',0,180);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Activity_Rank','商户销售排名','Platform',3,'orders/activity_rank',0,190);
# 下线两项统计，统计慢，影响系统 2017-03-30
# insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/YCFMember','客户粉丝量统计','Platform',3,'manage/ycfmember',1,220);
# insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/Customer_Fans','客户粉丝量月统计','Platform',3,'manage/customer_fans',1,230);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:16','init','Manage/WX_Order_Init','支付订单转入','Platform',3,'manage/wx_order_init',1,200);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/LBSType','门店类型设置','Platform',3,'manage/lbstype',1,260);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/MemberCard_Rank','会员卡商户运营排名','Platform',3,'manage/memberCard_rank',1,290);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Manage/Member','运营销售人员管理','Platform',3,'manage/member',1,310);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Coupon','入库管理','ChinaLife',3,'chinalife/coupon',1,350);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Member','出库管理','ChinaLife',3,'chinalife/member',1,360);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/PanDian','核销盘点','ChinaLife',3,'chinalife/pandian',1,370);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Agency','机构管理','ChinaLife',3,'chinalife/agency',1,380);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Dep','团队管理','ChinaLife',3,'chinalife/dep',1,390);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Staff','配送员管理','ChinaLife',3,'chinalife/staff',1,400);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Search','合作门店地图','ChinaLife',3,'chinalife/search',1,409);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Action','操作记录','ChinaLife',3,'chinalife/action',1,410);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','ChinaLife/Integral_Set','积分比例','ChinaLife',3,'chinalife/integral_set',0,420);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','HYCenter','会员中心','Member',2,'',1,430);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','HYCoupon','会员卡券','Member',2,'',1,440);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','HYCredit','会员积分','Member',2,'',1,450);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','HYSetting','会员设置','Member',2,'',1,460);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/LineCard','线下办卡','HYCenter',3,'members/lineCard',1,460);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Index','会员管理','HYCenter',3,'members/index',1,470);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Cards','会员卡管理','HYCenter',3,'members/cards',1,480);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CardProds','卡片管理','HYCenter',3,'members/cardprods',1,490);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Order','会员卡订单','HYCenter',3,'members/order',0,500);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Import','会员导入','HYCenter',3,'members/import',1,510);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-21 14:08:01','init','Members/CarOwners','车主管理','HYCenter',3,'members/carowners',1,560);

#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Member/Manual','新版会员卡说明','HYCenter',3,'../versions/member/manual',0,520); # 2017-05-18 下线
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Rprocess/List','维修进度管理','HYCenter',3,'rprocess/list',0,530); # 2017-05-18 下线
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CouponList','会员卡券记录','HYCoupon',3,'members/couponlist',1,540);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CouponSets','会员卡券设置','HYCoupon',3,'members/couponSets',1,550);

#2017-04-22 禁用旧菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:17','init','Members/InteRecords','会员积分记录','HYCredit',3,'members/interecords',0,560,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:17','init','Members/InteItems','会员积分商品','HYCredit',3,'members/inteitems',0,570,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:17','init','Members/InteSet','积分设置','HYCredit',3,'members/inteset',0,580,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:17','init','Members/Level','会员等级设置','HYCredit',3,'members/level',0,590,0);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/MemberCondition','会员条件设置','HYSetting',3,'members/membercondition',1,540);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/DiscountSet','会员折扣设置','HYSetting',3,'members/discountset',1,550);
#2017-04-22 启用新菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Credits','会员积分','HYCredit',3,'members/credits',1,510);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditRevision','编辑积分','Members/Credits',5,'members/creditrevision',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CreditProducts','积分商品','HYCredit',3,'members/creditproducts',1,520);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-add','新增积分商品','Members/CreditProducts',5,'members/creditproducts',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-edt','编辑积分商品','Members/CreditProducts',5,'members/creditproducts',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-del','删除积分商品','Members/CreditProducts',5,'members/creditproducts',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-on','上架积分商品','Members/CreditProducts',5,'members/creditproducts',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-off','下架积分商品','Members/CreditProducts',5,'members/creditproducts',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditProducts-order','兑换积分商品','Members/CreditProducts',5,'members/creditproducts',1,60);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CreditExchanges','兑换记录','HYCredit',3,'members/creditexchanges',1,530);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditExchanges-edt','编辑','Members/CreditExchanges',5,'members/creditexchanges',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CreditExchanges-pick','确认兑换','Members/CreditExchanges',5,'members/creditexchanges',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/CreditSet','积分规则设置','HYCredit',3,'members/creditset',1,540);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Billing001','开单收银','Billing',2,'',1,600);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billing004','开单设置','Billing',2,'',1,630);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Index','搜索开单','Billing001',3,'billings/index',0,640);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/MemberDetail','会员详情','Billing001',3,'billings/memberDetail',0,650);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/CardConsumption','卡片消费','Billing001',3,'billings/cardConsumption',0,660);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Lists','开单管理','Billing001',3,'billings/lists',1,670);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Billing002','库存管理','Inventory',2,'',1,610);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Inventory002','配件设置','Inventory',2,'',1,620);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Stores','库存查询','Billing002',3,'billings/stores',1,680);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/ProInRecords','采购入库','Billing002',3,'billings/proInRecords',1,690);
# 2017-02-28 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/proInRecords-viewprice','查看采购价','Billings/ProInRecords',5,'billings/proInRecords',1,2162);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/proInRecordsDetail-editprice','编辑采购价','Billings/ProInRecords',5,'billings/proInRecordsDetail',1,2163);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/ProOutRecords','出库管理','Billing002',3,'billings/proOutRecords',1,700);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/ProOutRecords-out1','其他出库','Billings/ProOutRecords',5,'billings/ProOutRecords',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/ProOutRecords-out2','调拨出库','Billings/ProOutRecords',5,'billings/ProOutRecords',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/ProOutRecords-out3','耗材出库','Billings/ProOutRecords',5,'billings/ProOutRecords',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 16:20:22','init','Billings/ProOutRecords-out4','出库单退货','Billings/ProOutRecords',5,'billings/ProOutRecords',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/StoresInvetorys','库存盘点','Billing002',3,'billings/storesInventorys',1,710);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/ProReturnRecords','退货管理','Billing002',3,'billings/proReturnRecords',1,720);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billing003','财务管理','Finance',2,'',1,620);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/MoneyIns','资金收入','Billing003',3,'billings/moneyIns',1,730);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/MoneyOuts','资金支出','Billing003',3,'billings/moneyOuts',1,740);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/TradePay','应付货款','Billing003',3,'billings/tradePay',1,750);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Charges','挂帐管理','Billing003',3,'billings/charges',1,760);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/RecheckOrders','工单复核','Billing003',3,'billings/recheckOrders',1,770);

/*
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Product001','抢购','Product',2,'',1,810);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Product002','预约','Product',2,'',1,820);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Product003','商城','Product',2,'',1,830);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','WQG/List','抢购管理','Product001',3,'wqg/list',1,840);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','WQG/QGRecord','抢购订单','Product001',3,'wqg/qgrecord',1,850);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','YYFW/yyfw_records','预约服务','Product002',3,'yyfw/yyfw_records',1,860);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Adds/ShangCheng3','商城订单','Product003',3,'adds/shangcheng3',1,870);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Adds/ShangCheng2','商品管理','Product003',3,'adds/shangcheng2',1,880);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Adds/ShangCheng1','商城分类','Product003',3,'adds/shangcheng1',1,890);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Adds/ProductSet','商城页面设置','Product003',3,'adds/productset',1,900);
*/

# 营销中心菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Market001','营销活动','Market',2,'',1,910);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Market002','营销短信','Market',2,'',0,920); #下线:2017-02-06
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Market003','微官网','Market',2,'',1,930);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Market004','群发消息','Market',2,'',1,921);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Market005','微信服务','Market',2,'',1,922);


insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 14:28:01','init','Markets/SubscribeGift','首次关注赠送','Market001',3,'markets/subscribegift',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-08 14:28:01','init','Markets/SubscribeGifts','关注领取记录','Market001',3,'markets/subscribegifts',1,20);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/WyxSet','关注活动设置','Market001',3,'wyx/wyxset',1,940);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/Money_Set-Share','赠送金额设置','Market001',3,'wyx/money_set-share',1,950);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/Money_Set-Market','分销奖励设置','Market001',3,'wyx/money_set-market',1,960);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/Banner_Market','海报分销设置','Market001',3,'wyx/banner_market',1,970);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/Member_GiftAmount','营销奖励统计','Market001',3,'wyx/member_giftamount',1,980);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Wyx/GiftAmount_Record-Draw','奖励提现记录','Market001',3,'wyx/giftamount_record-draw',1,990);

# 卡券管理菜单: 2017-03-09
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/Coupons','卡券管理','Market001',3,'wmalls/coupons',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/Coupon-add','新增','Wmalls/Coupons',5,'wmalls/coupon',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/Coupon-edt','编辑','Wmalls/Coupons', 5,'wmalls/coupon',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/Coupons-del','删除','Wmalls/Coupons',5,'wmalls/coupons',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/CouponList','卡券领取记录','Market001',3,'wmalls/couponlist',1,40);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Car/QunFa','短信群发','Market002',3,'car/qunfa',0,1000);  #下线:2017-02-06
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Car/QunFaRecord','群发记录','Market002',3,'car/qunfarecord',0,1010);  #下线:2017-02-06
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Car/QunFaBaoBiao','群发报表','Market002',3,'car/qunfabaobiao',0,1020);  #下线:2017-02-06

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BusinessModule/WSite','微官网设置','Market003',3,'businessModule/wsite',1,1030);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Setting001','基础设置','Setting',2,'',1,1040);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Setting002','业务设置','Setting',2,'',1,1050);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Setting003','公众号设置','Setting',2,'',1,1060);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Setting004','车主关怀','Setting',2,'',1,1070);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','UserCenter/MyAccount','基础信息','Setting001',3,'userCenter/myAccount',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','UserCenter/MyAccount-edt','保存','UserCenter/MyAccount',5,'userCenter/myAccount-edt',1,1090);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','UserCenter/MyAccount-add','编辑账号二维码','UserCenter/MyAccount',5,'userCenter/myAccount-add',1,1100);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BaseService/PaySet','支付方式','Setting001',3,'baseService/paySet',1,1110);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BaseService/Linepay-Edt','编辑线下支付','BaseService/PaySet',5,'baseService/linepay-edt',1,1120);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BaseService/Wxpay-Edt','编辑微信支付','BaseService/PaySet',5,'baseService/wxpay-edt',1,1130);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BaseService/Huiyuanpay-Edt','编辑会员支付','BaseService/PaySet',5,'baseService/huiyuanpay-edt',1,1140);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BaseService/Alipay-Edt','编辑支付宝','BaseService/PaySet',5,'baseService/alipay-edt',1,1150);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Worker/SetSuperAdmins','安全中心','Setting001',3,'worker/setsuperadmins',1,1210);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Worker/SetSuperAdmin-Add','新增管理员','Worker/SetSuperAdmins',5,'worker/setsuperadmin-add',1,1220);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Worker/SetSuperAdmin-Edt','编辑管理员','Worker/SetSuperAdmins',5,'worker/setsuperadmin-edt',1,1230);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Worker/SetSuperAdmins-Del','删除管理员','Worker/SetSuperAdmins',5,'worker/setsuperadmins-del',1,1240);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BusinessModule/Shops','门店管理','Setting001',3,'businessModule/shops',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BusinessModule/Shop-Add','新增门店','BusinessModule/Shops',5,'businessModule/shop-add',1,1260);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BusinessModule/Shop-Edt','编辑门店','BusinessModule/Shops',5,'businessModule/shop-edt',1,1270);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','BusinessModule/Shops-Del','删除门店','BusinessModule/Shops',5,'businessModule/shops-del',1,1280);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Customers/Roles','角色管理','Setting001',3,'customers/roles',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Customers/Role-Add','新增角色','Customers/Roles',5,'customers/role-add',1,1340);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Customers/Role-Edt','编辑角色','Customers/Roles',5,'customers/role-edt',1,1350);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Customers/Roles-Del','删除角色','Customers/Roles',5,'customers/roles-del',1,1360);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Customers/RoleAuth','设置角色权限','Customers/Roles',5,'customers/RoleAuth',1,1370);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Staff/Depts','部门管理','Setting001',3,'staff/depts',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Staff/Dept-Add','新增部门','Staff/Depts',5,'staff/dept-add',1,1300);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Staff/Dept-Edt','编辑部门','Staff/Depts',5,'staff/dept-edt',1,1310);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Staff/Depts-Del','删除部门','Staff/Depts',5,'staff/depts-del',1,1320);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Staffs','员工管理','Setting001',3,'staff/staffs',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Staff-Add','新增员工','Staff/Staffs',5,'staff/staff-add',1,1390);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Staff-Edt','编辑员工','Staff/Staffs',5,'staff/staff-edt',1,1400);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Staffs-Del','删除员工','Staff/Staffs',5,'staff/staffs-del',1,1410);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Staffs-Reset','重置员工密码','Staff/Staffs',5,'staff/staffs-reset',1,1420);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-26 11:20:20','init','Staff/Staff-Auth','帐号绑定','Staff/Staffs',5,'staff/staff-auth',1,1425);
# 2017-02-23 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:20:19','init','NoticeSet/ReceiveNotices','微信通知管理','Setting001',3,'noticeSet/receivenotices',1,60);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:20:19','init','NoticeSet/ReceiveNotices-add','添加接收者','NoticeSet/ReceiveNotices',5,'noticeSet/receivenotices-add',1,1170);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:20:19','init','NoticeSet/ReceiveNotices-edt','编辑','NoticeSet/ReceiveNotices',5,'noticeSet/receivenotices-edt',1,1180);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:20:19','init','NoticeSet/ReceiveNotices-del','删除','NoticeSet/ReceiveNotices',5,'noticeSet/receivenotices-del',1,1190);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','NoticeSet/NoticeList','推送通知管理','Setting001',3,'noticeSet/noticelist',1,1160);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','NoticeSet/NoticeList-UserOff','编辑操作管理员状态','NoticeSet/NoticeList',5,'noticeSet/noticelist-userOff',1,1170);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','NoticeSet/NoticeList-Off','编辑推送通知状态','NoticeSet/NoticeList',5,'noticeSet/noticelist-off',1,1180);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Open/UserOperator','编辑手机操作管理员','NoticeSet/NoticeList',5,'open/userOperator',1,1190);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:19','init','Open/NoticeSet','编辑推送通知接收者','NoticeSet/NoticeList',5,'open/noticeSet',1,1200);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:20:19','init','Customers/BackupSet','自动备份设置','Setting001',3,'customers/backupset',1,70);
# 2016-12-26 新增
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/StaffTags','员工标签设置','Setting002',3,'staff/staffTags',1,1430);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/StaffTag-Add','新增员工标签设置','Staff/StaffTags',5,'staff/staffTag-add',1,1440);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/StaffTag-Edt','编辑员工标签设置','Staff/StaffTags',5,'staff/staffTag-edt',1,1450);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Billings/ServiceList','服务项目设置','Setting002',3,'billings/serviceList',0,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-28 11:55:20','init','Billings/CustomerServices','服务项目管理','Setting002',3,'billings/customerservices',1,12);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-28 11:55:20','init','Billings/CustomerServices-add','新增项目','Billings/CustomerServices',5,'billings/customerservices',0,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-28 11:55:20','init','Billings/CustomerServices-edt','编辑项目','Billings/CustomerServices',5,'billings/customerservices',0,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-28 11:55:20','init','Billings/CustomerServices-del','删除项目','Billings/CustomerServices',5,'billings/customerservices',0,30);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/ProductSet','配件库设置','Setting002',3,'billings/ProductSet',1,20);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-07 09:20:22','init','Billings/Store-auth','编辑配件名称、编码','Billings/ProductSet',5,'billings/Store',1,2161);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','WSY/SetBonus','提成设置','Setting002',3,'wsy/SetBonus',1,20);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Suppliers','供应商设置','Setting002',3,'billings/suppliers',1,40);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Level','会员等级设置','Setting002',3,'members/level',1,50);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/InteSet','积分设置','Setting002',3,'members/inteset',1,60);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Reward','员工打赏记录','Setting002',3,'staff/reward',1,1470);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Staff/Operations','业务操作记录','Setting002',3,'staff/operations',1,1490);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','customers/requireFieldsSet','商户资料设置','Setting002',3,'customers/requireFieldsSet',1,30);


insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/CustomMenu','微信菜单','Setting003',3,'baseService/customMenu',1,1500);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/Cmenu-edt','编辑菜单','BaseService/CustomMenu',5,'baseService/Cmenu-edt',1,1510);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/Fbmenu-edt','发布菜单','BaseService/CustomMenu',5,'baseService/Fbmenu-edt',1,1520);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/Source','微信素材','Setting003',3,'baseService/source',1,1510);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:10:01','init','BaseService/Source-save','保存','BaseService/Source',5,'baseService/contresource-save',1,1540);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-23 17:10:01','init','BaseService/Source-add','发布','BaseService/Source',5,'baseService/contresource-add',1,1550);
# 2017-02-08新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-08 11:10:01','init','BaseService/AutoResponse','自动回复','Setting003',3,'baseService/AutoResponse',1,1530);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-08 11:10:01','init','BaseService/AutoResponse-save','保存','BaseService/AutoResponse',5,'baseService/AutoResponse-save',1,1540);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-08 11:10:01','init','BaseService/AutoResponse-add','新增','BaseService/AutoResponse',5,'baseService/AutoResponse-add',1,1550);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-08 11:10:01','init','BaseService/AutoResponse-edt','编辑','BaseService/AutoResponse',5,'baseService/AutoResponse-edt',1,1560);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-08 11:10:01','init','BaseService/AutoResponse-del','删除','BaseService/AutoResponse',5,'baseService/AutoResponse-del',1,1570);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/CustomHtmls','自定义页面','Setting003',3,'baseService/customHtmls',1,1630);

# 2017-02-08下线
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/FirstAttention','首次关注回复','Setting003',3,'baseService/firstAttention',0,1530, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/Ajax-edt','编辑首次关注','BaseService/FirstAttention',5,'baseService/Ajax-edt',0,1540, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/Keywords','关键字回复','Setting003',3,'baseService/keywords',1,1550, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/Keywords-del','删除关键字','BaseService/Keywords',5,'baseService/Keywords-del',0,1560, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/Keyword-add','新增关键字','BaseService/Keywords',5,'baseService/Keyword-add',0,1570, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:20','init','BaseService/Keyword-edt','编辑关键字','BaseService/Keywords',5,'baseService/Keyword-edt',0,1580, 0);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','UserCenter/Pubs','微信授权','Setting003',3,'usercenter/pubs',1,1600);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/CustomPubImpower-edt','编辑微信授权','UserCenter/Pubs',5,'BaseService/CustomPubImpower-edt',1,1610);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','BaseService/CustomPubImpower-del','删除微信授权','UserCenter/Pubs',5,'BaseService/CustomPubImpower-del',1,1620);

# 调整车主关怀设置菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','DriverCare/SMSTemplates','业务订单关怀设置','Setting004',3,'drivercare/smsTemplates',0,1640,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','DriverCare/ServiceTemplates','服务项目关怀设置','Setting004',3,'drivercare/serviceTemplates',0,1650,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','DriverCare/ManualServices','会员手动关怀设置','Setting004',3,'drivercare/manualServices',0,1660,0);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Data001','数据中心','Data',2,'',1,1670);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Data002','数据统计','Data',2,'',1,1680);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','Orders/FeedbackPerformance','商户业绩统计','Data001',3,'orders/feedbackperformance',0,1690,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Reports/StorePerformance','门店业绩统计','Data001',3,'reports/storeperformance',1,1700);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Manage/Customer_Revenues','商户流水统计(按城市)','Data002',3,'manage/customer_revenues',1,1730);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:20','init','Manage/Customer_Count_Fans','商户车主统计(按城市)','Data002',3,'manage/customer_count_fans',1,1740);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Manage/Platform_Revenues','客户业绩统计(平台)','Data002',3,'manage/platform_revenues',1,1750);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/Member-add','新增会员','Members/Index',5,'members/member',1,1760);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/Member-edt','编辑会员','Members/Index',5,'members/member',1,1770);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/Cars','查看车辆信息','Members/Index',5,'members/cars',1,1780);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Adds/PayRecords','查看充值记录','Members/Index',5,'adds/payrecords',1,1790);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Adds/ConsumeRecords','查看消费记录','Members/Index',5,'adds/consumerecords',1,1800);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-21 14:08:01','init','Members/CarOwner-add','新增车主','Members/CarOwners',5,'members/CarOwner',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-21 14:08:01','init','Members/CarOwners-edt','编辑车主','Members/CarOwners',5,'members/CarOwners',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-21 14:08:01','init','Members/CarOwners-del','删除车主','Members/CarOwners',5,'members/CarOwners',1,30);
# 2016-11-03 下线
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/MemberInte','积分商品','Members/Index',5,'members/memberinte',0,1810);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/Comsume','会员卡消费','Members/Cards',5,'members/comsume',1,1820);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/PayRecords','查看充值记录','Members/Cards',5,'members/payrecords',1,1830);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/ConsumeRecords','查看消费记录','Members/Cards',5,'members/consumerecords',1,1840);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/Revision-edt','会员卡编辑','Members/Cards',5,'members/revision',1,1850);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CardProd-add','新增卡片','Members/CardProds',5,'members/cardprod',1,1860);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CardProd-edt','编辑卡片','Members/CardProds',5,'members/cardprod',1,1870);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CardProds-close','停用卡片','Members/CardProds',5,'members/cardprods',1,1880);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CardProds-open','启用卡片','Members/CardProds',5,'members/cardprods',1,1890);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CardProds-del','删除卡片','Members/CardProds',5,'members/cardprods',1,1900);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Admin2/Index','订单详情','Members/Order',5,'Admin2/Index',0,1910);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponList-del','删除卡券','Members/CouponList',5,'members/couponlist',1,1920);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponSet-add','添加卡券','Members/CouponSets',5,'members/couponset',1,1930);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponSend','发送卡券','Members/CouponSets',5,'members/couponsend',1,1940);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponSet','查看设置','Members/CouponSets',5,'members/couponset',1,1950);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponSet-edt','编辑设置','Members/CouponSets',5,'members/couponset',1,1960);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/CouponSets-close','关闭卡券','Members/CouponSets',5,'members/couponsets',1,1970);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/InteItem-add','新增积分商品','Members/InteItems',5,'members/inteitem',1,1980);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/InteItem-edt','修改积分商品','Members/InteItems',5,'members/inteitem',1,1990);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/SwapInteItem-add','兑换积分商品','Members/InteItems',5,'members/swapinteitem',1,2000);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Members/InteItems-del','删除积分商品','Members/InteItems',5,'members/inteitems',1,2010);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Success','查看详情','Billings/Lists',5,'billings/success',1,2020);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Main-edt','编辑订单','Billings/Lists',5,'billings/main',1,2030);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Lists-workend','完工通知','Billings/Lists',5,'billings/lists',1,2040);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Lists-ordercancel','作废','Billings/Lists',5,'billings/lists',1,2050);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Main-settle','结算','Billings/Lists',5,'billings/main',1,2060);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Main-cash','收银','Billings/Lists',5,'billings/main',1,2062);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/storesWarning','设置库存预警','Billings/Stores',5,'billings/storeswarning',1,2070);
# 2016-12-14 添加
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 16:20:21','init','Billings/Main-revert','返单','Billings/Lists',5,'billings/main',1,2065);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/SingleInitial','新增配件','Billings/Stores',5,'billings/singleinitial',1,2080);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/Store-edt','编辑配件','Billings/Stores',5,'billings/store',1,2090);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/ProInRecord-add','新增采购入库','Billings/ProInRecords',5,'billings/proinrecord',1,2100);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/StoresWarning-settle','结算采购入库单','Billings/ProInRecords',5,'billings/storeswarning',1,2110);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:21','init','Billings/ProInRecordsReturn','采购入库单退货','Billings/ProInRecords',5,'billings/proInRecordsReturn',1,2120);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/ProInRecords-del','作废采购入库单','Billings/ProInRecords',5,'Billings/ProInRecords',1,2130);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/StoresInventory-add','新增盘点','Billings/StoresInvetorys',5,'Billings/StoresInventory',1,2140);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/StoresInventorys-import','下载盘点明细','Billings/StoresInvetorys',5,'storesInventorys',1,2150);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyIn-add','新增收入','Billings/MoneyIns',5,'billings/moneyin',1,2160);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyIn-edt','编辑收入','Billings/MoneyIns',5,'billings/moneyin',1,2170);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyIns-del','删除收入','Billings/MoneyIns',5,'billings/moneyins',1,2180);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyOut-add','新增支出','Billings/MoneyOuts',5,'billings/moneyout',1,2190);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyOut-edt','编辑支出','Billings/MoneyOuts',5,'billings/moneyout',1,2200);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MoneyOuts-del','删除支出','Billings/MoneyOuts',5,'billings/moneyouts',1,2210);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/TradePay-balance','应付货款结算','Billings/TradePay',5,'billings/tradepay',1,2220);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Charges-record','查看还款记录','Billings/Charges',5,'billings/charges',1,2230);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Charges-detail','挂账明细','Billings/Charges',5,'billings/charges',1,2240);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Charges-add','挂账还款','Billings/Charges',5,'billings/charges',1,2250);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Supplier-add','添加供应商','Billings/Suppliers',5,'billings/supplier',1,2260);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Supplier-edt','编辑供应商','Billings/Suppliers',5,'billings/supplier',1,2270);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/Suppliers-del','删除供应商','Billings/Suppliers',5,'billings/suppliers',1,2280);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/BrandManager-add','新增品牌','Billings/BrandManagers',5,'billings/brandmanager',1,2290);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/BrandManager-edt','编辑品牌','Billings/BrandManagers',5,'billings/brandmanager',1,2300);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/BrandManagers-del','删除品牌','Billings/BrandManagers',5,'billings/brandmanagers',1,2310);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:22','init','Billings/MajorAccessoryType','编辑配件大类','Billings/AccessoryType',5,'billings/majoraccessorytype',1,2320);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 10:31:38','init','Billings/Cancels','作废的开单','Billing001',3,'billings/cancels',1,680);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 10:31:55','init','Members/RechargeHistory','会员卡充值记录','HYCenter',3,'members/rechargehistory',1,482);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 10:31:56','init','Members/ConsumeHistory','会员卡消费记录','HYCenter',3,'members/consumehistory',1,484);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/WaitOuts','待出库列表','Billing002',3,'billings/waitouts',1,692);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/WaitCashs','待收银列表','Billing001',3,'billings/waitCashs',1,696);

# 2016-10-25 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-25 14:45:30','init','Billings/Disclaimer','单据申明设置','Billing004',3,'billings/disclaimer',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 10:31:38','init','Billings/Keys','钥匙号设置','Billing004',3,'billings/keys',1,60);
# 2016-10-22 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-22 18:30:10','init','Billings/StaffDiscount','结算折扣设置','Billing004',3,'billings/staffdiscount',1,70);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value(now(),'init','Billings/StaffDiscount-edt','编辑结算折扣','Billings/StaffDiscount',3,'billings/staffdiscount',1,797);


# 2016-11-03 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Index-del','删除会员','Members/Index',5,'members/index',1,470);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:17','init','Members/Index-bak','恢复会员','Members/Index',5,'members/index',1,470);

# 2016-11-05 新增 支付方
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:44:42','init','Billings/Payers','支付方设置','Billing004',3,'billings/payers',1,80);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:46:43','init','Billings/Payers-add','新增支付方','Billings/Payers',5,'billings/payers',1,11);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:46:44','init','Billings/Payers-edt','编辑支付方','Billings/Payers',5,'billings/payers',1,12);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:46:45','init','Billings/Payers-del','删除支付方','Billings/Payers',5,'billings/payers',1,13);

# 2016-11-05 首面区块对应权限 
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-HYBK','会员办卡','UserCenter/Index',5,'usercenter/index',1,11);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-YYE','营业日报','UserCenter/Index',5,'usercenter/index',1,12);    
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-WXFX','微信粉丝','UserCenter/Index',5,'usercenter/index',1,13);  
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-DCLYY','待处理预约','UserCenter/Index',5,'usercenter/index',1,14);   
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-DCLSCDD','待处理商城订单','UserCenter/Index',5,'usercenter/index',1,15);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-WXLY','待回复微信留言','UserCenter/Index',5,'usercenter/index',1,16);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-GZ','当前挂账','UserCenter/Index',5,'usercenter/index',0,21);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-MEMBER','会员总数','UserCenter/Index',5,'usercenter/index',0,22);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-SKKD','散客开单','UserCenter/Index',5,'usercenter/index',0,23);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-KCYJ','库存预警','UserCenter/Index',5,'usercenter/index',0,24);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-WXQF','微信群发','UserCenter/Index',5,'usercenter/index',0,25);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-DXQF','短信群发','UserCenter/Index',5,'usercenter/index',0,26);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-DSYLB','待收银列表','UserCenter/Index',5,'usercenter/index',0,27);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-05 17:50:45','init','UserCenter/Index-DCKLB','待出库列表','UserCenter/Index',5,'usercenter/index',0,28);

# 2016-11-07 B单功能
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-07 09:20:18','init','Billings/B','创建B单','Billings/Lists',5,'billings/b',1,2070);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-07 09:20:18','init','Billings/BList','B单管理','Billing001',3,'billings/blist',1,700);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-07 09:20:18','init','Billings/B-edt','编辑B单','Billings/BList',5,'billings/b',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-07 09:20:18','init','Billings/B-del','删除B单','Billings/BList',5,'billings/b',1,20);


# 转入 配置设置 （Inventory002） 菜单下 - 2017-07-19
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no, is_menu) value('2016-09-29 09:20:18','init','Billings/MassInitials','库存初始化','Billing004',3,'billings/massInitials',0,00, 0); # 提前关闭了
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Suppliers','供应商管理','Inventory002',3,'billings/suppliers',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/AccessoryType','配件分类管理','Inventory002',3,'billings/accessoryType',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/BrandManagers','配件品牌管理','Inventory002',3,'billings/brandManagers',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/ProductSet','配件库设置','Inventory002',3,'billings/ProductSet',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-07 09:20:22','init','Billings/Store-auth','编辑配件名称、编码','Billings/ProductSet',5,'billings/Store',1,2161);

# 2017-02-27 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-27 20:48:18','init','Billings/Main-edtservice','开单是否可编辑服务','Billings/Lists',5,'billings/main',1,2080);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-27 20:48:18','init','Billings/Main-edtproduct','开单是否可编辑配件','Billings/Lists',5,'billings/main',1,2090);

# 2016-11-08 营销活动新功
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Messages/WxGroup','微信群发','Market004',3,'messages/wxgroup',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Messages/SmsGroup','短信群发','Market004',3,'messages/smsgroup',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Messages/Messages','群发记录','Market004',3,'messages/messages',1,30);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/Dialogs','微信消息','Market005',3,'wechats/dialogs',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/Fans','粉丝记录','Market005',3,'wechats/fans',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/QrCodes','推广二维码','Market005',3,'wechats/qrcodes',1,30);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/Fans-edt','更新粉丝','Wechats/Fans',5,'wechats/fans',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/Dialogs-edt','回复粉丝','Wechats/Dialogs',5,'wechats/dialogs',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/QrCodes-add','新增二维码','Wechats/QrCodes',5,'wechats/qrcodes',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/QrCodes-edt','编辑二维码','Wechats/QrCodes',5,'wechats/qrcodes',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','Wechats/QrCodes-del','删除二维码','Wechats/QrCodes',5,'wechats/qrcodes',1,30);

# 2016-11-08 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','DriverCare/CustomerReminds','关怀设置','Setting004',3,'drivercare/customerreminds',1,1638);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','DriverCare/RemindList','关怀记录','Setting004',3,'drivercare/remindlist',1,1639);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-08 18:03:01','init','DriverCare/CustomerReminds-edt','编辑设置参数','DriverCare/CustomerReminds',5,'drivercare/customerreminds',1,10);

# 2016-11-19 新增数据中心报表
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-19 14:09:20','init','Reports/DailyReport','营业日报','Data001',3,'reports/dailyreport',1,1);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-19 14:09:20','init','Reports/DailyRevenues','营业流水','Data001',3,'reports/dailyrevenues',1,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-19 14:09:20','init','Reports/ProConsume','项目消费统计','Data001',3,'reports/proconsume',1,3);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-11-19 14:09:20','init','Reports/ServiceCar','服务车辆统计','Data001',3,'reports/servicecar',1,4);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','UserCenter/StatisticalData','粉丝运营图表','Data001',3,'userCenter/statisticalData',0,1710,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no,is_menu) value('2016-09-29 09:20:20','init','UserCenter/YGJData','易管家用户统计','Data001',3,'userCenter/ygjdata',0,1720,0);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/StaffPerformance','员工业绩统计','Data001',3,'billings/StaffPerformance',1,1730);
# 2017-02-28 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-02-28 11:35:20','init','Reports/ProductProfit','配件利润统计','Data001',3,'reports/productprofit',1,1735);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-08-03 11:35:20','init','Reports/FacialOperation','美容施工统计','Data001',3,'reports/facialoperation',1,1738);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-01-03 16:33:20','init','Orders/StaffPerformanceDetail','员工施工明细','Data001',3,'orders/staffperformancedetail',1,1740);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-08 14:05:01','init','Reports/StaffSaleDetail','员工销售明细','Data001',3,'Reports/StaffSaleDetail',1,1750);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-06-08 14:05:01','init','Reports/StoreSettlement','门店结算统计','Data001',3,'Reports/StoreSettlement',1,1760);

# 2017-08-16 新增
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-08-16 12:00:00','init','Reports/DeptPerformance','部门业绩统计','Data001',3,'reports/deptperformance',1,1760);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-08-16 12:00:00','init','Reports/OrderCostDetail','工单成本统计','Data001',3,'reports/ordercostdetail',1,1770);


# 2016-12-08 商城新版权限
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall002','订单管理','Mall',2,'',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall005','商品管理','Mall',2,'',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall003','预约管理','Mall',2,'',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall007','商城设置','Mall',2,'',1,70);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall001','核销管理','Mall',2,'',1,10);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall004','抢购管理','Mall',2,'',1,40);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Mall006','卡券管理','Mall',2,'',1,60);

# 2017-03-30 订单管理
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/MallOrders','商城订单','Mall002',3,'wmalls/mallorders',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2019-03-30 10:58:18','init','Wmalls/verifyList','订单核销','Mall002',3,'wmalls/verifylist',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2019-03-30 10:58:18','init','Wmalls/verifyRecords','核销记录','Mall002',3,'wmalls/verifyrecords',1,30);

# 商品管理
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/Products','商品管理','Mall005',3,'wmalls/products',1,10);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupList','抢购管理','Mall005',3,'wmalls/snapupList',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/Comments','评论管理','Mall005',1,'wmalls/comments',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-04 16:34:18','init','Wmalls/ProductTemplates','商品详情模版','Mall005',3,'wmalls/producttemplates',1,40);

#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-22 10:56:01','init','Wmalls/SnapupOrders','抢购订单','Mall004',3,'wmalls/snapupOrders',1,20); # 2017-03-22 订单管理权限
# 抢购管理子菜单: 2017-03-09
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupProduct-add','新增','Wmalls/SnapupList',5,'wmalls/snapupproduct',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupProduct-edt','编辑','Wmalls/SnapupList', 5,'wmalls/snapupproduct',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupList-del','删除','Wmalls/SnapupList',5,'wmalls/snapupList',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupList-on','上架','Wmalls/SnapupList',5,'wmalls/snapupList',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupList-off','下架','Wmalls/SnapupList',5,'wmalls/snapupList',1,50);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/SnapupList-activity','参加活动','Wmalls/SnapupList',5,'wmalls/snapupList',1,60);

#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-04 16:34:18','init','Wmalls/ProductTemplate-add','新增商品模版','Wmalls/ProductTemplates',5,'wmalls/producttemplate',1,10);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-04 16:34:18','init','Wmalls/ProductTemplate-edt','编辑商品模版','Wmalls/ProductTemplates',5,'wmalls/producttemplate',1,20);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-05-04 16:34:18','init','Wmalls/ProductTemplate-del','删除商品模版','Wmalls/ProductTemplates',5,'wmalls/producttemplate',1,30);

# 2016-12-14 预约相关权限
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveSet','预约服务设置','Mall003',3,'wmalls/reserveset',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-15 15:44:18','init','Wmalls/ReserveOrders','预约查询','Mall003',3,'wmalls/reserveorders',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-15 15:44:18','init','Wmalls/ReservePlan','预约排期','Mall003',3,'wmalls/reserveplan',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveServices','预约项目管理','Mall003',3,'wmalls/reserveservices',1,40);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-15 15:44:18','init','Wmalls/ReservePeriod','预约时间设置','Mall003',3,'wmalls/reserveperiod',1,50);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveTimeEdit','更改预约时间','Wmalls/ReserveOrders',5,'wmalls/reservetimeedit',1,10);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveService-add','新增预约项目','Wmalls/ReserveServices',5,'wmalls/reserveservice',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveService-edt','编辑预约项目','Wmalls/ReserveServices',5,'wmalls/reserveservice',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ReserveService-del','删除预约项目','Wmalls/ReserveServices',5,'wmalls/reserveservice',1,30);


# 商城管理
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/HomeModules','商城首页','Mall007',3,'wmalls/homemodules',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/HomeBanners','首页轮播图','Mall007',3,'wmalls/homebanners',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-13 16:46:18','init','Wmalls/ProductCategorys','商品分类','Mall007',3,'wmalls/productcategorys',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/HomeModule-add','新增首页模块','Wmalls/HomeModules',5,'wmalls/homemodule',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/HomeModule-edt','编辑首页模块','Wmalls/HomeModules',5,'wmalls/homemodule',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/HomeModule-del','删除首页模块','Wmalls/HomeModules',5,'wmalls/homemodule',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/HomeModuleType','商品分类设置','Wmalls/HomeModules',5,'wmalls/homemoduletype',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-13 16:46:18','init','Wmalls/ShareSet','商城设置','Mall007',3,'wmalls/shareset',1,40);

# 头条管理菜单: 2017-03-09
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/homebanner-add','新增轮播图','Wmalls/HomeBanners',5,'wmalls/homebanner',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/homebanner-edt','编辑轮播图','Wmalls/HomeBanners', 5,'wmalls/homebanner',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-09 15:56:01','init','Wmalls/homebanners-del','删除轮播图','Wmalls/HomeBanners',5,'wmalls/homebanners',1,30);

# 商品分类管理: 2017-03-13
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-13 16:46:18','init','Wmalls/ProductCategory-add','新增商品分类','Wmalls/ProductCategorys',5,'wmalls/productcategory',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-13 16:46:18','init','Wmalls/ProductCategory-edt','编辑商品分类','Wmalls/ProductCategorys',5,'wmalls/productcategory',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-13 16:46:18','init','Wmalls/ProductCategorys-del','删除商品分类','Wmalls/ProductCategorys',5,'wmalls/productcategorys',1,30);

#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/MemberModules','个人中心设置','Mall007',3,'wmalls/membermodules',1,30);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-08 17:58:18','init','Wmalls/MemberModules-edt','编辑/禁用/启用','Wmalls/MemberModules',5,'wmalls/membermodules',1,10);

# 2016-12-15 商品相关权限
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ProductType','选择分类','Wmalls/Products',5,'wmalls/producttype',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/Product','新增商品','Wmalls/Products',5,'wmalls/product',1,20);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-14 18:58:18','init','Wmalls/ShipProduct','订单发货','Wmalls/MallOrders',5,'wmalls/shipproduct',1,10);

# 2016-12-23 新增开单相关菜单
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-09-29 09:20:18','init','Billings/Query','开单查询','Billing001',3,'billings/query',1,668);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-30 18:31:01','init','Billings/Query-edt','开单查询编辑','Billings/Query',5,'billings/query',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-01-03 14:05:01','init','Billings/Products','维修开单管理','Billing001',3,'billings/products',1,672);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-01-03 14:05:01','init','Billings/Services','美容开单管理','Billing001',3,'billings/services',1,673);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-10-11 20:18:42','init','Billings/partsSales','精品销售列表','Billing001',3,'billings/partsSales',1,694);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/CarWashOrders','洗车单管理','Billing001',3,'billings/carwashorders',1,675);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/CarWashOrders-wash','冲水','Billings/CarWashOrders',5,'billings/carwashorders',1,10);
#insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/CarWashOrders-dry','干车','Billings/CarWashOrders',5,'billings/carwashorders',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/CarWashOrders-edt','编辑','Billings/CarWashOrders',5,'billings/carwashorders',1,30);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/ServiceOperates','美容施工管理','Billing001',3,'billings/serviceoperates',1,676);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2017-03-23 19:45:01','init','Billings/AgentOrders','代办业务管理','Billing001',3,'billings/agentorders',1,678);

# 2017-02-15 公告管理操作权限
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-30 18:31:01','init','Notice/Notice-add','新增公告','Notice/Index',5,'notice/notice',1,10);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-30 18:31:01','init','Notice/Notice-edt','编辑公告','Notice/Index',5,'notice/notice',1,20);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available,sort_no) value('2016-12-30 18:31:01','init','Notice/Notice-del','删除公告','Notice/Index',5,'notice/notice',1,30);

# 2017-06-19 添加App端权限
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','AppTopDashboard','置顶面板','AppRight',2,'','',1,10,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','AppDataDashboard','数据面板','AppRight',2,'','',1,20,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','AppToolDashboard','工具面板','AppRight',2,'','',1,30,2);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/TypeCodeVerify','输码验证','AppTopDashboard',3,'res/mmalls/import-icon.png','MMalls/TypeCodeVerify',1,10,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/ScanCodeVerify','手机扫码','AppTopDashboard',3,'res/mmalls/scan-icon.png','MMalls/ScanCodeVerify',1,20,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/OrderBilling','开单','AppTopDashboard',3,'res/mmalls/stick-billing.png','MMalls/OrderBilling',1,30,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/MemberCard','办卡','AppTopDashboard',3,'res/mmalls/card-icon.png','MMalls/MemberCard',1,40,2);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/TotalRevenue','营业额','AppDataDashboard',5,'','MMalls/BusinessReports',1,10,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/ReceivedMoney','实收金额','AppDataDashboard',5,'','MMalls/BusinessReports',1,20,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/BillingCars','接车台次','AppDataDashboard',5,'','MMalls/BusinessReports',1,30,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/PricePerUser','客单价','AppDataDashboard',5,'','MMalls/BusinessReports',1,40,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/SaleCardPrices','销卡金额','AppDataDashboard',5,'','MMalls/BusinessReports',1,50,2);

insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/BusinessReports','营业统计','AppToolDashboard',5,'res/mmalls/business-icon.png','MMalls/BusinessReports',1,10,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/Income','收支统计','AppToolDashboard',5,'res/mmalls/finance-icon.png','MMalls/Income',1,20,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/Member','会员管理','AppToolDashboard',5,'res/mmalls/member-icon.png','MMalls/Member',1,30,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/Inventory','库存管理','AppToolDashboard',5,'res/mmalls/inventory-icon.png','MMalls/Inventory',1,40,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/PerStaff','员工绩效','AppToolDashboard',5,'res/mmalls/staff-icon.png','MMalls/PerStaff',1,50,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/Billing','开单查询','AppToolDashboard',5,'res/mmalls/billing-icon.png','MMalls/Billing',1,60,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/WOrder','商城订单','AppToolDashboard',5,'res/mmalls/wmall-icon.png','MMalls/WOrder',1,70,2);
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,logo,url,is_available,sort_no,is_menu) value('2017-06-19 15:25:01','init','MMalls/MyStaff','我的绩效','AppToolDashboard',5,'res/mmalls/myStaff-icon.png','MMalls/MyStaff',1,80,2);

# 给现有商户级别权限表中的全部商户级别都初始化特定的权限（不会反复添加）
# 平台功能不要初始化，单独设置
# 001 添加 'UserCenter/SMSList'
/*

# 需要添加的权限
set @right_code_to_add = 'reports/storePerformance';

# 添加前，先查看下哪些有给定权限
select * from sys_level_right where right_code = @right_code_to_add order by level_id asc;

insert into sys_level_right(level_id, right_code, right_levels)
select  tr.level_id, tr.right_code, 0 as right_levels
from sys_level_right sr right join
(select distinct level_id, @right_code_to_add as right_code from sys_level_right) tr
on sr.level_id = tr.level_id and sr.right_code = tr.right_code
where (sr.right_code is null or sr.right_code = '');

# 添加后，再查看下哪些有给定权限
select * from sys_level_right where right_code = @right_code_to_add order by level_id asc;

*/
# 002 添加 ''

select 'Re-init Data' as 'Title', 'sys_right' as 'Table', 'Done' as 'Status';
