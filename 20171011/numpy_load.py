#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import numpy as np

data = np.genfromtxt(fname='load.txt', delimiter=',', skip_header=0, usecols=[1, 2])
print(data)
