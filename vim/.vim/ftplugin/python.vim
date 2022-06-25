" 在 Python 文件中将 Tab 展开成空格
setlocal expandtab

let b:ycm_hover = {
  \ 'command': 'GetDoc',
  \ 'syntax': 'markdown'
  \ }

" nmap <space>x <Plug>JupyterExecute
" nmap <space>X <Plug>JupyterExecuteAll

let $PYTHONUNBUFFERED=1
" =================== jupyter vim ========================={{{
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
" =================== end jupyter vim =========================}}}


command! PythonNormalModeCreateCell :execute 'normal! :set paste<CR>m`O# %%<ESC>``:set nopaste<CR>'
command! PythonVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O# %%<CR># %%<ESC>P:set nopaste<CR>'
command! PythonInsertModeCreateCell :execute 'normal! I# %% '

nnoremap <buffer><silent> <M-c> :PythonNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>PythonVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:PythonInsertModeCreateCell<CR>

" ===================== slime ======================{{{
let b:slime_cell_delimiter = "# %%"
if !exists("g:slime_dispatch_ipython_pause")
  let g:slime_dispatch_ipython_pause = 100
end

function! _EscapeText_python(text)
  if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--\n"]
  else
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
    let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
    let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
    let except_pat = '\(elif\|else\|except\|finally\)\@!'
    let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
    return substitute(dedented_lines, add_eol_pat, "\n", "g")
  end
endfunction


noremap <localleader>d :call slime#send("help(" . expand("<cword>").")\r")<CR>

" ===================== end slime ======================}}}

let g:jupyter_ascending_default_mappings=0
nmap <buffer> <localLeader>x <Plug>JupyterExecute
nmap <buffer> <localLeader>X <Plug>JupyterExecuteAll
source $HOME/.vim/ycmMaps.vim
