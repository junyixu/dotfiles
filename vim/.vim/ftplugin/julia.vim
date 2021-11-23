noremap <localleader>d :call slime#send("@doc " . expand("<cword>") . "\r")<CR>
noremap <localleader>sm :call slime#send("methods(" . expand("<cword>") . ")\r")<cr>
noremap <localleader>si :call slime#send(expand("<cword>") . "\r")<cr>
" noremap <leader>sje :call slime#send("@edit " . expand("<cword>") . "\r")<cr>

" send OhMyREPL
" 放在 ~/.julia/config/startup.jl 里会拖慢 julia 的加载
noremap <localleader>so :call slime#send("using OhMyREPL" . "\r")<cr>
