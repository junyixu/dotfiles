"nmap <silent><buffer> <Leader>wc <Plug>Vimwiki2HTML

setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查
setlocal autoread

""============== markdown preview==========={{{
let g:mkdp_command_for_global = 1
map <Leader>vm :MarkdownPreview<cr>
""============== markdown preview===========}}}

" Vim script file
" FileType:     vimwiki
" Author:       lilydjwg <lilydjwg@gmail.com>

let g:vimwiki_table_mappins = 0
nmap <buffer> <localleader>gt <Plug>VimwikiTabnewLink
nmap <buffer> <localleader>vsp <Plug>VimwikiVSplitLink
nmap <buffer> <localleader>sp <Plug>VimwikiSplitLink

" 没有-regex 选项时候，只有空格用加 `\` 括号不用加, CtrlSF 真奇怪
nnoremap <buffer> <localleader>todo :CtrlSF \ [\ ]\ <CR>
" nnoremap <buffer> <localleader>todo :CtrlSF -R -- [\*\-]\ \[\ \]\ <CR>

" nnoremap <buffer> <C-F> :VimwikiSearch  
nnoremap <buffer> <leader>n :lnext<cr>
nnoremap <buffer> <leader>p :lprevious<cr>

"vmap <F9> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
"imap <F9> <C-R>=UltiSnips#ExpandSnippet()<CR>
nnoremap <localleader>p :VimwikiDiaryPrevDay<cr>
nnoremap <localleader>n :VimwikiDiaryNextDay<cr>
"nnoremap <M-p> :VimwikiDiaryPrevDay<cr>
"nnoremap <M-n> :VimwikiDiaryNextDay<cr>
" nnoremap <leader>p <Plug>VimwikiDiaryPrevDay
" nnoremap <leader>n <Plug>VimwikiDiaryNextDay
" nnoremap <buffer> <leader>p :lprevious<cr>
nnoremap <buffer> <F7> :highlight Conceal ctermfg=81<cr>

" highlight Conceal clear
" highlight Conceal gui=NONE guifg=81a2be

"nmap <buffer> <Space> <C-Space>
nmap <buffer> t8 I  * <ESC>
nmap <buffer> <C-CR> :VimwikiAll2HTML<CR><CR>
nmap <buffer> m~ i~~  ~~<ESC>2hi

"inoremap <buffer> <C-b> ****h<ESC>i
vnoremap <buffer> <C-b> "zc****<esc>hP

vmap <buffer> m~ <ESC>`<I~~ <esc>`>A ~~<esc>
vmap <buffer> m{ <ESC>`<i[<ESC>`>a]<ESC>
vmap <buffer> m} <ESC>`>a]<ESC>`<i[<ESC>
vmap <buffer> m[ <ESC>`>a]]<ESC>`<i[[<ESC>
vmap <buffer> m] <ESC>`>a]]<ESC>`<i[[<ESC>f];

"vmap <buffer> <C-b> <ESC>`>a*<ESC>`<i*<ESC>f*
"vmap <buffer> <C-i> <ESC>`>a_<ESC>`<i_<ESC>f_

setlocal nonumber
setlocal norelativenumber

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

setlocal nolbr
setlocal fo+=B
" 不能设置在 .vimrc 里，因为那里 wiki 变量还未被建立
" 直接打开文件时无效
" 如果 {{{ 不在行首亦无效
"let wiki.nested_syntaxes = {
"      \ 'sh': 'sh', 'c': 'c', 'rust': 'rust',
"      \ 'sql': 'sql', 'pgsql': 'pgsql',
"      \ }

"imap <buffer> <BS> <C-R>=Lilydjwg_checklist_bs('\v^\s*[*-]( \[.\])? $')<CR>
"
"


" 我有时不想手写字母大写
setlocal spellcapcheck=""


" 锚点
" 定义人工锚点 
inoremap <buffer> <silent> ,, <++>
" 切换到下一个锚点  
inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l

" 加粗 
inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
" 行内代码引用
inoremap <buffer> <silent> ,q `` <++><Esc>F`i
" 代码块引用
inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA  
" 下划线
inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
" 图片
inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
" 链接
inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a

imap <M-L><C-J> <Plug>VimwikiListNextSymbol
imap <M-L><C-K> <Plug>VimwikiListPrevSymbol
imap <M-L><C-M> <Plug>VimwikiListToggle
nmap <buffer> <localLeader>tl <Plug>VimwikiToggleListItem
vmap <buffer> <localLeader>tl <Plug>VimwikiToggleListItem
nnoremap <buffer> glo :VimwikiChangeSymbolTo a)<CR>
nnoremap <buffer> <C-n> <Plug>VimwikiNextLink
nnoremap <buffer> <C-p> <Plug>VimwikiPrevLink
nnoremap <buffer> <localleader><localleader> :VimwikiToggleListItem<CR>

source $HOME/.vim/ftplugin/markdownandvimwiki.vim

