setlocal dictionary+=~/.vim/dict/markdown.dict
setlocal thesaurus=~/.vim/thesaurus/english.txt

setlocal complete+=k

" vimwiki 的数学无法包括 tex 语法
" 所以在适当时候 setlocal ft=markdown 来用 tex 的数学 Ultisnips
nnoremap <expr><silent> <localleader>f &filetype=='vimwiki' ? ":setlocal filetype=markdown<CR>" :  ":setlocal filetype=vimwiki<CR>"


" LaTeX math 推荐 \( \) 和 \[ \]
" TeX math 依然使用 $ $ 和 $$ $$
" markdown math 转换成 LaTeX math
fun MarkdownMath2LaTeXMath()
	" 把 $$ math $$ 替换成 \[ math \]
	silent! %s/\$\$\(.*\)\$\$/\\[\1\\]/g
	" 把 $ math $ 替换成 \( math \)
	silent! %s/\$\(.*\)\$/\\(\1\\)/g
	" 返回原处
	silent! normal 
endf
fun LaTeXMath2MarkdownMath()
	" 把 \[ math \] 替换成 $$ math $$
	silent! %s/\\\[\(.*\)\\\]/\$\$\1\$\$/g
	" 把\( math \) 替换成 $ math $
	silent! %s/\\(\(.*\)\\)/\$\1\$/g
	silent! normal 
endf

source $HOME/.vim/my_maps/GreekLetter4Writting.vim 
