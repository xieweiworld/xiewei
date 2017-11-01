#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np

np.random.seed(1234)

# 描述统计就是这么简单啊！
s = pd.Series(np.random.randint(10, 30, 100))
# print(s.describe())
# isnull函数可以判断序列中是不是有缺失值

print(s.min())  # 最小值
print(s.max())  # 最大值
print(s.median(), '\n')  # 中位数
print(s.mode(), '\n')  # 中数
print(s.mean())  # 平均数
print(s.std())  # 标准差
print(s.var())  # 方差
