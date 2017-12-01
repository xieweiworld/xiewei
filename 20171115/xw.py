#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib
import math
import os

from PIL import Image


# noinspection PyMethodMayBeStatic
class VectorCompare:
    # noinspection PyPep8,PyPep8
    def magnitude(self, concordance):
        total = 0
        # noinspection PyShadowingNames
        for word,count in concordance.iteritems():
            total += count ** 2
        return math.sqrt(total)

    # noinspection PyPep8,PyPep8,PyUnusedLocal
    def relation(self, concordance1, concordance2):
        relevance = 0
        topvalue = 0
        # noinspection PyShadowingNames
        for word, count in concordance1.iteritems():
            if concordance2.has_key(word):
                topvalue += count * concordance2[word]
        return topvalue / (self.magnitude(concordance1) * self.magnitude(concordance2))



def buildvector(im):
    d1 = {}

    # noinspection PyShadowingNames
    count = 0
    for i in im.getdata():
        d1[count] = i
        count += 1

    return d1

v = VectorCompare()

# noinspection PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8
iconset = ['0','1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']


imageset = []

for letter in iconset:
    # noinspection PyRedundantParentheses,PyPep8
    for img in os.listdir('./iconset/%s/'%(letter)):
        temp = []
        # noinspection PyPep8
        if img != "Thumbs.db" and img != ".DS_Store": # windows check...
            # noinspection PyPep8,PyPep8
            temp.append(buildvector(Image.open("./iconset/%s/%s"%(letter,img))))
        # noinspection PyPep8
        imageset.append({letter:temp})


im = Image.open("1.jpg")
# noinspection PyPep8
im2 = Image.new("P", im.size,255)
im.convert("P")
temp = {}

for x in range(im.size[1]):
    for y in range(im.size[0]):
        # noinspection PyPep8
        pix = im.getpixel((y,x))
        temp[pix] = pix
        # noinspection PyPep8,PyPep8
        if pix == 96 or pix == 53 or pix == 60 or pix == 54 or pix == 90 or pix == 59 or pix == 95: # these are the numbers to get
            # noinspection PyPep8,PyPep8,PyPep8
            im2.putpixel((y ,x),0)

inletter = False
# noinspection PyPep8
foundletter=False
start = 0
end = 0

letters = []

# noinspection PyPep8,PyPep8
for y in range(im2.size[0]): # slice across
    # noinspection PyPep8
    for x in range(im2.size[1]): # slice down
        # noinspection PyPep8
        pix = im2.getpixel((y,x))
        if pix != 255:
            inletter = True

    # noinspection PyPep8
    if foundletter == False and inletter == True:
        foundletter = True
        start = y

    # noinspection PyPep8
    if foundletter == True and inletter == False:
        foundletter = False
        end = y
        # noinspection PyPep8
        letters.append((start,end))

    # noinspection PyPep8
    inletter=False

count = 0
for letter in letters:
    m = hashlib.md5()
    # noinspection PyPep8,PyPep8,PyPep8,PyPep8
    im3 = im2.crop(( letter[0] , 0, letter[1],im2.size[1] ))

    guess = []

    for image in imageset:
        # noinspection PyPep8
        for x,y in image.iteritems():
            if len(y) != 0:
                # noinspection PyTypeChecker,PyPep8,PyPep8,PyPep8,PyPep8,PyPep8
                guess.append( ( v.relation(y[0],buildvector(im3)),x) )

    guess.sort(reverse=True)
    print("", guess[0])

    count += 1