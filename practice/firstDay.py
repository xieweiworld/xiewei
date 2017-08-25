#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# A string can be treated like a list of characters
print('world'[0])

# % can be used to format strings is, like this
print("%s can be %s" % ("strings", "interpolated"))

# A new way to format strings is the format method , this method is preferred way
print("{0} can be {1}" . format('strings', 'interpolated'))

# you can use keywords if you do not want to count for format
print("{name} want to eat {food}" . format(name='fang', food='pig'))

# None is a object , do not use '==' symbol to compare None, use 'is' instead
print('etc' is None)
