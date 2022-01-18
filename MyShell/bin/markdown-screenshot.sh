#! /bin/sh
#

dir="tmp"
name=$(date +%s).png
# echo $dir
maim -s "$dir/$name"
chevereto_upload.py -c ~/.config/chevereto/config.json -s "$dir/$name" | tr -d '\n' | xclip -selection clipboard
rm "$dir/$name" 
