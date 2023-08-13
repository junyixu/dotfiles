if get(g:, 'vim_markdown_math', 0)
  syn region mkdMath start="\\\@<!\\(" end="\\)" contains=@tex keepend
  syn region mkdMath start="\\\@<!\\\[" end="\\\]" contains=@tex keepend
endif

" " https://gist.github.com/huytd/668fc018b019fbc49fa1c09101363397

" " if exists("b:current_syntax")
" "   finish
" " endif

" " Custom conceal
" syntax match todoCheckbox   '\v(\s+)?(-|\*)\s\[\s\]'hs=e-4 conceal cchar=
" syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[X\]'hs=e-4 conceal cchar=
" syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[-\]'hs=e-4 conceal cchar=☒
" syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[\.\]'hs=e-4 conceal cchar=⊡
" syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[o\]'hs=e-4 conceal cchar=⬕

" let b:current_syntax = "todo"

" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE
