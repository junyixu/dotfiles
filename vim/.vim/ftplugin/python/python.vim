let $PYTHONUNBUFFERED=1
" Run current file
"nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
"nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>

"" Change to directory of current file
"nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

"" Send a selection of lines
"nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
"nnoremap <buffer> <silent> <localleader><CR> :JupyterSendCell<CR>
"nnoremap <buffer> <silent> <localleader><C-CR> :JupyterSendCell<CR>
"nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
"" nnoremap <buffer> <localleader><localleader> :JupyterSendRange<CR>
"nmap     <buffer> <silent> <localleader>r <Plug>JupyterRunTextObj
"vmap     <buffer> <silent> <localleader>r <Plug>JupyterRunVisual
"" vmap     <buffer> <silent> <localleader><localleader> <Plug>JupyterRunVisual

"nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>
""
"" Connect
"nnoremap <buffer> <silent> <localleader>C :JupyterConnect<CR>

"" Debugging maps
"nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

let g:slime_cell_delimiter = "##"

command! PythonNormalModeCreateCell :execute 'normal! :set paste<CR>m`O##<ESC>``:set nopaste<CR>'
command! PythonVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O##<CR>##<ESC>P:set nopaste<CR>'
command! PythonInsertModeCreateCell :execute 'normal! I## '

nnoremap <buffer><silent> <M-c> :PythonNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>PythonVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:PythonInsertModeCreateCell<CR>

source $HOME/.vim/ycmMaps.vim
