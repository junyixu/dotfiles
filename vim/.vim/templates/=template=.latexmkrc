# latexmk config
# 详情请 texdoc latexmk

# $bibtex = 'bibtex %O %S';

# $pdf_mode = 1;  # tex -> pdf
# $pdf_mode = 2;  #  tex -> ps -> pdf 
# 如果设为 4 使用 lualatex。
# 如果设为 5 使用 xelatex。 
# 每个项目都应有一个 .latexmk，用 vim-template 创建再修改，debug 用 magic comment 比如 %!TEX program=xelatex ；也可用命令行参数切换不同的引擎，比如 latexmk -xelatex
$pdf_mode = 5; 

# 部分 option 已经放入 .vimrc

# -halt-on-error  使编译遇到错误时立即停止；
$pdflatex = "pdflatex -halt-on-error -shell-escape %O %S";
# xelatex 的 -no-pdf 参数使编译时只生成 xdv 文件，最后才用 xdvipdfmx 生成 pdf， 这样可以节省嵌入图片耗费的时间（需要 TeX Live 2017 以上）
#The result is that $latex = ’latex %O %S’, and similarly for $pdflatex, $lualatex, and $xelatex.
# (The option -no-pdf needed for $xelatex is provided automatically, given that %O appears in the definition.) 所以不用添加 -no-pdf 了
$xelatex = "xelatex -halt-on-error -shell-escape %O %S";
$lualatex = "lualatex -halt-on-error -shell-escape %O %S";
$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";

# $bibtex_use = 2; 等同于 -bibtex 选项。
# $bibtex_use = 0; 等同于 -bibtex- 选项。表示： Never run bibtex or biber. 
# 通常 bbl 文件是由 BibTeX 编译 bib 文件生成的，在清理辅助文件时可以删掉； 但是有时并没由提供 bib 文件，只有 bbl（比如 arxiv 上的 TeX 源码），$bibtex_use = 1.5 可以自动检测根据条件清理 bbl 文件（需要 TeX Live 2018 以上）。
# 注意：$bibtex_use = 1.5 导致 biblatex 失败!!! 
$bibtex_use = 1.5;

# 编译时将所有生成文件（包括辅助文件）写到 latex.out 目录下。注意这个配置虽然可以使目录更加整洁，但是可能导致一些软件的功能受影响，建议谨慎选择。
# 如使用 minted 宏包，需要添加 \usepackage[outputdir=latex.out]{minted}
# 参见 https://github.com/gpoore/minted/issues/159
# .latexmkrc 的优先级比 .vimrc 的配置 更高
$out_dir = "latex.out";

# 如果你希望编译完成后清理无关的中间文件，则注意把清理模式 $cleanup_mode 打开
# $cleanup_mode = 1;

$clean_ext = "hd nav snm synctex.gz xdv";

# $preview_mode = 0; # 编译完成后自动打开 pdf；
# $preview_mode = 1; # 这个似乎和 “$preview_continuous_mode = 1” 冲突
# $preview_continuous_mode = 0; # 已经在 vimrc 里面设置了
@default_files = ('main.tex');
# $pdf_previewer = 'okular'; # linux 会根据 xdg-open 自动选择(大概







# vim: set ft=perl:
