

#####  【已发布，请不要重复执行】   #####


##### 查询操作
#### 查询 有出库记录明细id，但配件消耗表中未记录到该出库明细记录id 的开单配件消耗表数据
SELECT DISTINCT pe.id, pe.wid, pe.product_id, pe.out_detail_id, pe.order_id, po.out_typeid, pod.out_order_id, pod.id AS outdetailid, pod.product_id FROM
# UPDATE
	order_product_expense pe
INNER JOIN order_billing ob ON pe.wid = ob.wid
AND pe.order_id = ob.id
INNER JOIN order_product_out po ON pe.wid = po.wid
AND pe.order_id = po.out_typeid
INNER JOIN order_product_out_detail pod ON po.wid = pod.wid
AND po.id = pod.out_order_id
AND pe.product_id = pod.product_id
# SET pe.out_detail_id = pod.id
WHERE
	pe.wid > 0
and pe.out_detail_id = 0
AND pe.out_detail_id != pod.id
AND pe.is_delete = 0
AND ob.wid > 0
AND ob.order_type = 1
AND ob.is_out = 1
AND ob.is_delete = 0
AND ob.is_revert = 0
AND po.out_type = 1
AND pod.out_order_id IS NOT NULL
AND pod.is_delete = 0
AND date(now()) = '2017-02-28';

#### 查询 出库明细的出库单价与开单配件中的出库单价不匹配 的出库明细数据
SELECT 	e.id, e.wid, e.product_id, e.product_name, e.amount, e.price, e.discount, e.discount_price, d.out_price FROM
# UPDATE
order_product_out_detail d
INNER JOIN order_product_expense e ON e.out_detail_id = d.id
# SET d.out_price = e.price * e.discount / 10
WHERE
	e.wid > 0
AND e.price * e.discount / 10 != d.out_price
AND d.out_price = e.amount * e.price * e.discount / 10  # 此为计算的错误的出库明细出库总价
AND date(now()) = '2017-02-28';


##### 更新操作
#### 查询 有出库记录明细id，但配件消耗表中未记录到该出库明细记录id 的开单配件消耗表数据
 SELECT DISTINCT pe.id, pe.wid, pe.product_id, pe.out_detail_id, pe.order_id, po.out_typeid, pod.out_order_id, pod.id AS outdetailid, pod.product_id FROM
# UPDATE
	order_product_expense pe
INNER JOIN order_billing ob ON pe.wid = ob.wid
AND pe.order_id = ob.id
INNER JOIN order_product_out po ON pe.wid = po.wid
AND pe.order_id = po.out_typeid
INNER JOIN order_product_out_detail pod ON po.wid = pod.wid
AND po.id = pod.out_order_id
AND pe.product_id = pod.product_id
# SET pe.out_detail_id = pod.id
WHERE
	pe.wid > 0
and pe.out_detail_id = 0
AND pe.out_detail_id != pod.id
AND pe.is_delete = 0
AND ob.wid > 0
AND ob.order_type = 1
AND ob.is_out = 1
AND ob.is_delete = 0
AND ob.is_revert = 0
AND po.out_type = 1
AND pod.out_order_id IS NOT NULL
AND pod.is_delete = 0
AND date(now()) = '2017-02-28';

#### 查询 出库明细的出库单价与开单配件中的出库单价不匹配 的出库明细数据
 SELECT 	e.id, e.wid, e.product_id, e.product_name, e.amount, e.price, e.discount, e.discount_price, d.out_price FROM
# UPDATE
	order_product_out_detail d
INNER JOIN order_product_expense e ON e.out_detail_id = d.id
# SET d.out_price = e.price * e.discount / 10
WHERE
	e.wid > 0
AND e.price * e.discount / 10 != d.out_price
 AND d.out_price != e.amount * e.price * e.discount / 10  # 此为计算的错误的出库明细出库总价
AND date(now()) = '2017-02-28';
