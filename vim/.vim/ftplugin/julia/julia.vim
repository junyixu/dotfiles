let g:latex_to_unicode_auto=0	
let g:latex_to_unicode_cmd_mapping=['<M-g>']

let b:slime_cell_delimiter = "#%%"
setlocal omnifunc=syntaxcomplete#Complete


command! JuliaNormalModeCreateCell :execute 'normal! :set paste<CR>m`O#%%<ESC>``:set nopaste<CR>'
command! JuliaVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O#%%<CR>%%<ESC>P:set nopaste<CR>'
command! JuliaInsertModeCreateCell :execute 'normal! I#%% '

nnoremap <buffer><silent> <M-c> :JuliaNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>JuliaVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:JuliaInsertModeCreateCell<CR>


source $HOME/.vim/ycmMaps.vim
