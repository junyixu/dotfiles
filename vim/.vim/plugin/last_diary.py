#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2023 Junyi Xu <jyxu@mail.ustc.edu.cn>
#
# Distributed under terms of the MIT license.

import datetime
import os
import vim


def edit_diary(d, num):
    delta = datetime.timedelta(days=num)
    HOME = os.path.expanduser("~")
    path= HOME+"/Notes/diary/"
    for i in range(100):
        d += delta
        diary = d.isoformat() + ".md"
        if os.path.exists(path+diary):
            vim.command('e '+path+diary)
            return diary

def last_diary():
    c_file=vim.eval('expand("%:t:r")')
    return edit_diary(datetime.date.fromisoformat(c_file), -1)

def next_diary():
    c_file=vim.eval('expand("%:t:r")')
    return edit_diary(datetime.date.fromisoformat(c_file), 1)
