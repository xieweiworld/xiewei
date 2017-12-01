#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from PIL import Image
import hashlib
import time
import os
import math

im = Image.open("code/1.png")


# while True:
#     try:
#         seq = im.tell()
#         im.seek(seq + 1)
#         im.save("Code/%s.png" % ('code0' + str(seq)))
#     except EOFError:
#         break
im = im.convert("P")
im2 = Image.new("P", im.size, 255)

# 18 1 13 4 14 9 15 16 3 5
for x in range(im.size[1]):
    for y in range(im.size[0]):
        pix = im.getpixel((y, x))
        if pix == 8 or pix == 6 or pix == 11 or pix == 9 :  # these are the numbers to get
            # or pix == 53 or pix == 60 or pix == 54 or pix == 90 or pix == 59 or pix == 95
            im2.putpixel((y, x), 0)


im2.show()