#! /bin/sh
# https://stackoverflow.com/questions/56927772/convert-webvtt-file-from-youtube-to-plain-text

awk 'FNR<=4 || ($0 ~ /^$|-->|\[|\]|</){next} !a[$0]++'  $@ > output.txt
