#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pandas as pd

# 创建一个数据框
# s = pd.DataFrame([[1, 2, 3], [10, 20, 30], [100, 200, 300], [1, 10, 100]])
s = pd.DataFrame([[1, 2, 3], [10, 20, 30], [100, 200, 300], [1, 10, 100]], columns=['v1', 'v2', 'v3'])
# print(s)

# 通过字典创建数据集
s1 = pd.DataFrame({'id': [1, 2, 3], 'name': ['tom', 'lily', 'jim'], 'age': [12, 23, 44]}, columns=['id', 'name', 'age'])
print(s1)

s2 = pd.read_table('books.txt', sep=',')
print(s2.tail())



