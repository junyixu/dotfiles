#! /bin/bash
#
# orphan.bash
# Copyright (C) 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#

pacman -Qq | while read x; do grep -x $x orphan_list ; done
# 就可以知道自己装了什么orphan包了
