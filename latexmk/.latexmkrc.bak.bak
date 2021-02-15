# latexmk config
# 来源： 
# 1. https://www.latexstudio.net/archives/51493.html
# 2. http://www.ai7.org/blog/posts/latexmk.html
# 3. https://macplay.github.io/posts/shi-yong-latexmk-bian-yi-tex-wen-jian/
$bibtex = 'bibtex -include-directory=~/junyi/Documents/BibTeX';
$pdf_mode = 5;
$pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 %O %S";
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";
$bibtex_use = 1.5;
$out_dir = "latex.out";
$pdf_previewer = 'okular'; # 我尝试在 Arch 上 使用 $pdf_previewer = 'start okular' 结果出现两个 start start okular
# $preview_mode = 1; # 这个似乎和 “$preview_continuous_mode = 1” 冲突
$preview_continuous_mode = 1;
$clean_ext = "hd nav snm synctex.gz xdv";
