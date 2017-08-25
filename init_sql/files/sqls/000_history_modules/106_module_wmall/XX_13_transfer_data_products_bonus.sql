# 初始化数据

# 商城新版业务

# 2017-03-31

# 注意：这里的 category_id  是指 product_id
# 【无需更新】：卡片商品的提成数据：customer_bonus.category_id(type=3) 要被更新成 wmall_product.id(type=1)
# 原因：因为原表的id已统一存储为新表的id，新表的id从 10000 开始自增


# 2017-03-31

select '13_transfer_data_products_bonus Finished' as 'DONE';
