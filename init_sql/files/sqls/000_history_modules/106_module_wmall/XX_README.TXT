新版商城SQL脚本摘要说明：
1、创建新表：新版商城相关的表
   wmall/01_create_tables.sql

2、修改表结构：业务相关的字段、数据转换相关的字段
   wmall/02_alter_tables.sql

3、更新数据：
   wmall/03_update_data.sql
	1)平台服务表(ditu_fuwu): 只保留四类:洗车(1001)、维修(1002)、保养(1003)、精品(1004)；其他的标记为删除
	2)将有订单的商户表标记为国寿合作商户：pubs.is_chinalife=1

4、优化转换旧商品到新商品(会员卡商品type=1;非会员卡商品type=0,但当做精品处理)
    1)商品：ai9me_product => wmall_product （保留原商品ID）
      条件：token > 0 and shift_status = 0
    2)商品分类：ai9me_product => wmall_product_category
      条件：token > 0 and shift_status = 0
      转换后：自增ID从 6000 开始。
    3)商品图片：ai9me_product => wmall_product_image
      条件：token > 0 and shift_status = 0 and length(logourl) > 0

5、转换服务项目商品到新商品(服务项目类商品type=3)
    1)商品：fuwulist => wmall_product
      条件：wid > 0 and shift_status = 0
    2)商品分类：服务项目类的不用转
    3)商品图片：fuwulist(fl) + wmall_product(wp) => wmall_product_image
      条件：fl.wid > 0 and fl.shift_status = 0 and wp.type = 3 and length(fl.pic) > 0
    4)商品服务：wmall_product + wmall_product_service(ws) => wmall_product_service
      条件：type = 3 and attach_id >= 0 and ws.id is null
    5)转换后：将 wmall_product 自增ID设置为从 30000 开始。

6、转换抢购订单到新商城订单(商品订单type=1)
    1)抢购订单：dsqgrecord => wmall_order
      条件：wid > 0 and shift_status = 0
    2)订单支付信息：wmall_order(wo) + dsqgrecord(dr) => wmall_order_payinfo
      条件：wo.order_type = 1 and dr.wid > 0 and dr.shift_status = 0
    3)订单商品信息：wmall_order(wo) + dsqgrecord(dr) + wmall_product(wp) + customer_services(cs) => wmall_order_product
      条件：wo.order_type = 1 and dr.wid > 0 and dr.shift_status = 0
    4)订单服务表：wmall_order(wo) + dsqgrecord(dr) + wmall_product(wp) + customer_services(cs) => wmall_order_service
      条件：wo.order_type = 1 and dr.wid > 0 and dr.shift_status = 0

7、转换预约订单到新商城订单(预约订单type=2)
   1)预约订单：yyfw_records => wmall_order
     条件：wid > 0 and shift_status = 0
   2)订单服务表：yyfw_records(y) + customer_services(s) => wmall_order_service
     条件：y.wid > 0 and y.shift_status = 0
   3)无须转订单商品表。
   4)订单支付信息。

8、转换商城首页轮播图
   1)转播图1、2、3：ai9me_product_set => wmall_set_banner
     条件：
     token > 0 and shift_status = 0 and newhaibao is not null and newhaibao != '';
     token > 0 and shift_status = 0 and newhaibao1 is not null and newhaibao1 != '';
     token > 0 and shift_status = 0 and newhaibao2 is not null and newhaibao2 != '';

9、转换商户及会员卡券(type=1) 【旧卡券全是抵扣券，全转为代金券】
   1)转换商户的卡券：member_coupon => wmall_coupon
     条件：wid > 0 and price > 0 and shift_status = 0
   2)转换会员的卡券：member_couponlist => wmall_coupon_list
     条件：wid > 0 and price > 0 and shift_status = 0
   3)转换后：将 wmall_coupon 自增ID设置为从 1000 开始


10、转换赠送金额为代金券(type=1)，【转换日为有效日，有效期为1年】
   1)转换赠送金额为商户卡券：member_giftamount => wmall_coupon
     条件：wid > 0 and amount > 0 and shift_status = 0
   2)转换赠送金额为会员卡券：member_giftamount => wmall_coupon_list
     条件：wid > 0 and amount > 0 and shift_status = 0
   3)转换后：将 wmall_coupon 自增ID设置为从 2000 开始



已知问题：
1、原商品表：ai9me_product => wmall_product
# product_set, isdiscount, keyword 未在新表中定义
# 不用转入。

2、抢购服务明细表：fuwudetail => wmall_product
# 不用转入。

3、商品 的 商品描述(intro)、注意事项(notice)，由PHP合并后另行生成 html 文件。
# 由PHP程序转换。

4、商品名称 的 拼音(pinyin)、首字母(chars)，由PHP另行生成。 
# 后期需要时处理。

