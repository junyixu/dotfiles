" matlab 和 c 的语法高亮
call SyntaxRange#Include('\\begin{minted}\(\[.*\]\)\{0,1}{matlab}', '\\end{minted}', 'matlab', 'NonText')
call SyntaxRange#Include('\\begin{minted}\(\[.*\]\)\{0,1}{c}', '\\end{minted}', 'c', 'NonText')
call SyntaxRange#Include('\\mint{matlab}|', '|', 'matlab', 'NonText')

" https://github.com/lervag/vimtex/issues/2027
call SyntaxRange#Include('"""begin=sage"""', '"""end=sage"""', 'sage', 'NonText')
call SyntaxRange#Include('%%%begin=sage%%%', '%%%end=sage%%%', 'sage', 'NonText')

" :call SyntaxRange#IncludeEx('start="\\begin{minted}\(\[.*\]\)\{0,1}{matlab}" skip="^[-+@       ]" end="^$"', 'diff')
"
setlocal concealcursor=
