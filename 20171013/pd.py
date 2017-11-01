#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pandas
import numpy as np
# 一个序列是否包含另外一个序列 np.in1d() pandas.isin()
# 序列元素的成员关系
arr1 = np.array([1, 2, 3, 4])
arr2 = np.array([10, 20, 3, 40])
print(arr1 + 10)
# print(np.in1d(arr1, arr2))


pd2 = pandas.Series([1, 2, 3, 4])
print(pd2[2])
s1 = pandas.Series(['a', 'b', 'c', 'd'])
s2 = pandas.Series(['e', 'b', 'f', 'g'])

print(s1.isin(s2))
print(np.in1d(s1, s2))   # np的in1d也是可以比较序列之间的关系


# 如果有一组离散变量，查看该序列有那些水平，以及各个水平的频次
# 序列去重以及水平统计

np.random.seed(10)
s = pandas.Series(np.random.randint(1, 30, 1000))

# 排重
print(pandas.unique(s))
# 水平统计
print(s.describe())  # sort=False可以控制排序




