#! /bin/bash
#
# mvoutpdf.bash
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


outputfolder='latex.out'
for i in ./*; do # 当前文件夹指 ~/Desktop/university 
	if [ -f "$i/$outputfolder/main.pdf" ]; then # 判断是否有文件
		if [ ! -L "$i/$outputfolder/main.pdf" ]; then # 判断此文件是否不是软链接，若不是，则
			mv "$i/$outputfolder/main.pdf" ~/Sync/uni_pdf/$i.pdf # 把 普通 pdf 文件移动到 ~/Sync/uni_pdf
			ln -s ~/Sync/uni_pdf/$i.pdf "$(pwd)/$i/$outputfolder/main.pdf" # 再把 ~/Sync/uni_pdf 的文件软链接回 latex.out
		fi
	fi
done

