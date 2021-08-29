#! /bin/sh
#
# init_htop.sh
# Copyright (C) 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


destination_bin=/usr/local/bin
destination_lib=/usr/local/lib

sudo mv ./htop $destination_bin/htop
sudo mv ./libncursesw.so.6 $destination_lib/libncursesw.so.6
sudo chown root $destination_bin/htop
sudo chgrp root $destination_bin/htop
sudo chown root $destination_lib/libncursesw.so.6
sudo chgrp root $destination_lib/libncursesw.so.6
sudo ldconfig
