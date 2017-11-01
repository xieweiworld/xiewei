#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re

# re.findall(pattern, string, flags)
# pattern 正则表达式
# string 需要处理的字符串
# flags 说明匹配的模式，是否大小写re.l

# noinspection PyShadowingBuiltins
str = 'name:sim,Gender:f,age:27,address:Jiangsu,Edu:yjs'
keys = re.findall('([a-z]+):', str, re.I)
values = re.findall(':(\w+)', str)
myDict = {}
for x in range(0, len(keys)):
    myDict[keys[x]] = values[x]
print(myDict)

# compile 模块
# 查找所有单词中含有'o'的单词
s2 = 'oh,my god.python is an easy language ,do you like it?'

rules = re.compile('\w*o\w*')
print(rules.findall(s2))