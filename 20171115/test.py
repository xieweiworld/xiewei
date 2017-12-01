#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import pytesseract

from PIL import Image
import os
import sys

for x, y in {'age': '22-23'}.items():
    root_path = sys.path[0] + '/images'
    dir_path = '{0}/{1}/{2}'.format(root_path, x, y)
    print(dir_path)
    if(os.path.exists(dir_path)):
        print('已经存在')
    else:
        os.makedirs(dir_path)
