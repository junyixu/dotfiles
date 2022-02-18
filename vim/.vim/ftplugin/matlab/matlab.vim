setlocal commentstring=%\ %s

command! MatlabNormalModeCreateCell :execute 'normal! :set paste<CR>m`O%%<ESC>``:set nopaste<CR>'
command! MatlabVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O%%<CR>%%<ESC>P:set nopaste<CR>'
command! MatlabInsertModeCreateCell :execute 'normal! I%% '

nnoremap <buffer><silent> <M-c> :MatlabNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>MatlabVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:MatlabInsertModeCreateCell<CR>


" mlint停止报错
nnoremap <buffer><silent> <localleader>a A %#ok<ESC>

source $HOME/.vim/ycmMaps.vim
