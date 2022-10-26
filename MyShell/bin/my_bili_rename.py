#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
"""
rename
将文件名中的中文数字转换为阿拉伯数字
"""

import chinese2digits as c2d
import os

file_names = os.listdir(os.getcwd())

for file_name in file_names:
    os.rename(file_name,
              c2d.takeChineseNumberFromString(file_name)['replacedText'])
