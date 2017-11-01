#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import numpy as np
import pandas as pd

# noinspection PyShadowingBuiltins
# list = [1, 3, 5]
# series = pd.Series(list)
# print(series + 10)

np.random.seed(1)
s1 = pd.Series(np.random.randint(low=1, high=10, size=5))
print(s1)

# 去倒数的方式取元素
print(s1.iat[-3], '\n')  # 取倒数第三个数字
print(s1[-3:])  # 取出倒数第三个数以及之后的所有的元素


