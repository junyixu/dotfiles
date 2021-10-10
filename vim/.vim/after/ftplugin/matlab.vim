" https://vim.fandom.com/wiki/Completion_using_a_syntax_file
" :help ft-syntax-omni
setlocal omnifunc=syntaxcomplete#Complete

" nnoremap <buffer><silent> <leader>r :w<cr>:AsyncRun octave %<cr>
" setlocal complete=.,k,w,b,t

" autocmd FileType matlab compiler mlint
" autocmd FileType matlab vnoremap <buffer> <F5> :call RunSelectInMatlab()<CR>
" autocmd FileType matlab nnoremap <buffer> <F5> :call RunCurrentFileInMatlab()<CR>
" autocmd FileType matlab nnoremap <buffer> <localleader>K :call GetMatlabDoc()<CR>

" autocmd FileType matlab noremap <buffer> <localleader>r  :call matlab#RunSelected()<CR>

" if !has('nvim')
" begin yinflying/matlab.vim {{{
" let g:matlab_term_cmd='matlab -nodesktop -nosplash'
" nnoremap <buffer> <localleader>r  :call matlab#RunCell()<CR>
" nnoremap <buffer> <localleader>R  :call matlab#RunCurrentFile()<CR>
" nnoremap <buffer> <localleader>K  :call matlab#GetDoc()<CR>
" nnoremap <buffer> <F10>  :call matlab#Toggle()<CR>
" let g:matlab_screen_terminal_height = 6
" nnoremap <buffer><localleader>b  :call matlab#SetBreak()<CR>
" nnoremap <buffer><localleader>v  :call matlab#WatchVarible()<CR>
" nnoremap <buffer><localleader>f  :call matlab#OpenCurrentFile()<CR>
" nnoremap <buffer><localleader>af :call matlab#OpenAllFile()<CR>
" nnoremap <buffer><localleader>w  :call matlab#OpenWorkspace()<CR>
" nnoremap <buffer><localleader>c  :call matlab#ClearVariables()<CR>
" nnoremap <buffer><localleader>s  :call matlab#GetVariableSize()<CR>
" yinflying/matlab.vim }}}
" endif

" begin daeyun vim-matlab {{{
" if has('nvim')
" nnoremap <buffer>         <localleader>rn :MatlabRename
" nnoremap <buffer><silent> <localleader>fn :MatlabFixName<CR>
" " vnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunSelection<CR>
" " nnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunCell<CR>
" nnoremap <buffer><silent> <localleader><localleader> :MatlabCliRunLine<CR>
" nnoremap <buffer><silent> <localleader>i <ESC>:MatlabCliViewVarUnderCursor<CR>
" vnoremap <buffer><silent> <localleader>i <ESC>:MatlabCliViewSelectedVar<CR>
" nnoremap <buffer><silent> <localleader>k <ESC>:MatlabCliHelp<CR>
" nnoremap <buffer><silent> <localleader>e <ESC>:MatlabCliOpenInMatlabEditor<CR>
" nnoremap <buffer><silent> <localleader>c :MatlabCliCancel<CR>
" nnoremap <buffer><silent> <C-l> :MatlabNormalModeCreateCell<CR>
" vnoremap <buffer><silent> <C-l> :<C-u>MatlabVisualModeCreateCell<CR>
" inoremap <buffer><silent> <C-l> <C-o>:MatlabInsertModeCreateCell<CR>
" endif
" daeyun vim-matlab }}
let g:slime_cell_delimiter = "%%"
