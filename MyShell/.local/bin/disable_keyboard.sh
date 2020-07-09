#! /bin/sh
#
# input.sh
# Copyright (C) 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#
ids=$(xinput --list --long | grep -A 1 "Asus Keyboard" | grep "keyboard" | cut -d '=' -f2| cut  -f1)

for i in $ids
do xinput --set-prop $i "Device Enabled" 0
done
