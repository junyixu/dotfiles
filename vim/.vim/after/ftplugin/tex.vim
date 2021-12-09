" 不能放在 ~/.vim/ftplugin
" 必须放在 ~/.vim/after/ftplugin，
" 才能在 vim 加载完 fzf 的布局的颜色配置后再加载这行
nnoremap <buffer> <localleader>lf :call vimtex#fzf#run('ctli', g:fzf_layout)<cr>
