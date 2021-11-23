syn match IJuliaCell			"^#%%\([^#]\|$\).*$"

highlight IJuliaCell        ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold

" 对于已经定义的高亮，不能用 hi def link，只能用 hi link
hi link juliaFunctionCall juliaFunction

syntax keyword juliaFunction println zero zeros summary
