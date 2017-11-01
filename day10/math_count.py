#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
# 数学领域的线性代数，傅里叶变换；统计学领域的统计计算，随机数生成等
arr1 = np.array([1, 3, 5, 7, 9])
# print(arr1[1])

arr2 = np.array((10, 20, 30, 40, 50))
# print(arr2)

arr3 = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
print(arr3, '\n')
# 获取矩阵的某列
# print(arr3[:, 3])

# print(arr3[1, :])  # 获取矩阵的某行 ,有逗号跟没有都逗号就是某个

# 也是可以获取某几行
print(arr3[[0, 1], :])

# 获取具体的某行某列元素
print(arr3[[0, 2], [2, 3]], '\n')

#
print(arr3, '\n')
# 获取具体的某几行某几列元素
# 取两次索引
# print(arr3[[0, 2], :][:, [2, 3]])

# print(arr3[np.ix_([0, 2], [2, 3])])

# apply_along_axis() 针对某个轴的方向进行函数的操作
print(np.apply_along_axis(func1d=np.mean, axis=1, arr=arr3))  # 某一行的均值
print(np.apply_along_axis(func1d=np.sum, axis=0, arr=arr3))  # 某一列的


# 随机数生成 numpy的子模块random提供了许多生成随机数的方法
# 离散分布， 二项分布：在概率学和统计学中，二项分布是n个独立