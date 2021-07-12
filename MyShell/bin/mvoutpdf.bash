#! /bin/bash
#
# mvoutpdf.bash
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


outputfolder='latex.out'
outputfile='main.pdf'
output=$outputfolder/$outputfile

if [ $# = 1 ] && [ $1 = "unlink" ] # 取消连接
then
	for i in ./*; do
		if [ -L "$i/$output" ]; then # 判断此文件是否不是软链接，若是，则
			rm "$i/$output"  # 删除软链接
			mv ~/Sync/uni_pdf/$i.pdf "$i/$output"  # 把 ~/Sync/uni_pdf 里的文件 移动回  latex.out/main.pdf
		fi
	done
else # 正常连接
	for i in ./*; do # 当前文件夹指 ~/Desktop/university 
		if [ -f "$i/$output" ]; then # 判断是否有文件
			if [ ! -L "$i/$output" ]; then # 判断此文件是否不是软链接，若不是，则
				mv "$i/$output" ~/Sync/uni_pdf/$i.pdf # 把 普通 pdf 文件移动到 ~/Sync/uni_pdf
				ln -s ~/Sync/uni_pdf/$i.pdf "$(pwd)/$i/$output" # 再把 ~/Sync/uni_pdf 的文件软链接回 latex.out
			fi
		fi
	done
fi
