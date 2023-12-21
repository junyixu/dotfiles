setlocal foldmethod=syntax
setlocal foldlevel=1

nnoremap <buffer> <localleader>l :Git pull<CR>
nnoremap <buffer> <localleader>f :Git fetch<CR>
nnoremap <buffer> <localleader>p :Git push<CR>
nnoremap <buffer> <localleader>c<space> :Git commit -m ""<LEFT>
nnoremap <buffer> <localleader>cc :Git commit -m "update"<cr>

" TODO git checkout $(git_main_branch)
nnoremap <buffer> com :Git checkout main<cr>


" I find the below is unnecessary
" nmap <buffer> a s

" s to use as window prefix
nmap <buffer> s <C-w>
