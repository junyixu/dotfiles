" :help fo-table
setlocal formatoptions-=o

" using LinearAlgebra
" 这样可以在按 gf 的时候跳转到 LinearAlgebra.jl
" 但我可能用了别的什么插件，不需要 setlocal suffixesadd=.jl 也能用
setlocal path+=$HOME/scripts/julia/modules
setlocal path+=$HOME/.julia/packages/**/*

let g:ycm_disable_signature_help = 1
