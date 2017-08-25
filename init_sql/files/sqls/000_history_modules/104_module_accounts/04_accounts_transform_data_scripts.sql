# 商户多账号系统 - 初始化相关数据

# --------------注意本脚本需要支持多次运行，而不影响客户账号数据--------------

# --------------系统有定义的数据重新初始化也没关系--------------

# 1、默认的 sys_right 权限数据
truncate table sys_right;
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Home','首页','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Member','会员','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billing','开单','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Product','商城','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Market','营销活动','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Setting','设置','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Data','数据中心','','1','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','HomeGroup','首页功能','Home','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Platform','平台功能','Home','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife','中国人寿','Home','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/Orders1','抢购订单','HomeGroup','3','adds/orders1','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/Orders2','商城订单','HomeGroup','3','adds/orders2','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/Orders3','会员卡订单','HomeGroup','3','adds/orders3','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/Orders4','预约订单','HomeGroup','3','adds/orders4','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/Orders5','扫码付款订单','HomeGroup','3','adds/orders5','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Initial','后台数据管理','Platform','3','manage/initial','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Finance','商户费用结算','Platform','3','manage/finance','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Achievements','商户流水管理','Platform','3','manage/achievements','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Activity_Rank','商户销售排名','Platform','3','orders/activity_rank','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/WX_Order_Init','支付订单转入','Platform','3','manage/wx_order_init','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Vote/VoteList','平台投票活动','Platform','3','vote/votelist','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/YCFMember','客户粉丝量统计','Platform','3','manage/ycfmember','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Customer_Fans','客户粉丝量月统计','Platform','3','manage/customer_fans','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/ServiceList','抢购服务分类','Platform','3','manage/servicelist','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Audit_Service','抢购服务审核','Platform','3','manage/audit_service','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/LBSType','门店类型设置','Platform','3','manage/lbstype','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/ActSet','易车服活动设置','Platform','3','manage/actset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/ChinaLife_Finance','国寿费用结算','Platform','3','manage/chinalife_finance','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/MemberCard_Rank','会员卡商户运营排名','Platform','3','manage/memberCard_rank','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Recommend','抢购平台推荐商户','Platform','3','manage/recommend','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Member','运营销售人员管理','Platform','3','manage/member','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/DBConfigs','车主查询数据配置','Platform','3','manage/dbconfigs','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','VendorLevel/VendorLevels','商户级别列表','Platform','3','vendorLevel/vendorLevels','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/SMS_Store','短信群发客户','Platform','3','manage/sms_store','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Coupon','入库管理','ChinaLife','3','chinalife/coupon','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Member','出库管理','ChinaLife','3','chinalife/member','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/PanDian','核销盘点','ChinaLife','3','chinalife/pandian','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Agency','机构管理','ChinaLife','3','chinalife/agency','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Dep','团队管理','ChinaLife','3','chinalife/dep','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Staff','配送员管理','ChinaLife','3','chinalife/staff','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Action','操作记录','ChinaLife','3','chinalife/action','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','ChinaLife/Integral_Set','积分比例','ChinaLife','3','chinalife/integral_set','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','HYCenter','会员中心','Member','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','HYCoupon','会员卡券','Member','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','HYCredit','会员积分','Member','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/LineCard','线下办卡','HYCenter','3','members/lineCard','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Index','会员管理','HYCenter','3','members/index','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Cards','会员卡管理','HYCenter','3','members/cards','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProds','卡片管理','HYCenter','3','members/cardprods','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Order','会员卡订单','HYCenter','3','members/order','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Import','会员导入','HYCenter','3','members/import','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Member/Manual','新版会员卡说明','HYCenter','3','../versions/member/manual','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Rprocess/List','维修进度管理','HYCenter','3','rprocess/list','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponList','会员卡券记录','HYCoupon','3','members/couponlist','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSets','会员卡券设置','HYCoupon','3','members/couponSets','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteRecords','会员积分记录','HYCredit','3','members/interecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteItems','会员积分商品','HYCredit','3','members/inteitems','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteSet','会员积分规则','HYCredit','3','members/inteset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Level','会员等级设置','HYCredit','3','members/level','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billing001','开单管理','Billing','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billing002','库存管理','Billing','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billing003','财务管理','Billing','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billing004','设置','Billing','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Index','收银开单','Billing001','3','billings/index','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MemberDetail','会员详情','Billing001','3','billings/memberDetail','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/CardConsumption','卡片消费','Billing001','3','billings/cardConsumption','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Lists','开单管理','Billing001','3','billings/lists','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Stores','库存管理','Billing002','3','billings/stores','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProInRecords','采购入库','Billing002','3','billings/proInRecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProOutRecords','出库管理','Billing002','3','billings/proOutRecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/StoresInvetorys','库存盘点','Billing002','3','billings/storesInventorys','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProReturnRecords','退货管理','Billing002','3','billings/proReturnRecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyIns','收入流水','Billing003','3','billings/moneyIns','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyOuts','资金支出','Billing003','3','billings/moneyOuts','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/TradePay','应付货款','Billing003','3','billings/tradePay','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Charges','挂帐管理','Billing003','3','billings/charges','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Suppliers','供应商管理','Billing004','3','billings/suppliers','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/BrandManagers','品牌管理','Billing004','3','billings/brandManagers','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/AccessoryType','配件分类管理','Billing004','3','billings/accessoryType','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MassInitials','库存初始化','Billing004','3','billings/massInitials','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Product001','抢购','Product','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Product002','预约','Product','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Product003','商城','Product','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','WQG/List','抢购管理','Product001','3','wqg/list','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','WQG/QGRecord','抢购订单','Product001','3','wqg/qgrecord','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','YYFW/yyfw_records','预约服务','Product002','3','yyfw/yyfw_records','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/ShangCheng3','商城订单','Product003','3','adds/shangcheng3','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/ShangCheng2','商品管理','Product003','3','adds/shangcheng2','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/ShangCheng1','商城分类','Product003','3','adds/shangcheng1','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/ProductSet','商城页面设置','Product003','3','adds/productset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Market001','营销活动','Market','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Market002','营销活动','Market','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Market003','微官网','Market','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/WyxSet','关注活动设置','Market001','3','wyx/wyxset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/Money_Set-Share','赠送金额设置','Market001','3','wyx/money_set-share','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/Money_Set-Market','分销奖励设置','Market001','3','wyx/money_set-market','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/Banner_Market','海报分销设置','Market001','3','wyx/banner_market','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/Member_GiftAmount','营销奖励统计','Market001','3','wyx/member_giftamount','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Wyx/GiftAmount_Record-Draw','奖励提现记录','Market001','3','wyx/giftamount_record-draw','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Car/QunFa','短信群发','Market002','3','car/qunfa','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Car/QunFaRecord','群发记录','Market002','3','car/qunfarecord','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Car/QunFaBaoBiao','群发报表','Market002','3','car/qunfabaobiao','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BusinessModule/WSite','微官网设置','Market003','3','businessModule/wsite','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Setting001','系统设置','Setting','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Setting002','店铺设置','Setting','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Setting003','微信设置','Setting','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Setting004','关怀设置','Setting','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','UserCenter/MyAccount','账号信息','Setting001','3','userCenter/myAccount','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/PaySet','支付方式','Setting001','3','baseService/payset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','NoticeSet/NoticeList','推送通知管理','Setting001','3','noticeSet/noticelist','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Worker/SetSuperAdmin','安全中心','Setting001','3','worker/setsuperadmin','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BusinessModule/Shop','门店管理','Setting002','3','businessModule/shop','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Staff/Dep','部门管理','Setting002','3','staff/dep','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Staff/Staffs','员工管理','Setting002','3','staff/staffs','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Customers/Roles','角色管理','Setting002','3','customers/roles','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Staff/StaffTags','员工标签设置','Setting002','3','staff/staffTags','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ServiceList','服务项目管理','Setting002','3','billings/serviceList','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Staff/Reward','员工打赏记录','Setting002','3','staff/reward','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','WSY/Commission-xs','商品提成设置','Setting002','3','wsy/commission-xs','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Staff/Operations','业务操作记录','Setting002','3','staff/operations','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/CustomMenu','微信菜单','Setting003','3','baseService/customMenu','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/FirstAttention','首次关注回复','Setting003','3','baseService/firstAttention','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/Keyword','关键字回复','Setting003','3','baseService/keyword','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/ContResource','微信素材','Setting003','3','baseService/contresource','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','UserCenter/Pubs','微信授权','Setting003','3','usercenter/pubs','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','BaseService/Custom_Html','自定义页面','Setting003','3','baseService/custom_html','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','DriverCare/SMS_Templates','业务订单关怀设置','Setting004','3','drivercare/sms_templates','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','DriverCare/Service_Templates','服务项目关怀设置','Setting004','3','drivercare/service_templates','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','DriverCare/Manual_Service','会员手动关怀设置','Setting004','3','drivercare/manual_service','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Data001','数据中心','Data','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Data002','数据统计','Data','2','','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Orders/FeedbackPerformance','商户业绩统计','Data001','3','orders/feedbackPerformance','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Orders/Store','门店业绩统计','Data001','3','orders/store','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','UserCenter/StatisticalData','粉丝运营图表','Data001','3','userCenter/statisticalData','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','UserCenter/YGJData','易管家用户统计','Data001','3','userCenter/ygjdata','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Customer_Revenues','商户流水统计(按城市)','Data002','3','manage/customer_revenues','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Customer_Count_Fans','商户车主统计(按城市)','Data002','3','manage/customer_count_fans','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Manage/Platform_Revenues','客户业绩统计(平台)','Data002','3','manage/platform_revenues','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Member-add','新增会员','Members/Index','5','members/member','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Member-edt','编辑会员','Members/Index','5','members/member','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Cars','查看车辆信息','Members/Index','5','members/cars','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/PayRecords','查看充值记录','Members/Index','5','adds/payrecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Adds/ConsumeRecords','查看消费记录','Members/Index','5','adds/consumerecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/MemberInte','积分商品','Members/Index','5','members/memberinte','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Comsume','会员卡消费','Members/Cards','5','members/comsume','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/PayRecords','查看充值记录','Members/Cards','5','members/payrecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/ConsumeRecords','查看消费记录','Members/Cards','5','members/consumerecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/Revision-edt','会员卡编辑','Members/Cards','5','members/revision','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProd-add','新增卡片','Members/CardProds','5','members/cardprod','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProd-edt','编辑卡片','Members/CardProds','5','members/cardprod','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProds-close','停用卡片','Members/CardProds','5','members/cardprods','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProds-open','启用卡片','Members/CardProds','5','members/cardprods','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CardProds-del','删除卡片','Members/CardProds','5','members/cardprods','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Admin2/Index','订单详情','Members/Order','5','Admin2/Index','0');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponList-del','删除卡券','Members/CouponList','5','members/couponlist','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSet-add','添加卡券','Members/CouponSets','5','members/couponset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSend','发送卡券','Members/CouponSets','5','members/couponsend','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSet','查看设置','Members/CouponSets','5','members/couponset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSet-edt','编辑设置','Members/CouponSets','5','members/couponset','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/CouponSets-close','关闭卡券','Members/CouponSets','5','members/couponsets','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteItem-add','新增积分商品','Members/InteItems','5','members/inteitem','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteItem-edt','修改积分商品','Members/InteItems','5','members/inteitem','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/SwapInteItem-add','兑换积分商品','Members/InteItems','5','members/swapinteitem','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Members/InteItems-del','删除积分商品','Members/InteItems','5','members/inteitems','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Success','查看详情','Billings/Lists','5','billings/success','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Main-edt','编辑订单','Billings/Lists','5','billings/main','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Lists-workend','完工通知','Billings/Lists','5','billings/lists','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Lists-ordercancel','作废订单','Billings/Lists','5','billings/lists','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Main-settle','结算订单','Billings/Lists','5','billings/main','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/storesWarning','设置库存预警','Billings/Stores','5','billings/storeswarning','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/SingleInitial','新增配件','Billings/Stores','5','billings/singleinitial','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Store-edt','编辑配件','Billings/Stores','5','billings/store','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProInRecord-add','新增采购入库','Billings/ProInRecords','5','billings/proinrecord','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/StoresWarning-settle','结算采购入库单','Billings/ProInRecords','5','billings/storeswarning','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProInRecordsReturn','采购入库单退货','Billings/ProInRecords','5','billings/proInRecordsReturn','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/ProInRecords-del','作废采购入库单','Billings/ProInRecords','5','Billings/ProInRecords','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/StoresInventory-add','新增盘点','Billings/StoresInvetorys','5','Billings/StoresInventory','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/StoresInventorys-import','下载盘点明细','Billings/StoresInvetorys','5','storesInventorys','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyIn-add','新增收入','Billings/MoneyIns','5','billings/moneyin','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyIn-edt','编辑收入','Billings/MoneyIns','5','billings/moneyin','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyIns-del','删除收入','Billings/MoneyIns','5','billings/moneyins','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyOut-add','新增支出','Billings/MoneyOuts','5','billings/moneyout','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyOut-edt','编辑支出','Billings/MoneyOuts','5','billings/moneyout','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MoneyOuts-del','删除支出','Billings/MoneyOuts','5','billings/moneyouts','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/TradePay-balance','应付货款结算','Billings/TradePay','5','billings/tradepay','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Charges-record','查看还款记录','Billings/Charges','5','billings/charges','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Charges-detail','挂账明细','Billings/Charges','5','billings/charges','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Charges-add','挂账还款','Billings/Charges','5','billings/charges','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Supplier-add','添加供应商','Billings/Suppliers','5','billings/supplier','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Supplier-edt','编辑供应商','Billings/Suppliers','5','billings/supplier','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/Suppliers-del','删除供应商','Billings/Suppliers','5','billings/suppliers','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/BrandManager-add','新增品牌','Billings/BrandManagers','5','billings/brandmanager','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/BrandManager-edt','编辑品牌','Billings/BrandManagers','5','billings/brandmanager','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/BrandManagers-del','删除品牌','Billings/BrandManagers','5','billings/brandmanagers','1');
insert into sys_right(add_date,add_by,right_code,right_name,parent_code,menu_type,url,is_available) value(now(),'init','Billings/MajorAccessoryType','编辑配件大类','Billings/AccessoryType','5','billings/majoraccessorytype','1');

