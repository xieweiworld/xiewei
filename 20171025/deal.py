#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pymysql
import pandas as pd
data = pd.read_csv('app_token.csv', names=['id', 'token', 'wid', 'store_id', 'store_name', 'staff_id', 'dept_id',
                                           'manage_stores_name', 'name', 'tel', 'passSalt'])

# print(data.head())
# 取出token列
# print(data['token'].head())  # 索引取
# print(data.token.head()) # 点取法
# print(data.loc[(data.wid == 500) & (data.id == 1046)])  # 根据条件拿出相应的数据


'''
需要注意的是:多个变量的筛选,可以是(|)或者关系,也可以是且(&的关系,但是一定要用圆括号括起来
'''

print(data.loc[(data.wid == 500) & (data.id > 1046), ['token', 'wid']])

# 取出前五行
# print(data.loc[0:5, ])
# 取出前五行, 第三与第五列
# print(data.iloc[0:5, [1, 3]])
'''
drop 函数
'''

# print(data.drop(['id'], axis=1).head())
# data.rename(columns={'id': 'nothing'}, inplace=True)
# print(data.head())

data = pd.DataFrame({'id': range(4), 'age': ['1', '34', '5', '5'], 'income': ['1000', '5000', '4000', '3000']})
data = data.astype({'age': 'float', 'income': 'float'})
# print(data.dtypes)

'''
五: 数据的排序
'''
# 可以随意的按照某个变量的升序或者是降
print(data.sort_values(by=['age'], ascending=[True]))
