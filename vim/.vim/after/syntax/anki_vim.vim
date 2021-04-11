
" syntax match ankiOperator "\[$\]" conceal cchar=l
" syntax match ankiOperator "\[/$\]" conceal cchar=l
" syn region texMathZoneX	matchgroup=Delimiter start="\[\$\]" skip="\%(\\\\\)*\\\$"	matchgroup=Delimiter	end="\[/\$\]"	end="%stopzone\>"		contains=@texMathZoneGroup

" hi link ankiOperator Operator
setlocal conceallevel=2
