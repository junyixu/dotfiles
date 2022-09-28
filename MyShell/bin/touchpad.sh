#!/bin/sh
deviesname="Microsoft Surface Type Cover Touchpad"
echo $deviesname
if (xinput --list --long | grep -A 1 "$deviesname" | grep -q "disabled" );
    then
        notify-send "Enabling  $deviesname..." \ "ON -  $deviesname connected !";
        echo "enable $deviesname..."
        xinput enable "$deviesname"
else
        notify-send "Disabling $deviesname..." \ "OFF - $deviesname disconnected !";
        echo "disable $deviesname..."
        xinput disable "$deviesname"
fi
