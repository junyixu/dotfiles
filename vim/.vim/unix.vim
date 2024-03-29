" runtimepath
" set tags+=~/.vim/systags
set encoding=utf8
set fileencodings=utf8,cp936,gb18030,big5

" Let's save undo info!
" And don't forget to create a cron to delete it
"如果目录已存在且传递了 "p" 标志位，不报错 (从补丁 8.0.1708
"起)。如果没有 "p" 位就会失败。

if !g:isNVIM
	if !isdirectory($HOME."/.cache/vim/undo")
		call mkdir($HOME."/.cache/vim/undo", "p", 0700)
	endif
	set undodir=~/.cache/vim/undo
	set undofile
endif

" run command and copy result to clipboard
function! ExecCmd(expr)
    if exists('*execute')
        let @" = execute(a:expr, '')
    else
        try
            redir @"
            execute a:expr
        finally
            redir END
        endtry
    endif
    let result = @"
    let result = substitute(result, '^\n\(.*\)', '\1', 'g')
    let result = substitute(result, '^\(.*\)\n', '\1', 'g')
    " system(result .. ' | xclip -selection clipboard -in')
    return result
endfunction
command! -nargs=+ -complete=command ExecCmd :call ExecCmd(<q-args>)

" 解决 ssh 下 Vim 启动慢的问题 because of clipboard
" https://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
if $SSH_CONNECTION != '' && !g:isNVIM
	set clipboard=exclude:.*
endif
"把 vim 插入状态的光标改为竖线 For VTE compatible terminals (urxvt, st, xterm,
"gnome-terminal 3.x, Konsole KDE5 and others)
	let &t_EI = "\<Esc>[2 q"
	let &t_SI = "\<Esc>[6 q"
if exists('+termguicolors') && $SSH_CONNECTION == '' && !has('nvim')
	let &t_SR = "\<Esc>[4 q"
endif

au FileType cmake set keywordprg=~/bin/cmake-help


if g:isNVIM
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
    " Make it easy to edit the ftplug file.
    nmap <Leader>ep :tabedit ~/.vim/unix_plugs.vim<cr>
    " Make it easy to edit the tex snips
    nmap <Leader>ets :tabedit ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>
endif

" vim-slime 反应慢 " https://github.com/jpalardy/vim-slime/issues/204
set shell=/bin/sh
