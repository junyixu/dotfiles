nmap <buffer> J jp
nmap <buffer> K kp
autocmd BufEnter <buffer> if winnr('$') < 2| q | endif
