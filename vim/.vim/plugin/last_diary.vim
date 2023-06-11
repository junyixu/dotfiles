if exists("g:loaded_last_diary") || !has('python3')
  finish
endif
let g:loaded_last_diary = 1

try " abort on fail
  exe 'py3file' expand('<sfile>:r') . '.py'
  autocmd filetype markdown nnoremap <buffer> <localleader>p :py3 last_diary()<cr>
  autocmd filetype markdown nnoremap <buffer> <localleader>n :py3 next_diary()<cr>
endtry
