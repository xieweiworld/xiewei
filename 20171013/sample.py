#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import numpy as np
import pandas as pd
'''
抽样是数据分析中常用的方法，通过从总体中抽取一定的样本来推断总体的水平；
或者通过抽样将数据拆分成两部分，一部分建模，一部分测试。pandas模块提供了sample函数帮我们完成抽样的任务
s.sample(n=None, frac=None, replace=False, weights=None, random_state=None)
n:指定抽取的样本量
frac:指定抽取的样本比例
replace:是否放回样本抽样，默认等概率抽样
random_state:指定抽样的随机种子
'''

s = pd.Series(range(0, 101))
# 从0 - 100里面随机抽取三个数字并且不放回
m = s.sample(n=3, random_state=2)  # 加了随机种子，每次抽样的结果是一样的
# print(m)
# 从0 - 100里面随机抽取三个数字， 每抽取一次都放回去
n = s.sample(n=3, replace=True, random_state=2)  # 加了随机种子，每次抽样的结果是一样的
# print(n)

s = pd.Series(['male', 'female', 'gay'])
m = s.sample(frac=10, replace=True, weights=[0.2, 0.5, 0.3], random_state=3)
print(m)

