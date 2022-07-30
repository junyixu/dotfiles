" <buffer> == set local

nnoremap <F5> :AsyncRun gcc % && ./a.out<cr>
nnoremap <F9> :AsyncTask project-build<cr>
nnoremap <F10> :AsyncTask project-run<cr>
