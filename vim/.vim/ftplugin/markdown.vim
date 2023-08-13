"----------------------Markdown---------------------------------"
" autocmd filetype markdown nnoremap ZZ :Pangu<cr>ZZ
setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查
setlocal autoread " 自动加载

nnoremap <buffer> <localleader>s :AsyncRun! -mode=hide markdown-screenshot.sh<CR>
inoremap <buffer> <M-v> ![img](<C-r>+)

"markdown-preview.nvim
map <buffer> <localleader>r :MarkdownPreview<cr>

nnoremap <buffer> <cr> :call MyVimWikiReturn()<CR>

" 我有时不想手写字母大写
setlocal spellcapcheck=""

"=============================begin list ==========================={{{
" 说明  Plug 'Yggdroot/indentLine' 只适用于空格，以下适用于 tab
"
"方案一
"set list                     " 显示 Tab 符，
"set listchars=tab:\┊\ ,      " 使用一高亮竖线代替 把符号显示为 |
"""set listchars=tab:>-,trail:-
"set listchars=tab:\┊\ ,nbsp:%,trail:-
"highlight LeaderTab guifg=#666666   " 设定行首 tab 为灰色
"match LeaderTab /\t/        " 匹配行首 tab

"方案二
setlocal listchars=tab:»■,trail:■
setlocal list								"如果行尾有多余的空格（包括 tab 键）, 该配置将让这些空格显示成可见的小方块。
"============================= end list===========================
"----------------------Fold--------------------------------------}}}

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

" 把 () 或 [] 转换成 \left(\right)
nnoremap <buffer> tsd :s/\v([\(\[].*)([\)\]])/\\left\1\\right\2<cr>%
nnoremap <buffer> <M-z> :call TmpMarkdown()<cr>
" if IsTmpMarkdown()
" 	nnoremap <M-z>  ggVG"+dZZ
" endif

" pandoc markdown 转 docx 支持公式编号
" https://www.zhihu.com/question/68181683/answer/2876695520
" https://blog.csdn.net/u013256285/article/details/128219495
nnoremap <buffer> <leader>r :!pandoc % --resource-path=resources -o ~/Desktop/%:t:r.docx --filter pandoc-crossref -M tableEqns -M autoEqnLabels -t docx+native_numbering<cr>

function! AddTODO()
	let buf=getline(".")
	let n=0
	while(n<80)  " 随便设置的 80, 不然会死循环 TODO
		if(buf[n] is "-" || buf[n] is "*")
			break
		endif
		let n+=1
	endwhile
	" vim 用 两个 '' 表示 一个 '
	" 即下面的字面意思为 expr = 'buf[n+6:]'
	" TICKTICKEMAIL: 滴答清单邮箱
	let expr=''''.buf[n+6:].''''
	call asyncrun#run("", {'mode': 'hide'}, 'echo "" | /usr/bin/mail -s '.expr.' '.$TICKTICKEMAIL.' &> /dev/null')
	" call asyncrun#run("", {'mode': 'hide'}, 'todoist add '.expr)
endfunction

nnoremap <localleader>a :call AddTODO()<cr>
" nnoremap <localleader>h :%s/\v([^0-9]\.|[^0-9],)(\d+|\d+,\d+|\d+–\d+)( \w)/\1<sup>[\2]<\/sup>\3<cr>

function! ShowTODO()
	let buf=getline(".")
	" vim 用 两个 '' 表示 一个 '
	" 即下面的字面意思为 expr = 'buf[6:]'
	let expr=''''.buf[6:].''''
	call asyncrun#run("", {'mode': 'term'}, 'echo '.$VIM_CWORD )
endfunction

function! ListTODO()
	call asyncrun#run("", {'mode': 'term'}, 'todoist list')
endfunction
nnoremap <buffer> <localLeader>wrhl <Plug>VimwikiRemoveHeaderLevel
setlocal nolbr
setlocal fo+=B

source $HOME/.vim/ftplugin/markdownandvimwiki.vim
