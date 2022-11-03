" <buffer> == set local


nnoremap <localleader>s :call Switch2HeadOrSrc()<CR>
nnoremap <F5> :AsyncRun gcc % && ./a.out<cr>
nnoremap <F9> :AsyncTask project-build<cr>
nnoremap <F10> :AsyncTask project-run<cr>


nnoremap <localleader>ei :e include/%:t:r.h<cr>
