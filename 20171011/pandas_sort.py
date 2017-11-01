#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import numpy as np
import pandas as pd
import time
np.random.seed(23)
start = time.time()

s1 = pd.Series(np.random.randint(size=5, low=1, high=100))
print(s1, '\n')

# 布尔索引
print(s1[s1 > 50], '\n')

# 大于40， 小于60的数字
print(s1[s1 > 50][s1 < 70], '\n')

end = time.time()
print(end)
print(end-start)