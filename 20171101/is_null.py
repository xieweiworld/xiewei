#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd

# 构建数据集
data = pd.DataFrame([[1, 2, 3, 4],
                     [np.nan, 6, 7, np.nan],
                     [11, np.nan, 12, 13],
                     [100, 200, 300, 400],
                     [20, 40, 60, np.nan]], columns=['x1', 'x2', 'x3', 'x4'])


# 查看整个数据集有没有空值

# print(any(data.isnull()))
is_null = []  # 列的数据是不是有空值
for item in data.columns:
    is_null.append(any(data[item].isnull()))

print(is_null)

# 行的数据是不是有空值
print(data.iloc[0, :]) # 第一行
