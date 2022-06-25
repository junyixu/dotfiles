if &omnifunc == "" 
	setlocal omnifunc=syntaxcomplete#Complete
endif

setlocal commentstring=%\ %s

let b:delimitMate_smart_quotes = '\%(\w\|[^[:punct:][:space:]]\|\]\|\%(\\\\\)*\\\)\%#\|\%#\%(\w\|[^[:space:][:punct:]]\)'

command! MatlabNormalModeCreateCell :execute 'normal! :set paste<CR>m`O%%<ESC>``:set nopaste<CR>'
command! MatlabVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O%%<CR>%%<ESC>P:set nopaste<CR>'
command! MatlabInsertModeCreateCell :execute 'normal! I%% '

nnoremap <buffer><silent> <M-c> :MatlabNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>MatlabVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:MatlabInsertModeCreateCell<CR>


" mlint停止报错
nnoremap <buffer><silent> <localleader>a A %#ok<ESC>

command! MatlabFix :!mh_style --fix %
nnoremap <buffer> <localleader>f :MatlabFix<CR>

" command! MatlabFix :execute '!mh_style --fix '. expand('%')<CR>
source $HOME/.vim/ycmMaps.vim
