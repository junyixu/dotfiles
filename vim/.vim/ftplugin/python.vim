let $PYTHONUNBUFFERED=1
nnoremap <buffer> <leader>r :w<cr>:AsyncRun -raw python %<cr>
nnoremap <buffer> <F5>  :w<cr>:AsyncRun -raw python %<cr>

" Run current file
nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
nnoremap <buffer> <silent> <CR> :JupyterSendCell<CR>
nnoremap <buffer> <silent> <C-CR> :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
nnoremap <buffer> <localleader><localleader> :JupyterSendRange<CR>
nmap     <buffer> <silent> <localleader>r <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>r <Plug>JupyterRunVisual
vmap     <buffer> <silent> <localleader><localleader> <Plug>JupyterRunVisual

nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>
"
" Connect
nnoremap <buffer> <silent> <localleader>C :JupyterConnect<CR>

" Debugging maps
nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>
