# noinspection PySingleQuotedDocstring,PySingleQuotedDocstring
'''
根据歌曲ID把所有的评论全部提取
'''

import requests
from day5 import sql
import time
import threading
import pymysql.cursors

class Comments(object):
    headers = {

    }



