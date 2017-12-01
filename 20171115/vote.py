#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import json
import time
import re
from bs4 import BeautifulSoup
from PIL import ImageEnhance
import pytesseract
from pytesseract import *
from PIL import Image
from PIL import ImageEnhance
import re

filename = 'code0.gif'
image = Image.open(filename)
# 使用ImageEnhance可以增强图片的识别率
#  enhancer = ImageEnhance.Contrast(image)
# enhancer = enhancer.enhance(4)
image = image.convert('L')
text = pytesseract.image_to_string(image)
# 去掉非法字符，只保留字母数字
text = re.sub("\W", "", text)
print(type(text))
# image.save(filename)
print(text + '1')


# 请求头信息
headers = {
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Encoding': 'gzip, deflate, sdch',
    'Accept-Language': 'zh-CN,zh;q=0.8',
    'Cache-Control': 'max-age=0',
    'Connection': 'keep-alive',
    'Cookie': 'ICMS_VISIT_FLAG_COOKIE=2017-11-20_705551; PHPSESSID=jinihaue4ldlg8d5rna7n8ofr2',
    'Host': 'hd.changsha.cn',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4033.400 QQBrowser/9.6.12624.400',
}

# post表单网址
url = "http://hd.changsha.cn/default.php?mod=common&a=gen_gif_verify_code&sn=check_code15&n=0.16495506140959493"
#
# for x in range(2):
#     img = requests.get(url=url, headers=headers).content
#     with open('code' + str(x) + '.gif', 'wb') as f:
#         f.write(img)
#     time.sleep(2)

# def WriteIPadress():
#     all_url = []  # 存储IP地址的容器
#     # 代理IP的网址
#     url = "http://www.xicidaili.com/wn/"
#     res = requests.get(url=url)
#     print(res.content)
#     # 网页解析
#
#     soup = BeautifulSoup(res.content.decode(), 'lxml')
#     hot_artists = soup.select('tr')
#     for x in hot_artists:
#         all_url.append(x.select('td')[1].get_text())
#     with open("IP.txt", 'w') as f:
#         for i in all_url:
#             f.write(i)
#             f.write('\n')
#     return all_url
#
#
#
# WriteIPadress()
# f = open("IP.txt", 'r')
# for line in f:
#     # 去掉空格
#     line = line.strip()
#     print(line)

# 计数器
# count = 0
# while count < 4000:
#     all_url = WriteIPadress()
#     for i in all_url:
#         proxies = {"http": i}
#         try:
#             r = requests.post(url=url, data=params,
#                               headers=headers, proxies=proxies, timeout=10)
#             if(r.json()['flag'] == True):
#                 count += 1
#                 print("成功投票%d次！" % (count))
#             print(r.json())
#         except Exception as reason:
#             print("错误原因是：", reason)