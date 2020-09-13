nnoremap <buffer><silent> <leader>r :w<cr>:AsyncRun octave %<cr>
setlocal complete=.,k,w,b,t
"====================== matlab =========================={{{
autocmd FileType matlab compiler mlint
" autocmd FileType matlab vnoremap <buffer> <F5> :call RunSelectInMatlab()<CR>
" autocmd FileType matlab nnoremap <buffer> <F5> :call RunCurrentFileInMatlab()<CR>
" autocmd FileType matlab nnoremap <buffer> <localleader>K :call GetMatlabDoc()<CR>
let g:matlab_term_cmd='matlab -nodesktop -nosplash'

" autocmd FileType matlab noremap <buffer> <localleader>r  :call matlab#RunSelected()<CR>
nnoremap <buffer> <localleader>r  :call matlab#RunCell()<CR>
nnoremap <buffer> <localleader>R  :call matlab#RunCurrentFile()<CR>
nnoremap <buffer> <localleader>K  :call matlab#GetDoc()<CR>
nnoremap <buffer> <F10>  :call matlab#Toggle()<CR>
let g:matlab_screen_terminal_height = 6
nnoremap <buffer><localleader>b  :call matlab#SetBreak()<CR>
nnoremap <buffer><localleader>v  :call matlab#WatchVarible()<CR>
nnoremap <buffer><localleader>f  :call matlab#OpenCurrentFile()<CR>
nnoremap <buffer><localleader>af :call matlab#OpenAllFile()<CR>
nnoremap <buffer><localleader>w  :call matlab#OpenWorkspace()<CR>
nnoremap <buffer><localleader>c  :call matlab#ClearVariables()<CR>
nnoremap <buffer><localleader>s  :call matlab#GetVariableSize()<CR>
"====================== end matlab ==========================}}}
