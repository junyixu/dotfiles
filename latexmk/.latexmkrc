# latexmk config
# 建议在个人根目录的 $HOME/.latexmkrc 文件中配置个人的使用习惯， 然后在项目的工作目录的 latexmkrc 文件配置项目相关的编译方法， 如使用 xelatex 或开启 -shell-escape 等。
# 来源： 
# 1. https://www.latexstudio.net/archives/51493.html
# 2. http://www.ai7.org/blog/posts/latexmk.html
# 3. https://macplay.github.io/posts/shi-yong-latexmk-bian-yi-tex-wen-jian/
# $bibtex = 'bibtex %O %S';
$pdf_mode = 5; #  如果设置为 1 使用 pdflatex 编译生成 pdf。 如果设为 5 使用 xelatex。我个人由于需要使用不同的引擎，所以默认设为 1， 然后用命令行参数切换不同的引擎，比如 latexmk -xelatex
$pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 %O %S";
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";

$bibtex_use = 1.5;
$out_dir = "latex.out";

$clean_ext = "hd nav snm synctex.gz xdv";

$preview_mode = 0; # 编译完成后是否自动打开 pdf；
$preview_continuous_mode = 0; # 已经在 vimrc 里面设置了
# @default_files = ('main.tex'); # 已经在 vimrc 里面设置了	注：	@ 表示数组
# $pdf_previewer = 'okular'; # 已经在 vimrc 里面设置了， 且 linux 会根据 xdg-open 自动选择






# vim: set ft=perl:
