if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

" not equal
syntax match matlabOperator "\~=" conceal cchar=≠

setlocal conceallevel=1
setlocal concealcursor=n
