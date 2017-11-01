#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pandas as pd
'''
演示数据的去重检查
'''
data = pd.DataFrame({'name': ['liu', 'li', 'li', 'liu'], 'age': [12, 23, 44, 12], 'gender': ['M', 'M', 'M', 'M']})

# print(data.duplicated())

print(data.duplicated(subset='name'))
'''
根据key删除相应的值
'''
print(data.drop_duplicates(subset='name'))