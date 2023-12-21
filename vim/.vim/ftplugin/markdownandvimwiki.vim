setlocal dictionary+=~/.vim/dict/markdown.dict
setlocal thesaurus=~/.vim/thesaurus/english.txt

setlocal complete+=k

" vimwiki 的数学无法包括 tex 语法
" 所以在适当时候 setlocal ft=markdown 来用 tex 的数学 Ultisnips
nnoremap <expr><silent> <localleader>f &filetype=='vimwiki' ? ":setlocal filetype=markdown<CR>" :  ":setlocal filetype=vimwiki<CR>"


source $HOME/.vim/my_maps/GreekLetter4Writting.vim 
