" runtimepath
" set rtp+=/home/junyi/Desktop/PhysWiki/ 
set encoding=utf8
set fileencodings=utf8,cp936,gb18030,big5
" Let's save undo info!
" And don't forget to create a cron to delete it
"如果目录已存在且传递了 "p" 标志位，不报错 (从补丁 8.0.1708
"起)。如果没有 "p" 位就会失败。
if !isdirectory($HOME."/.cache/vim/undo")
    call mkdir($HOME."/.cache/vim/undo", "p", 0700)
endif
set undodir=~/.cache/vim/undo
set undofile


" 解决 ssh 下 Vim 启动慢的问题 because of clipboard
" https://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
if $SSH_CONNECTION != ''
	set clipboard=exclude:.*
endif
"把 vim 插入状态的光标改为竖线 For VTE compatible terminals (urxvt, st, xterm,
"gnome-terminal 3.x, Konsole KDE5 and others)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

au FileType cmake set keywordprg=/home/junyi/bin/cmake-help

"-------------------begin gvimrc-------------------------------"
set linespace=0				"Gvim-specific line-height.
set guioptions-=m
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guifont=FiraCodeNerdFontMono\ 11
" set guifont=MesloLGSNF\ 11
" set guifont=OperatorMonoLight\ 13
"-------------------end gvimrc-------------------------------"

if has("nvim")
    " Make it easy to edit the .vimrc file.
    nmap <Leader>ev :tabedit ~/.local/share/nvim/unix.vim<cr>
    " Make it easy to edit the plugs file.
    nmap <Leader>ep :tabedit ~/.local/share/nvim/unix_plugs.vim<cr>
    " Make it easy to edit the tex snips
    nmap <Leader>ets :tabedit ~/.local/share/nvim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>
else
    " Make it easy to edit the .vimrc file.
    nmap <Leader>ev :tabedit ~/.vim/unix.vim<cr>
    " Make it easy to edit the plugs file.
    nmap <Leader>ep :tabedit ~/.vim/unix_plugs.vim<cr>
    " Make it easy to edit the tex snips
    nmap <Leader>ets :tabedit ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>
endif

" ocr
command! Ocr :r! ocr ~/Downloads/test.png
" vnoremap <C-h> :s/
