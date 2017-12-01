#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
from requests.exceptions import ReadTimeout, ConnectionError, RequestException
from bs4 import BeautifulSoup
import time

# noinspection PyMethodMayBeStatic,PyUnusedLocal
class QSBK:
    def __init__(self):
        self.pageIndex = 1
        self.user_agent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36' \
                          ' (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36'
        # 初始化headers
        self.headers = {'User-Agent': self.user_agent}

        # 存储段子
        self.story = []

    # noinspection PyPep8Naming
    def getPage(self, pageIndex):
        url = 'http://www.qiushibaike.com/hot/page/' + str(pageIndex)
        try:
            response = requests.get(url, headers=self.headers, timeout=5)
            print("连接糗事百科", url)
            if response.content:
                return response.content.decode()
            else:
                return ''
        except ReadTimeout:
            print("连接糗事百科失败,错误原因", 'Timeout')
        except ConnectionError:
            print("连接糗事百科失败,错误原因", 'Connection error')
        except RequestException:
            print("连接糗事百科失败,错误原因", 'Error')

    # noinspection PyPep8Naming
    def getStoryItems(self, pageIndex):
        html = self.getPage(pageIndex)
        item = BeautifulSoup(html, 'lxml')
        # 获取每个div
        eachItem = item.select('#content-left .article')
        # 获取信息保存在list里面

        for soup in eachItem:
            # noinspection PyShadowingNames
            content = soup.select_one('.content span').text.strip()
            name = soup.select_one('.author img')['alt'].strip()
            portrait = 'https:' + soup.select_one('.author img')['src'].strip()
            self.story.append('{0}|{1}|{2}'.format(name, portrait, content))


spider = QSBK()
for x in range(1, 300):
    spider.getStoryItems(x)
    # 睡眠一次
    time.sleep(1)

content = spider.story
# 写入文件夹
with open('list.csv', 'a', encoding='utf-8') as m:
    for text in content:
        # noinspection PyTypeChecker
        m.write(text + '\n')
    m.close()


