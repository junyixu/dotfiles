vnoremap <buffer><silent> <localleader>b "zc**<C-R>z**<ESC>
vnoremap <buffer><silent> <localleader>i "zc*<C-R>z*<ESC>
vnoremap <buffer><silent> <localleader>u "zc_<C-R>z_<ESC>

" vimwiki 的数学无法包括 tex 语法
" 所以在适当时候 setlocal ft=markdown 来用 tex 的数学 Ultisnips
nnoremap <expr><silent> <localleader>f &filetype=='vimwiki' ? ":setlocal filetype=markdown<CR>" :  ":setlocal filetype=vimwiki<CR>"
