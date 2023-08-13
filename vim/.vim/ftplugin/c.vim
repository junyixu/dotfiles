" <buffer> == set local


nnoremap <localleader>s :call Switch2HeadOrSrc()<CR>
nnoremap <localleader>r :AsyncRun gcc % && ./a.out<cr>
" nnoremap <F8> :AsyncRun make test<cr>
" nnoremap <F9> :AsyncTask project-build<cr>
" nnoremap <F10> :AsyncTask project-run<cr>
source $HOME/.vim/my_maps/GreekLetter4Programming.vim 
