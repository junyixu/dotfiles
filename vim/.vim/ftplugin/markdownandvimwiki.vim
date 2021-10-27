vnoremap <buffer><silent> <localleader>b "zc**<C-R>z**<ESC>
vnoremap <buffer><silent> <localleader>i "zc*<C-R>z*<ESC>
vnoremap <buffer><silent> <localleader>u "zc_<C-R>z_<ESC>

nnoremap <expr><silent> <localleader><localleader> &filetype=='vimwiki' ? ":setlocal filetype=markdown<cr>" :  ":setlocal filetype=vimwiki<cr>"
