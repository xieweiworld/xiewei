#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pymysql
import pandas as pd
data = pd.read_csv('../20171025/app_token.csv', names=['id', 'token', 'wid', 'store_id', 'store_name', 'staff_id', 'dept_id',
                                           'manage_stores_name', 'name', 'tel', 'passSalt'])

print(data[['id', 'token']])
# print(data.wid.value_counts())
# print(data.dtypes)
# data = data.astype({'wid': 'object', 'store_id': 'object'})

# 离散型变量,交叉统计表
# print(pd.crosstab(index=data.wid, columns=data['store_id']))