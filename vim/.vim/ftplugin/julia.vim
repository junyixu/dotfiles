" tags {{{
setlocal tags+=$HOME/packages/julias/julia-1.7/share/julia/stdlib/v1.7/LinearAlgebra/tags
setlocal tags+=$HOME/packages/julias/julia-1.7/share/julia/stdlib/v1.7/Statistics/tags
setlocal tags+=$HOME/packages/julias/julia-1.7/share/julia/base/tags
setlocal tags+=$HOME/.julia/packages/Symbolics/1OrKJ/tags
" }}}

" let b:delimitMate_quotes = "\""
nnoremap <buffer> <localleader>d :call slime#send("@doc " . expand("<cword>") . "\r")<CR>
vnoremap <buffer> <localleader>d :<c-u>call slime#send("@doc " . @* . "\r")<CR>
vnoremap <buffer> <localleader>l :<c-u>call slime#send("@less " . @* . "\r")<CR>
noremap <buffer> <localleader>sm :call slime#send("methods(" . expand("<cword>") . ")\r")<cr>
noremap <buffer> <localleader>t :call slime#send("typeof(" . expand("<cword>") . ")\r")<cr>
noremap <buffer> <localleader>si :call slime#send(expand("<cword>") . "\r")<cr>
" noremap <leader>sje :call slime#send("@edit " . expand("<cword>") . "\r")<cr>

" send OhMyREPL
" 放在 ~/.julia/config/startup.jl 里会拖慢 julia 的加载
noremap <buffer> <localleader>so :call slime#send("using OhMyREPL" . "\r")<cr>

let g:latex_to_unicode_auto=0	
let g:latex_to_unicode_cmd_mapping=['<M-g>']

let g:julia_cell_use_primary_selection=1
let g:julia_cell_cmd='@paste'
let b:slime_cell_delimiter = "# %%"
let g:julia_cell_delimit_cells_by = "tags"
let g:julia_cell_tag = "# %%"
setlocal omnifunc=syntaxcomplete#Complete


command! JuliaNormalModeCreateCell :execute 'normal! :set paste<CR>m`O# %%<ESC>``:set nopaste<CR>'
command! JuliaVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O# %%<CR># %%<ESC>P:set nopaste<CR>'
command! JuliaInsertModeCreateCell :execute 'normal! I# %% '

nnoremap <buffer><silent> <M-c> :JuliaNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>JuliaVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:JuliaInsertModeCreateCell<CR>

let g:ycm_disable_signature_help = 1
source $HOME/.vim/ycmMaps.vim

xmap <silent><buffer> <CR> <Plug>SlimeRegionSend
xmap <silent><buffer> <localleader>r :<c-u>call slime#send("@paste" . "\r")<CR>
nmap <silent><buffer> <space><space> <Plug>SlimeParagraphSend
nmap <silent><buffer> <localleader>C <Plug>SlimeConfig
nmap <buffer> <M-CR> <Plug>SlimeSendCell
nmap <silent><buffer> <CR> :exec "normal \<Plug>SlimeLineSend"<cr>j

" map <Leader>jr to run entire file
nnoremap <buffer> <Leader>r :JuliaCellRun<CR>

" map <Leader>jc to execute the current cell
nmap <silent><buffer> <localleader>r :JuliaCellExecuteCell<CR>

" map <Leader>jC to execute the current cell and jump to the next cell
nnoremap <buffer> <localLeader>R :JuliaCellExecuteCellJump<CR>

" map <Leader>jl to clear Julia screen
nnoremap <buffer> <localLeader><c-l> :JuliaCellClear<CR>

" map <Leader>jp and <Leader>jn to jump to the previous and next cell header
nnoremap <buffer> [d :JuliaCellPrevCell<CR>
nnoremap <buffer> ]d :JuliaCellNextCell<CR>


" jupyter_ascending
let g:jupyter_ascending_match_pattern     = '.sync.jl'
let g:jupyter_ascending_default_mappings=0
nmap <buffer> <localLeader>x <Plug>JupyterExecute
nmap <buffer> <localLeader>X <Plug>JupyterExecuteAll
