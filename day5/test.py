#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# noinspection PySingleQuotedDocstring,PySingleQuotedDocstring
'''
根据歌手找出所有的专辑
'''
import requests
from bs4 import BeautifulSoup
from day5 import sql
import time


html = '<div class="u-cover u-cover-alb3" title="等我遇见你">' \
       '<img src="http://p3.music.126.net/6OxXubL_DGl3fyOWlgIsWg==/1411772937174897.jpg?param=120y120">' \
       '<a href="/album?id=34670170" class="msk"></a>' \
       '<a class="icon-play f-alpha" href="javascript:;" title="播放"' \
       ' data-res-action="play" data-res-type="19" data-res-id="34670170"></a></div>'

soup = BeautifulSoup(html, 'html.parser')
headers = {
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, sdch',
        'Accept-Language': 'zh-CN,zh;q=0.8',
        'Connection': 'keep-alive',
        'Cookie': 'vjuids=5a3b3fa87.15ccf2a85ac.0.58bbbd62abb9d; vjlast=1498124289.1498124289.30; _ntes_nnid=828896474bfbb2dac82d54de7ae8ce53,1498124289473; _ntes_nuid=828896474bfbb2dac82d54de7ae8ce53; __s_=1; vinfo_n_f_l_n3=ca37a9dd42f12434.1.0.1498124289493.0.1498124435459; nteslogger_exit_time=1498124438803; NTES_PASSPORT=lAFEvbelHfTqBSTxb01PiDzSTa4V8V0SWmxVNUYpfXaKJYRBJ0rMWQzmWYnEMvO_9iDY9R4aBkTi462iW.huhONDjlMLVhsBGRhfMQpAwJEKUjSOfG8gpJknFxy9o4fni; P_INFO=xieweiworld@yeah.net|1502935300|1|study|00&99|null&null&null#gud&440300#10#0#0|&0||xieweiworld@yeah.net; JSESSIONID-WYYY=2%2FHytDm%5C61XqSg4Q8lE%2BS36qOhw%2FPJp3P0Q%5CHytd63iGW%5CDKDNbzlmwnZCHvj%5CDuicXFH31gtQUe2n7kWGwZ516RQ1WPNmOl1ZZo6hO2AJNfr92BxJc68PTefdDBu5b%2Fl%2Fyiz%2FJAfeA4%2BposEpSPuHF59Azba9sX6mm66EUoUwf6TxCj%3A1503652393325; _iuqxldmzr_=32; __utma=94650624.862669832.1502437501.1503648854.1503651163.3; __utmb=94650624.53.10.1503651163; __utmc=94650624; __utmz=94650624.1502437501.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)',
        'Host': 'music.163.com',
        'Referer': 'http://music.163.com/',
        'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3226.400 QQBrowser/9.6.11681.400'
    }

soup = soup.div
print(soup)
img = soup.find_all('img')[0]['src']
art_id = soup.find_all('a', attrs={'class': 'icon-play f-alpha'})
print(art_id[0]['data-res-id'])

print(img)

# sql.update_album(35450297)