#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
from bs4 import BeautifulSoup
import re, os, sys

base_url = 'https://www.nvshens.com/ajax/girl_query_total.ashx'
'''
年龄区间[22, 45]
80-94
'''
condition = {'age': [22, 45], 'chest': [80, 90], 'waist': [52, 58], 'hip': [80, 90], 'height': [150, 170],
             'cup': [68, 71], 'country': ['中国', '台湾', '日本', '韩国', '新加坡', '马来西亚', '泰国', '越南'],
             'xingzuo': ['白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座',
                         '天秤座', '天蝎座', '射手座', '魔羯座', '水瓶座', '双鱼座']}

# noinspection PyPep8
headers = {
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',  # identity
    'Accept-Language': 'zh-CN,zh;q=0.8',
    'Connection': 'keep-alive',
    'Content-Length': '31',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie': 'records=%5B%7B%22id%22%3A%2219705%22%2C%22name%22%3A%22%u5218%u98DE%u513F%22%7D%2C%7B%22id%22%3A%2225321%22%2C%22name%22%3A%22%u5B89%u67D4Anrou%22%7D%2C%7B%22id%22%3A%2217704%22%2C%22name%22%3A%22%u8D75%u5F6D%u52C3%22%7D%2C%7B%22id%22%3A%2217876%22%2C%22name%22%3A%22%u674E%u5A77%22%7D%2C%7B%22id%22%3A%2219396%22%2C%22name%22%3A%22%u6298%u539F%u307F%u304B%22%7D%5D; Hm_lvt_f378865b660846b55ba91d29e1c4c04d=1511943082,1512007065,1512041630,1512092451; Hm_lpvt_f378865b660846b55ba91d29e1c4c04d=1512093520',
    'Host': 'www.nvshens.com',
    'Origin': 'https://www.nvshens.com',
    'Referer': 'https://www.nvshens.com/find/',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 '
                  '(KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36',
    'X-Requested-With': "XMLHttpRequest"
}

def get_params():
    # noinspection PyShadowingBuiltins
    list = []
    for x, y in condition.items():
        if len(y) == 2:
            for m in range(y[0], y[1]):
                list.append({x: str(m) + '-' + str(m + 1)})
        break
    return list


# noinspection PyPep8
def get_requests(param):
    param['pagesize'] = 20
    # noinspection PyBroadException
    print(param)
    proxies = {
        "records": '%5b%7b%22id%22%3a%2219705%22%2c%22name%22%3a%22%e5%88%98%e9%a3%9e%e5%84%bf%22%7d%2c%7b%22id%22%3a%2225321%22%2c%22name%22%3a%22%e5%ae%89%e6%9f%94Anrou%22%7d%2c%7b%22id%22%3a%2217704%22%2c%22name%22%3a%22%e8%b5%b5%e5%bd%ad%e5%8b%83%22%7d%2c%7b%22id%22%3a%2217876%22%2c%22name%22%3a%22%e6%9d%8e%e5%a9%b7%22%7d%2c%7b%22id%22%3a%2219396%22%2c%22name%22%3a%22%e6%8a%98%e5%8e%9f%e3%81%bf%e3%81%8b%22%7d%5d',
        "Hm_lvt_f378865b660846b55ba91d29e1c4c04d": "1511943082,1512007065,1512041630,1512092451",
        "Hm_lpvt_f378865b660846b55ba91d29e1c4c04d": "1512093520",
    }
    response = requests.post(url=base_url, params={'age': '22-27', 'curpage': 1, 'pagesize': 20},
                             headers=headers, cookies=proxies, timeout=10)
    print('正在访问', base_url)
    print(response.status_code)
    if response.content:
        return response.content.decode()
    else:
        print('无效地址', base_url)
    # try:  # 保证每个请求都有异常处理
    #     pass
    # except:
    #     return ''
    #     pass


# noinspection PyShadowingNames,PyUnresolvedReferences
def save_img(url, name, value):
    image_url = url.replace('_s', '')  # 获取大图
    print('正在下载', image_url)  # ！！很重要，获得一个调制信息
    # noinspection PyBroadException
    try:
        # noinspection PyPep8
        image_headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3538.400 QQBrowser/9.6.12501.400'
        }
        response = requests.get(image_url, headers=image_headers, timeout=10)
        if response.status_code == 200:
            print("请求图片成功")
            save_local_image(response.content, name, value)
        else:
            pass
        return None
    except:
        print('请求图片出错', imag_url)
        return None


# noinspection PyShadowingNames,PyUnusedLocal
def save_local_image(content, title, value):  # 创建对应分类的文件夹，并且保存图片。
    root_path = sys.path[0] + '/images'
    for x, y in value.items():  # 创建文件夹
        dir_path = '{0}/{1}/{2}'.format(root_path, x, y)
        if os.path.exists(dir_path):
            print('文件夹已经存在')
        else:
            os.makedirs(dir_path)

    file_path = '{0}/{1}.{2}'.format(dir_path, title, 'jpg')  # 保存的路径
    if not os.path.exists(file_path):
        with open(file_path, 'wb') as f:
            f.write(content)
            f.close()
        print("写入图片成功")
    else:
        print('图片已经存在')


# noinspection PyPep8
if __name__ == '__main__':
    total_page = 200
    params = get_params()
    for value in params:
        for page in range(1, total_page):
            value['curpage'] = page
            res = get_requests(value)
            # if res:
            #     soup = BeautifulSoup(res, 'lxml')
            #     soupHtml = soup.select('.girlli > .d-tmb')
            #
            #     if page == 1:
            #         page_count = soup.select('.pagesYY a')[-1]['onclick']  # 获取onclick的页数
            #         total_page = re.compile('[1-9]\d*').findall(page_count)[0]  # 获取所有的页数数字
            #         print('总页数' + total_page)
            #
            #     for single in soupHtml:
            #         picture = single.select_one('img')['src']
            #         name = single.select_one('div > a').text
            #         save_img(picture, name, value)
            #         # print('图片地址:' + picture + ' 名字:' + name)
            # else:
            #     print('url请求没有返回结果错误')

            break

        break

