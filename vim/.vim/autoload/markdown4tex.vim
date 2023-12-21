" LaTeX math 推荐 \( \) 和 \[ \]
" TeX math 依然使用 $ $ 和 $$ $$
" markdown math 转换成 LaTeX math
fun markdown4tex#mathconvert()
	" 把 \[ math \] 替换成 $$ math $$
  silent! %s/\\\[\(.\{-1,}\)\\\]/\$\$\1\$\$/g
	" 把\( math \) 替换成 $ math $
	silent! %s/\\(\(.\{-1,}\)\\)/\$\1\$/g
	silent! normal 
endf
