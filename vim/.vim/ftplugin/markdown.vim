"----------------------Markdown---------------------------------"
" autocmd filetype markdown nnoremap ZZ :Pangu<cr>ZZ
setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查

nnoremap <buffer> <localleader>s :AsyncRun! -mode=hide markdown-screenshot.sh<CR>
inoremap <buffer> <M-v> ![img](<C-r>+)

" 没有-regex 选项时候，只有空格用加 `\` 括号不用加, CtrlSF 真奇怪
nnoremap <buffer> <localleader>todo :CtrlSF -- -\ [\ ]\ <CR>

"markdown-preview.nvim
map <buffer> <Leader>vm :MarkdownPreview<cr>

""句首字母大写
"for char in split('abcdefghijklmnopqrstuvwxyz', '\zs')
"    exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnw') ? '%s' : '%s'", char, toupper(char), char)
"endfor

" for char in split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
"     exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnW') ? '%s' : '%s'", char, tolower(char), char)
" endfor

" 有了 tpope/vim-apathy 插件不需要了
" setlocal  suffixesadd+=.md


function! TmpMarkdown()
	if expand("%:p") == "/tmp/test.md"
		execute "normal ggvG$\"+d"
		execute "bd!"
		" call system('wmctrl -a 滴答清单')
		" 最小化窗口
		call system('xdotool windowminimize $(xdotool getactivewindow)')
	else 
		execute "normal ZZ"
	endif
endfunc

nnoremap <buffer> <M-z> :call TmpMarkdown()<cr>
" if IsTmpMarkdown()
" 	nnoremap <M-z>  ggVG"+dZZ
" endif

source $HOME/.vim/ftplugin/markdownandvimwiki.vim
