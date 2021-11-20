if $isWSL!='1' || exists("g:loaded_wslclip")
  finish
endif
let g:loaded_wslclip = 1

" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows

" yank
set clipboard=unnamed

autocmd TextYankPost * call system('win32yank.exe -i --crlf', @")

function! Paste(mode)
    let @" = system('win32yank.exe -o --lf')
    return a:mode
endfunction

map <expr> "+p Paste('p')
map <expr> "+P Paste('P')


" paste
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc
vnoremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
vnoremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx


