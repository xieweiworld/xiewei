#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# transform string to datetime
import datetime

string = '2017/09/26 11:39:00'
d = '2017-09-26'

str2datetime = datetime.datetime.strptime(string, '%Y/%m/%d %H:%M:%S').date()
str2date1 = datetime.datetime.strptime(d, '%Y-%m-%d')
str2date2 = datetime.datetime.strptime(d, '%Y-%m-%d').date()

print(str2datetime)
print(str2date1)
print(str2date2)

# list 类型

lst = [1, 2, 3, 'a', 'b', 'c', '2017-09-26 00:00:00']

print(lst[0])
print(lst[0:2])
print(lst[:4])
print(lst[3:])
print(lst[::-1])  # 翻转list

# 增加

lst.append('xw'); print(lst)
lst.insert(5, 'm'); print(lst)
lst.extend(['2222', '33333'])  # 末尾插入多个元素，以list格式呈现
print(lst)

# lst.copy()
# lst.pop() 从末尾或者是指定的位置删除字典的值
# lst.remove() 移除指定的值
# lst.clear() 清除指定的值
# del lst 删除整个list
'''
修改
'''
lst = [1, 2, 3, 'a', 'b', 'c', '2017-09-26 00:00:00']
lst[2] = '可惜我不是水平座'
print(lst)
lst[3:4] = ['大城小事', '野孩子']
print(lst)

'''
其他的方法
'''
lst = ['b', 2, '可惜我不是水平座', '大城小事', '野孩子', 'b', 'c', '2017-09-26 00:00:00']
print(lst.count('b'))  # 计数的方法
print(lst.index('c'))  # 如果有多个相同的元素，会返回第一个元素

# lst.reverse()  # 反转函数
lst = [1, 2, 3, 6, 3, 2]
lst.sort(reverse=False)  # 排序reverse = True为降序 
print(lst)