# 2、默认的 sys_default_role_right 角色权限数据
# 只初始化角色，不初始化权限
# sys_admin 的权限为商户所对应的商户级别的权限
# sys_manager 的权限为其父角色(sys_admin)的权限
# sys_staff 的权限默认为空,由商户自行设置
truncate table sys_default_role_right;
insert into sys_default_role_right(role_code, parent_code, role_name, right_code, is_system, add_date, add_by)
value('sys_admin', '', '管理员', 'sys_admin', 1, now(), 'init_role');
insert into sys_default_role_right(role_code, parent_code, role_name, right_code, is_system, add_date, add_by)
value('sys_manager', 'sys_admin', '店长', 'sys_admin', 0, now(), 'init_role');
insert into sys_default_role_right(role_code, parent_code, role_name, right_code, is_system, add_date, add_by)
value('sys_staff', '', '普通员工', 'sys_staff', 0, now(), 'init_role');

# 3、转换默认用户账号: user => user_staff
# 将未转换的客户的账号转入到商户员工表中
insert into user_staff(wid, name, login_id, password, is_system, role_code, created_at, deleted)
select p.id as wid, /* lbs.id as lbsid, */'管理员' as name, u.un as login_id, u.pwd as password, 1 as is_system, 'sys_admin' as role_code, now() as created_at, 0 as deleted
from user u left join pubs p on u.id = p.uid
#left join (select l.wid, min(l.id) as id from lbs l inner join pubs ps on l.wid = ps.id) lbs on p.id = lbs.wid
where p.id > 0 and
u.un not in (select distinct login_id from user_staff where is_system = 1);

# 4、初始化默认的参数配置数据
truncate table customer_configs;
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isAllowNegativeStock', 1, '是否允许负库存', now(), 'init');
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isOutputAfterConfirm', 0, '是否需要确认后再出库', now(), 'init');
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isConfirmCollectCash', 0, '是否需要确认收款', now(), 'init');
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isShowCarKey', 0, '是否显示钥匙号', now(), 'init');
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isShowSettleState', 1, '采购入库单是否显示“结算状态”，若不显示，则默认为“未结算”', now(), 'init');
insert into customer_configs(wid, name, value, remark, add_date, add_by) value (0, 'isMatchServiceID', 1, '开单选择会员卡时，是否按服务项目匹配显示会员卡', now(), 'init');


select '04-DONE';