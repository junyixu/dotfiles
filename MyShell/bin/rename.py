#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
"""
rename
"""

import re
import os

os.chdir(r'~/Desktop/rename_file')
old_names = os.listdir(os.getcwd())

###################################


def file_rename(text):
    contexts = re.findall(r'[\u4e00-\u9fa5]', text)
    return ''.join(contexts) + '.md'


new_names = list(map(file_rename, old_names))

###################################

for old_name, new_name in zip(old_names, new_names):
    os.renames(old_name, new_name)  #os.renames()方法直接替换文件名
