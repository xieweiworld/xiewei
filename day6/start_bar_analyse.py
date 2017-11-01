#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import jieba
import matplotlib.pyplot as plt
import numpy as np
from matplotlib import mlab
from matplotlib import rcParams
import matplotlib

myFont = matplotlib.font_manager.FontProperties(fname='C:\Windows\Fonts\simsun.ttc')

subject = {}
with open('bar.txt', 'r', encoding='utf-8') as f:
    for line in f:
        line = line.strip().split('^')
        # print(line[0])
        # break
        if not line[0] or line[0] in [' ', '\t', '\n', '。', '，', '(', ')', '（', '）', '：', '□', '？', '！',
                                      '《', '》', '、', '；', '“', '”', '……']:
            continue
        if not line[0] in subject:
            subject[line[0]] = 0
        subject[line[0]] += 1

x = []
y = []

for item, value in subject.items():
    x.append(item)
    y.append(int(value))
print(y)
print(x)
plt.bar(range(len(y)), [207, 156, 217, 364, 266], color='rgb', tick_label=x)
plt.show()


