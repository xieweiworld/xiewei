#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pymysql
import pandas as pd
# data = pd.read_csv('app_token.csv', names=['id', 'token', 'wid', 'store_id', 'store_name', 'staff_id', 'dept_id',
                                           # 'manage_stores_id', 'manage_stores_name', 'name', 'tel', 'passSalt'])
# print(data.describe(include=['object']))  # 离散变量
# print(data.describe(include=['number']))  # 数值型变量
# print(data.info())


connect = pymysql.connect(host='112.74.77.128', user='root', password='ms12345', database='dev_api_01', charset='utf8')

data = pd.read_sql('select id, name from app_token', connect)
print(data.dtypes)