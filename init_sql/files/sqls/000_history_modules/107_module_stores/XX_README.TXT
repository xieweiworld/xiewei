多门店业务SQL脚本摘要说明：

零、多个门点有业务数据的商户有：

1、东莞金盛(#3211)：  --   已处理：可按其他正常单门店业务商户处理
门店最小ID不是目前的实际业务门店，有两单，可直接将接单人转入到管理员，把单挂到厚街店下。
（有作废的开单，不用处理，无法通过业务恢复）
	- 按最小门店处理，会有问题。
	- 先截图保存好该两单的列表及详情数据图片。
  - 保留数据的地址：http://project.yichefu.cn/index.php?m=doc&f=view&docID=314


2、深圳雷骏(#1499)   --  上线前：需要提前按以下建议方式处理
建议 将库存‘清除’掉，但提前通过‘盘点’功能直接导出后备份即可。
多门店上线后，可按门店管理各自配件库存。
可能出现的现象：历史开单数据（多门店）中涉及到的配件为 旧配件信息，与 后期导入后的门店的各自配件 无直接关系（哪怕是同名）。


3、广州尊熹(#3297)   --  库存、开单相关的数据要单独处理



一、新增数据表
1、新增：员工管理门店关系表（user_staff_admin_stores）
  商户id：wid, 
  员工id: staff_id, 
  门店id: store_id

2、新增：可办理卡片的门店表（wmall_product_handle_stores）
  商户id：wid, 
  商品id: product_id, 
  门店id: store_id
  【两类型暂不做，不存入数据】

3、新增：可适用(消费)卡片的门店表（wmall_product_consume_stores）
  商户id：wid, 
  商品id: product_id, 
  门店id: store_id
  【两类型暂不做，不存入数据】

4、新增：会员卡可消费的门店表（wmall_card_consume_stores）
  商户id：wid, 
  会员id: mid, 
  会员卡id: card_id, 
  门店id: store_id
  【两类型暂不做，不存入数据】

5、新增：会员积分兑换表 （member_point_exchanges）

6、新增：服务项目折扣表 （customer_services_discount）
  - 不区分会员等级的折扣设置，即也按设置一个会员等级级别来存储设置
  - 不用区分 门店id
  【服务项目不分门店、折扣也不分门店，由总店统一管理】


二、添加字段
1、CRM合同表（crm_contract）、商户设置表（customer_set）加字段：
  最大门店数(max_stores)

2、门店表（lbs）：
  简称：short_name
  类型：type 1总店(虚拟)，2门店(机构)，3部门，4小组(待扩展)
  编码：code ，默认为当前id
  父级(门店)：pid
  启用标记：is_enable
  全路径：full_path， /id/
  公共字段：add_date, add_by, update_date, update_by

3、部门表（user_staff_dep）
  所属门店：store_id
  显示顺序：sort_no
  启用标记：is_enable
  删除标记：is_delete
  公共字段：add_date, add_by, update_date, update_by

4、添加字段：商品表（如卡片）（wmall_product）
  所属门店：store_id
  可办理门店类型：handle_type: 1全部门店，2仅限本店，3指定门店
  可适用(消费)门店类型：consume_type: 1全部门店，2仅限办理本店，3指定门店
  【两类型暂不做，默认只存储1】

5、会员卡表（member_card）添加字段：
  可适用(消费)门店类型：consume_type: 1全部门店，2仅限办理本店，3指定门店

6、配件表（order_product）、
  供应商管理（order_supplier）、
  配件品牌管理(order_brand) 、
  角色表（customer_role）新增字段：
  所属门店：store_id
  由总店统一管理
  【暂不处理】
  
7、钥匙号设置（customer_carkeys）新增字段：
  所属门店：store_id

8、入库单（order_product_in）、
  出库单（order_product_out）、
  退货单（order_product_return）、
  盘点单（order_product_change）：
  所属门店：store_id

  【出库管理调拨暂不处理】
  入库单（order_product_in）: 新增 出库单id（out_order_id）
  出库单（order_product_out）: 新增 调入到的门店（in_store_id）

9、挂帐表（order_charge）、
  还款表（order_charge_repay）：
  所属门店：store_id

10、资金收入表（customer_money_in）、
  资金支出表（customer_money_out）：
  所属门店：store_id

三、扩充字段定义
1、商品表（wmall_product）
  扩展定义：type 6:积分商品
  由总店统一管理

2、单据申明设置: 暂使用商户设置表(customer_set)中的相应字段
  可由商户设置表(customer_set)中的相应字段按‘变量’替换规则处理。
  客户提出后再考虑改进
  【暂不处理】



四、已存在门店ID的业务表
1、会员卡表：member_card.lbs_id 办卡门店id
2、会员卡充值表：member_card_chongzhi.lbs_id 充值门店id
3、会员卡消费表：member_card_xiaofei.lbs_id 消费门店id
4、开单表：order_billing.lbs_id 开单门店
5、微信扫码付款表： customer_scancode_payinfo.lbsid 门店id



五、初始化：
1、已登录的商户，但没有门店数据
  初始化门店数据、初始化首次关注回复文字
2、初始化虚拟总店及full_path
3、初始化门店的所属店为总店
4、初始化管理员员工帐号所属店为总店
5、被子始化门店的full_path
6、初始化wmall_product: store_id, add_store
7、各种表的 store_id 数据


六、已知问题：
1、会员卡的办卡门店，续卡时，允许重新修改掉吗？首次办卡的门店
2、按指定门店办卡、消费：每次都以最新关系为准吗？生成新的卡咯
3、微信端积分兑换门店： 来源于积分商品的添加门店？线上申请兑换，线下实际取货（确认兑换）

