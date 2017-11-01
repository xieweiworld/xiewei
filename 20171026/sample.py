#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd

data = pd.DataFrame(
    [[5.1, 3.5, 1.4, 0.2, 'name'],
     [4.2, 3.9, 1.6, 0.2, 'name'],
     [4.9, 5.9, 1.5, 0.2, 'name'],
     [4.5, 3.9, 1.3, 0.2, 'name'],
     [4.2, 6.9, 1.4, 0.2, 'name'],
     ],
    columns=['sepal.Length', 'sepal.Width', 'petal.Length', 'petal.width', 'Species']
)
# 训练集

train = data.sample(frac=0.8, random_state=1)
print(train)

# print(data.index.isin(train.index))

# 测试集 ~ 代表取反的意思
test = data.loc[~data.index.isin(train.index)]

print(train.shape)
print(test.shape)