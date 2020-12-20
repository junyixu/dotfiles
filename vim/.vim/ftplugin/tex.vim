"---------------------latex---------------------------------"
" 小时物理百科
noremap <silent><buffer> <leader>vh :! chromium http://wuli.wiki/online/%:r.html<cr>
nnoremap <silent><buffer> <S-CR> :! chromium http://wuli.wiki/online/<cfile>.html<cr>
inoremap <silent><buffer> <S-CR> \\<CR>
map <localleader>l :VimtexCompile<CR>
map <localleader>e :VimtexError<CR>
map <localleader>s :VimtexStatus<CR>
map <localleader>v :VimtexView<CR>
nnoremap <buffer> <cr> gf
" 设置格式化时制表符占用空格数
setlocal shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
setlocal softtabstop=2
" 设置编辑时制表符占用空格数
setlocal tabstop=2
"set textwidth=80							" 超过 80 个字符 的时候自动换行
" let b:indentLine_color_term="81" " 蓝色
" let b:indentLine_color_gui='#81a2be' " 蓝色

" highlight Conceal cterm=NONE ctermfg="81"
" highlight Conceal gui=NONE guifg=81a2be

"autocmd filetype tex nnoremap <F10> :w<cr>:!xelatex %<cr>
"autocmd BufNewFile,BufRead *.tex inoremap ( (
"autocmd BufNewFile,BufRead *.tex inoremap { {

"autocmd BufNewFile,BufRead *.tex inoremap $ $$<ESC>i
"autocmd BufNewFile,BufRead *.tex inoremap $$ <ESC>o\[<CR>\]<ESC>O
" 词典 https://zhuanlan.zhihu.com/p/27027319
" setlocal dictionary+=~/.vim/plugin/english.dict
" setlocal dictionary+=~/.vim/plugin/latex.dict
"set complete+=k

setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查
setlocal spellfile=~/.vim/spell/en.utf-8.add
setlocal spellfile+=~/.vim/spell/latex.utf-8.add


" https://github.com/gillescastel/inkscape-figures
" 如果是 <C-i> 就会和 Ultisnips 的 tab 冲突
" 后来得知 <C-i> 就是 tab <C-m> 就是 <cr>
inoremap <buffer> <C-F> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" edit 功能不管用 python 报错
nnoremap <buffer> <leader><C-F> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" 句首字母大写
" https://superuser.com/questions/737130/automatically-capitalize-the-first-letter-of-sentence-in-vim
" for char in split('abcdefghijklmnopqrstuvwxyz', '\zs')
"     exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnw') ? '%s' : '%s'", char, toupper(char), char)
" endfor

" for char in split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
"     exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnW') ? '%s' : '%s'", char, tolower(char), char)
" endfor
