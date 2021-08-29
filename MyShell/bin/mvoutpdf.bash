#! /bin/bash
#
# mvoutpdf.bash
# 为了管理我的 latex 笔记
# 我把 latex.out/main.pdf 放到 ~/Sync
# 再用软链接，链接回去
# 通过 syncthing 同步到手机和平板，方便批注
# 
# 把 pdf 转成 jpg 放在 ~/.cache 
# 然后用 .zshrc 里面的t()糢糊搜索笔记，同时打开 tex 和 pdf
# 
# Copyright (C) 2021 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


outputfolder='latex.out'
outputfile='main.pdf'
output=$outputfolder/$outputfile

# TODO 把下面if里面的重复代码写成函数

if [ $# = 1 ] && [ $1 = "unlink" ] # 取消连接
then
	for i in ./*; do
		if [ -L "$i/$output" ]; then # 判断此文件是否不是软链接，若是，则
			rm "$i/$output"  # 删除软链接
			rm $HOME/.cache/LaTeXNotesPDFImg/$i.jpg
			mv ~/Sync/uni_pdf/$i.pdf "$i/$output"  # 把 ~/Sync/uni_pdf 里的文件 移动回  latex.out/main.pdf
		fi
	done
elif (( $# > 2 )) && [ $1 = "unlink" ] && [ -d "$2" ]
then
	args=("$@") # 把所有的参数组成一个元组
	for i in "${args[@]:1}"; do # 从第二个元素开始索引到最后
		if [ -L "$i/$output" ]; then # 判断此文件是否不是软链接，若是，则
			rm "$i/$output"  # 删除软链接
			rm $HOME/.cache/LaTeXNotesPDFImg/$i.jpg
			mv ~/Sync/uni_pdf/$i.pdf "$i/$output"  # 把 ~/Sync/uni_pdf 里的文件 移动回  latex.out/main.pdf
		fi
	done
elif (( $# >= 1 )) && [ -d "$1" ]  # $#=1 参数个数大于1，第一个参数是目录
then
	for i in "$@"; do
		if [ -f "$i/$output" ]; then # 判断是否有文件
			if [ ! -L "$i/$output" ]; then # 判断此文件是否不是软链接，若不是，则
				mv "$i/$output" ~/Sync/uni_pdf/$i.pdf # 把 普通 pdf 文件移动到 ~/Sync/uni_pdf
				ln -s ~/Sync/uni_pdf/$i.pdf "$(pwd)/$i/$output" # 再把 ~/Sync/uni_pdf 的文件软链接回 latex.out
				pdf2jpg.sh $i # 在 ~/.cache/LaTeXNotesPDFImg 生成 $i.jpg
			fi
		fi
	done
else
	for i in ./*; do # 当前文件夹指 ~/Desktop/university 
		if [ -f "$i/$output" ]; then # 判断是否有文件
			if [ ! -L "$i/$output" ]; then # 判断此文件是否不是软链接，若不是，则
				mv "$i/$output" ~/Sync/uni_pdf/$i.pdf # 把 普通 pdf 文件移动到 ~/Sync/uni_pdf
				ln -s ~/Sync/uni_pdf/$i.pdf "$(pwd)/$i/$output" # 再把 ~/Sync/uni_pdf 的文件软链接回 latex.out
				pdf2jpgAll.sh # 在 ~/.cache/LaTeXNotesPDFImg 生成 ~/Sync/uni_pdf/*.pdf 的 *.jpg
			fi
		fi
	done
fi
