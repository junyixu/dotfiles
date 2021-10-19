nnoremap <buffer> <localleader>l :Git pull<CR>
nnoremap <buffer> <localleader>f :Git fetch<CR>
nnoremap <buffer> <localleader>p :Git push<CR>
nnoremap <buffer> <localleader>m :Git merge<CR>
nnoremap <buffer> <localleader>c<space> :Git commit -m ""<LEFT>
nnoremap <buffer> <localleader>c<cr> :Git commit<cr>
nnoremap <buffer> <localleader>cc :Git commit -m "update"<cr>

" I find the below is unnecessary
" nmap <buffer> a s

" s to use as window prefix
nnoremap <buffer> s <C-w>
