
# latexmk config

# $bibtex = 'bibtex %O %S';

$pdf_mode = 5; #  如果设置为 1 使用 pdflatex 编译生成 pdf。 如果设为 5 使用 xelatex。我个人由于需要使用不同的引擎，所以默认设为 1， 然后用命令行参数切换不同的引擎，比如 latexmk -xelatex
$pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 %O %S";
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";

$bibtex_use = 1.5;
# $out_dir = "latex.out";

$clean_ext = "hd nav snm synctex.gz xdv";

$preview_mode = 0; # 编译完成后自动打开 pdf；
# $preview_mode = 1; # 这个似乎和 “$preview_continuous_mode = 1” 冲突
$preview_continuous_mode = 0; # 已经在 vimrc 里面设置了
# @default_files = ('main.tex'); # 已经在 vimrc 里面设置了
# $pdf_previewer = 'okular'; # linux 会根据 xdg-open 自动选择(大概







# vim: set ft=perl:
