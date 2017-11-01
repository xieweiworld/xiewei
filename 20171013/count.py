#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd

np.random.seed(1)
s = pd.Series(np.random.normal(size=4))   # 正态分布
# print(s)

# 按照索引降序排序
print(s.sort_index(ascending=False))

# 按照某个值降序排序
print(s.sort_values(ascending=False))


