" tags {{{
setlocal tags+=$HOME/.vim/julia/julia-tags/LinearAlgebra_tags
setlocal tags+=$HOME/.vim/julia/julia-tags/Statistics_tags
setlocal tags+=$HOME/.vim/julia/julia-tags/base_tags
setlocal tags+=$HOME/.julia/packages/Symbolics/tags
setlocal tags+=$HOME/.julia/packages/HDF5/tags
setlocal tags+=$HOME/.julia/packages/PyPlot/tags
setlocal tags+=$HOME/.julia/packages/RowEchelon/tags
setlocal tags+=$HOME/.local/stow/julia-1.7.2/share/julia/stdlib/v1.7/tags
" }}}
setlocal iskeyword+=!

" let b:delimitMate_quotes = "\""
nnoremap <silent><buffer> <localleader>d :call slime#send("@doc " . expand("<cword>") . "\r")<CR>
vnoremap <silent><buffer> <localleader>d :<c-u>call slime#send("@doc " . @* . "\r")<CR>
vnoremap <silent><buffer> <localleader>l :<c-u>call slime#send("@less " . @* . "\r")<CR>
noremap <buffer> <localleader>sm :call slime#send("methods(" . expand("<cword>") . ")\r")<cr>
noremap <buffer> <localleader>t :call slime#send("typeof(" . expand("<cword>") . ")\r")<cr>
noremap <buffer> <localleader>si :call slime#send(expand("<cword>") . "\r")<cr>
" noremap <leader>sje :call slime#send("@edit " . expand("<cword>") . "\r")<cr>

" send OhMyREPL
" 放在 ~/.julia/config/startup.jl 里会拖慢 julia 的加载
noremap <buffer> <localleader>so :call slime#send("using OhMyREPL" . "\r")<cr>

let g:latex_to_unicode_auto=0	
let g:latex_to_unicode_cmd_mapping=['<Tab>']

let g:julia_cell_use_primary_selection=1
let g:julia_cell_cmd='@paste'
let b:slime_cell_delimiter = "# %%"
let g:julia_cell_delimit_cells_by = "tags"
let g:julia_cell_tag = "# %%"
setlocal omnifunc=syntaxcomplete#Complete

" 不要在 ] 的后面按'自动拓展为 ''
let b:delimitMate_smart_quotes = '\%(\w\|[^[:punct:][:space:]]\|\]\|\%(\\\\\)*\\\)\%#\|\%#\%(\w\|[^[:space:][:punct:]]\)'

command! JuliaNormalModeCreateCell :execute 'normal! :set paste<CR>m`O# %%<ESC>``:set nopaste<CR>'
command! JuliaVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O# %%<CR># %%<ESC>P:set nopaste<CR>'
command! JuliaInsertModeCreateCell :execute 'normal! I# %% '

nnoremap <buffer><silent> <M-c> :JuliaNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>JuliaVisualModeCreateCell<CR>

source $HOME/.vim/ycmMaps.vim

xmap <silent><buffer> <CR> <Plug>SlimeRegionSend
let g:latex_to_unicode_tab = "insert"
xmap <silent><buffer> <localleader>r :<c-u>call slime#send("@paste" . "\r")<CR>
nmap <silent><buffer> <space><space> <Plug>SlimeParagraphSend
nmap <silent><buffer> <localleader>C <Plug>SlimeConfig
nmap <buffer> <M-CR> <Plug>SlimeSendCell
nmap <silent><buffer> <CR> :exec "normal \<Plug>SlimeLineSend"<cr>j

" map <Leader>jr to run entire file
nnoremap <buffer> <Leader>r :JuliaCellRun<CR>

" map <Leader>jc to execute the current cell

" nmap <silent><buffer> <localleader>r :JuliaCellExecuteCell<CR>
nnoremap <silent><buffer> <localleader>r :exec "normal \<Plug>SlimeSendCell"<cr>

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

source $HOME/.vim/my_maps/GreekLetter4Programming.vim 
