# 初始化数据

####################################
## 本文件整体允许连续重复执行
####################################

set @business = '广州尊熹';

# 2017-07-27

################################################################################################################################
############     查询要复制或处理的数据
################################################################################################################################
/*

#【复制：供应商】# （2357,2358,2401,2567,2723,2734,2740）
select * from order_supplier where wid = 3297 and id in (2567); # 由#3621 复制到 #3635
#【复制：配件】# (39663,37962,37969,45273,46944,47321)
select * from order_product where wid = 3297 and id in (39663,37962,37969,45273,46944,47321); # 由#3621 复制到 #3635
#【调整供应商ID：入库单中对应的供应商】 # 调整#3635门店的即可
select * from order_product_in where wid = 3297 and store_id = 3635 and supplier_id in (2567); 
#【调整配件ID：入库明细的对应配件ID】 # 调整#3635门店的即可
select * from order_product_in_detail where wid = 3297 and store_id = 3635 and product_id in (39663,37962,37969,45273,46944,47321);
#【调整配件ID：出库明细的对应配件ID】 # 调整#3635门店的即可
select * from order_product_out_detail where wid = 3297 and store_id = 3635 and product_id in (39663,37962,37969,45273,46944,47321);
#【调整配件ID：开单配件消耗表的对应配件ID】 # 调整#3635门店的即可
select * from order_product_expense where wid = 3297 and store_id = 3635 and product_id in (39663,37962,37969,45273,46944,47321);

*/

################################################################################################################################
############     最终处理过程
################################################################################################################################
###############   脚本转换处理
# 目标商户、门店，源门店
set @wid_zunxi = 3297;
set @store_from = 3621;
set @store_to = 3635;

# 复制供应商  -  不重复复制
insert into order_supplier(source_id, wid, store_id, name, contacts, phone, addr, email, bank_name, account_name, bank_account, note, status, is_delete, add_date, add_by)
select id as source_id, wid, @store_to as store_id, name, contacts, phone, addr, email, bank_name, account_name, bank_account, note, status, is_delete, now() as add_date, 'copy' as add_by
from order_supplier
where wid = @wid_zunxi and store_id = @store_from
and id not in (select source_id from order_supplier where wid = @wid_zunxi and store_id = @store_to and source_id > 0)
and id in (2567)
;

# 复制配件  -  不重复复制
insert into order_product(source_id, wid, store_id, supplier_id, product_type, product_code, product_name, product_brand, product_model, product_pinyin, product_chars, status, is_barcode, suit_car_type, warehouse, repository, amount, usable_amount, warning_amount, unit, price, last_price, single_price, commission_type, commission_ratio, sort_no, is_delete, add_date, add_by)
select id as source_id, wid, @store_to as store_id, supplier_id, product_type, product_code, product_name, product_brand, product_model, product_pinyin, product_chars, status, is_barcode, suit_car_type, warehouse, repository, amount, usable_amount, warning_amount, unit, price, last_price, single_price, commission_type, commission_ratio, sort_no, is_delete, now() as add_date, 'copy' as add_by
from order_product 
where wid = @wid_zunxi 
and id not in (select source_id from order_product where wid = @wid_zunxi and store_id = @store_to and source_id > 0)
and id in (39663,37962,37969,45273,46944,47321)
; 

#【调整供应商ID：入库单中对应的供应商】 # 调整#3635门店的即可  -  不重复更新
#select pin.*, s.* from 
update
order_product_in pin inner join order_supplier s on pin.wid = s.wid and pin.store_id = s.store_id and pin.supplier_id = s.source_id
set pin.supplier_id = s.id
where pin.wid = @wid_zunxi and pin.store_id = @store_to 
and pin.supplier_id != s.id
and pin.supplier_id in (2567)
; 

#【调整配件ID：入库明细的对应配件ID】 # 调整#3635门店的即可  -  不重复更新
#select * from 
update
order_product_in_detail pid inner join order_product p on pid.wid = p.wid and pid.store_id = p.store_id and pid.product_id = p.source_id
set pid.product_id = p.id
where pid.wid = @wid_zunxi and pid.store_id = @store_to 
and pid.product_id != p.id
and product_id in (39663,37962,37969,45273,46944,47321)
;

#【调整配件ID：出库明细的对应配件ID】 # 调整#3635门店的即可  -  不重复更新
#select * from 
update
order_product_out_detail pod inner join order_product p on pod.wid = p.wid and pod.store_id = p.store_id and pod.product_id = p.source_id
set pod.product_id = p.id
where pod.wid = @wid_zunxi and pod.store_id = @store_to 
and pod.product_id != p.id
and product_id in (39663,37962,37969,45273,46944,47321)
;

#【调整配件ID：开单配件消耗表的对应配件ID】 # 调整#3635门店的即可  -  不重复更新
#select * from 
update
order_product_expense pe inner join order_product p on pe.wid = p.wid and pe.store_id = p.store_id and pe.product_id = p.source_id
set pe.product_id = p.id
where pe.wid = @wid_zunxi and pe.store_id = @store_to 
and pe.product_id != p.id
and product_id in (39663,37962,37969,45273,46944,47321)
;

#【调整配件ID：开单配件消耗条码表的对应配件ID】 # 调整#3635门店的即可  -  不重复更新
#select * from 
update
order_product_expense_code pe inner join order_product p on pe.wid = p.wid and pe.store_id = p.store_id and pe.product_id = p.source_id
set pe.product_id = p.id
where pe.wid = @wid_zunxi and pe.store_id = @store_to 
and pe.product_id != p.id
and product_id in (39663,37962,37969,45273,46944,47321)
;


# 2017-07-27

select '04' as 'Index', @business as 'Type', 'Update Data' as 'Title', 'Done' as 'Status';

