#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# timeOut = 10
# 学习requests库

import requests

def timeout_request():
    url = 'https://mp.weixin.qq.com/s/54fQScsNn9Sg-G02CEoaOw'
    res = requests.get(url=url, verify=False)
    print(res.content)
    # with open('x.jpg', 'wb') as f:
    #     f.write(res.content)

timeout_request()
