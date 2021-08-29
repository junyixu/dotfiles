" syn include @tex syntax/tex.vim
" syn region mkdMath start="\\\@<!'\$" end="\$'" skip="\\\$" contains=@tex keepend
" syn region mkdMath start="\\\@<!\$\$" end="\$\$" skip="\\\$" contains=@tex keepend

" let b:current_syntax = 'python'
syn match IPythonCell			"^##\([^#]\|$\).*$"

highlight IPythonCell        ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold
