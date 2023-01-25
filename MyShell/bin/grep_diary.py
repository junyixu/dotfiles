#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2023 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
"""

"""

# %%
import numpy as np
import pandas as pd
import os
import time

tmp_file = "/tmp/tmp_grep.txt"
totay_date = time.strftime('%Y-%m-%d', time.localtime())
filepath = "/home/junyi/Notes/diary/" + totay_date + ".md"
os.system("grep '#[1-5]$' " + filepath + " > " + tmp_file)
diary_table = pd.read_table(tmp_file, names=["开始", "事件", "结束", "总计时间", "类型"])
time_types = ["学习", "为学习做准备", "锻炼", "休息", "浪费时间"]


def str2time(time_type_str, column_name):
    start_time_str = diary_table[diary_table["类型"] ==
                                 time_type_str][column_name]
    return pd.to_datetime(start_time_str)


def compute_delta_time(time_type_str):
    if (diary_table["类型"] == time_type_str).any() == False:  # 没有这种类型
        return 0
    d_time = str2time(time_type_str, "开始") - str2time(time_type_str, "结束")
    return int((d_time.dt.total_seconds() / 60).sum())  # total minutes


def main():
    delta_time_array = np.array(
        list(map(compute_delta_time, ["#1", "#2", "#3", "#4", "#5"])))

    with open(filepath, "a") as f:
        f.write('\n')
        for hours, minutes, time_type in zip(delta_time_array // 60,
                                             delta_time_array % 60,
                                             time_types):
            if hours == 0:
                f.write(time_type + ":\t" + str(minutes) + "分钟\n")
            else:
                f.write(time_type + ":\t" + str(hours) + "小时" + str(minutes) +
                        "分钟\n")


if __name__ == '__main__':
    main()
