" " text: **strong** or __strong__
" let g:vimwiki_syntax_variables.markdown.rxBold = '\%(^\|\s\|[[:punct:]]\)\@<='.
"       \'[*_][*_]'.
"       \'\%([^*`[:space:]][^*`]*[^*`[:space:]]\|[^*`[:space:]]\)'.
"       \'[*_][*_]'.
"       \'\%([[:punct:]]\|\s\|$\)\@='
" let g:vimwiki_syntax_variables.markdown.char_bold = '__\|\*\*'

" " text: *italic* or _italic_
" let g:vimwiki_syntax_variables.markdown.rxItalic = '\%(^\|\s\|[[:punct:]]\)\@<='.
"       \'[*_][^*_]'.
"       \'\%([^_`[:space:]][^_`]*[^_`[:space:]]\|[^*`[:space:]]\)'.
"       \'[*_][^*_]'.
"       \'\%([[:punct:]]\|\s\|$\)\@='
" let g:vimwiki_syntax_variables.markdown.char_italic = '_\|\*'

" " text: **_bold italic_** or _**italic bold**_
" let g:vimwiki_syntax_variables.markdown.rxBoldItalic = '\%(^\|\s\|[[:punct:]]\)\@<='.
"       \'\*\*_'.
"       \'\%([^*_`[:space:]][^*_`]*[^*_`[:space:]]\|[^*_`[:space:]]\)'.
"       \'_\*\*'.
"       \'\%([[:punct:]]\|\s\|$\)\@='
" let g:vimwiki_syntax_variables.markdown.char_bolditalic = '\*\*_'

" let g:vimwiki_syntax_variables.markdown.rxItalicBold = '\%(^\|\s\|[[:punct:]]\)\@<='.
"       \'_\*\*'.
"       \'\%([^*_`[:space:]][^*_`]*[^*_`[:space:]]\|[^*_`[:space:]]\)'.
"       \'\*\*_'.
"       \'\%([[:punct:]]\|\s\|$\)\@='
" let g:vimwiki_syntax_variables.markdown.char_italicbold = '_\*\*'

" " Bonus: vimwiki only has cterm=bold by default. ¯\_(ツ)_/¯
" hi VimwikiBoldItalic term=bold cterm=bold,italic gui=bold,italic


" syn region mkdItalic matchgroup=mkdItalic start="\%(\*\|_\)"    end="\%(\*\|_\)"
" syn region mkdBold matchgroup=mkdBold start="\%(\*\*\|__\)"    end="\%(\*\*\|__\)"
" syn region mkdBoldItalic matchgroup=mkdBoldItalic start="\%(\*\*\*\|___\)"    end="\%(\*\*\*\|___\)"
