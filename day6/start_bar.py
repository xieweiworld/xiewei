#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib
import requests
import codecs


# noinspection PyShadowingBuiltins,PyMethodParameters,PyPep8Naming,PyPep8,PyMethodMayBeStatic
class Get_start_bar(object):

    # noinspection PyPep8,PyPep8
    headers = {
        'Accept': 'application/json, text/plain, */*',
        'Accept-Encoding': 'gzip, deflate, sdch, br',
        'Accept-Language': 'zh-CN,zh;q=0.8',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
        'Cookie': 'PHPSESSID=c11dsoea6p938i36gc8uhqubs7; UM_distinctid=15e3c69f0d442c-0bf413ab771605-7b147e72-1fa400-15e3c69f0d5378; CNZZDATA1260467161=615952936-1504248321-%7C1504248321; Hm_lvt_ae08c458f9fb6c1b4d9d48785b56b978=1504252130; Hm_lpvt_ae08c458f9fb6c1b4d9d48785b56b978=1504252130; client=web; backUrl=U2FsdGVkX1%2FF9AnHnzQwLlvPfqpfAosgGVuReG2aLO7%2F48GHQKDtnZvYI88ZuTce; SERVERID=5f5075e5ded2f2630e8f277d4c87cd20|1504252122|1504252120',
        'Host': 'www.kaistart.com',
        'If-Modified-Since': 'keep-alive',
        'Referer': 'https://www.kaistart.com/',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3368.400 QQBrowser/9.6.11974.400',
    }

    # 获得url
    # noinspection PyMethodMayBeStatic
    def get_url(self, num):
        # noinspection PyPep8
        return 'GEThttp://120.55.197.143:8080/crowdfundingservice2/project/list?page=' + str(num) + \
               '&pagesize=10&markerid=&progress=&sort=&client=web-1www.kaistart.com'

    # md5加密字符串，返回的字段全部是小写
    # noinspection PyMethodMayBeStatic
    def md5_encode(self, str):
        m = hashlib.md5()
        m.update(str.encode('utf-8'))
        return m.hexdigest().lower()

    # 获取start网站的数据
    def get_start_data(self):
        all_data = []
        # 已知是1219条记录
        for num in range(1, 2):
            sign = self.get_url(num)
            url = 'https://www.kaistart.com/api/project/list?page=' + str(num) + \
                  '&pagesize=10&markerid=&progress=&sort=&client=web'
            self.headers['sign'] = self.md5_encode(sign)
            r = requests.get(url=url, headers=self.headers, verify=False)
            result = r.json()
            if not result:
                continue
            result = result['result']
            for item in result:
                markerName = item['markerName']  # 主题
                name = item['name']  # 名字
                digest = item['digest']  # 内容
                name_info = markerName + "^" + name + "^" + digest + "\n"
                all_data.append(name_info)

            print("第%d页抓取完毕!" % num)
            break
        return all_data

    # 将评论写入文本文件
    def save_to_file(self, list):
        with open('bar.txt', 'a', encoding='utf-8') as fw:
            for item in list:
                fw.write(item)
        print("写入文件成功!")


bar = Get_start_bar()
list = bar.get_start_data()




