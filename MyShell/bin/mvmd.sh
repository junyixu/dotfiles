#! /bin/sh
#
# mvmd.sh
# Copyright (C) 2022 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#

# TODO 加引号就不行
# mv $(/bin/ls -dt ~/Downloads/* | head -1) "~/Notes/WebClipper/$@.md"

mv $(/bin/ls -dt ~/Downloads/* | head -1) ~/Notes/WebClipper/$@.md
