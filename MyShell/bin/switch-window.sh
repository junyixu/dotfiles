#! /bin/sh
#
# switch window 用 fzf 糢糊切换程序窗口
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


# 不需要 桌面 和 Latte Dock 栏，用 grep -v 去除
__window_id=$(wmctrl -l | grep -v Plasma | grep -v Latte | grep -v Guake | fzf | cut -d' ' -f1)

# 最小化当前窗口 没弄懂 怎么用 wmctrl 最小化窗口
# xdotool windowminimize $(xdotool getactivewindow)
wmctrl -ia $__window_id
