import urllib.request
from bs4 import BeautifulSoup
import time

num = 1
start_time = time.time()

url = 'https://read.douban.com/search?q=%E6%95%B0%E6%8D%AE&start='
for i in range(0, 30, 10):
    html = urllib.request.urlopen('https://read.douban.com/search?q=%E6%95%B0%E6%8D%AE&start={}'.format(i))
    bs0bj = BeautifulSoup(html, 'lxml')
    print(bs0bj)
    print('==============='+'第%d页' % (i/10+1)+'================')
    title_node_list = bs0bj.findAll("div", class_="title")
    print(title_node_list)