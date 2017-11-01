#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import numpy as np
# 随机数生成 numpy的子模块random提供了许多生成随机数的方法
# 离散分布， 二项分布：在概率学和统计学中，二项分布是n个独立

np.random.seed(123)
# 二项分布
r1 = np.random.binomial(n=10, p=0.2, size=10)

print(r1, '\n')
r2 = np.random.binomial(n=10, p=0.2, size=(3, 5))

print(r2)