#! /bin/sh
#
# switch2mma.sh
# Copyright (C) 2022 junyi <junyi@Junix>
#
# eg:
# ~/bin/switch2specificWindow.sh Mathematica
#
# Distributed under terms of the MIT license.
#

ACTIVE=$(xdotool getactivewindow) 
TARGET=$(xdotool search --name "$@" --limit 1)
if [[ $TARGET == $ACTIVE ]]
then
	xdotool windowminimize $ACTIVE
else
	xdotool windowactivate $(xdotool search --name "$@")
fi
