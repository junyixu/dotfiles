#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
"""

以 %% 为分隔，把 matlab 分为小文件

Usage: ./splitMatlabFile.py test1.m

with基于上下文，会自动帮助我们关闭文件。
如果不关闭文件，会怎么样？对于在个人电脑上没什么影响。如果你执行的python程序结束了，文件会自动关闭。
服务器端如果不关闭文件，会出现句柄泄露，导致句柄耗尽。
"""

import sys, re

for l in open(sys.argv[1], 'r'):
    if l.startswith("%%"):
        searchObj = re.search(r'\d+', l)
        if searchObj:  # 是否为空，是否搜到了
            pageNum = searchObj.group()
            f = open(f"{pageNum}.m", 'w')
    f.write(l)
