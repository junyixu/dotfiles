#! /bin/sh
#
# finishrestoringhome.sh
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#

echo 'sudo btrfs subvolume delete -c /mnt/theRoot/home_bak'
sudo btrfs subvolume delete -c /mnt/theRoot/home_bak
sudo umount /mnt/theRoot
echo 'sudo umount /mnt/theRoot'
