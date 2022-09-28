#! /bin/zsh
#
# test.sh
# Copyright (C) 2022 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#

for fig in figures/*.png; do
	grep -q $fig:t **/*.tex || rm $fig
done
