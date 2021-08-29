setlocal commentstring=(*\ %s\ *)
nnoremap <buffer> <leader>r :w<cr>:AsyncRun -raw wolframscript -file %<cr>
nnoremap <buffer> <F5>  :w<cr>:AsyncRun -raw wolframscript -file %<cr>
