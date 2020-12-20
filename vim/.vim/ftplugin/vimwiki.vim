"nmap <silent><buffer> <Leader>wc <Plug>Vimwiki2HTML

setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查

""============== markdown preview==========={{{
let g:mkdp_command_for_global = 1
map <Leader>vm :MarkdownPreview<cr>
""============== markdown preview===========}}}

" Vim script file
" FileType:     vimwiki
" Author:       lilydjwg <lilydjwg@gmail.com>

let g:vimwiki_table_mappins = 0
nmap <buffer> <Leader>gt <Plug>VimwikiTabnewLink
nmap <buffer> <Leader>vsp <Plug>VimwikiVSplitLink
nmap <buffer> <Leader>sp <Plug>VimwikiSplitLink

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
