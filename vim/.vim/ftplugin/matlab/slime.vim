" Check if line is commented out
function! s:Is_comment(line)
  return (match(a:line, "^[ \t]*%.*") >= 0)
endfunction

" Remove commented out lines
function! s:Remove_line_comments(lines)
  return filter(copy(a:lines), "!s:Is_comment(v:val)")
endfunction

" vim slime handler
function! _EscapeText_matlab(text)
  let l:lines = slime#common#lines(slime#common#tab_to_spaces(a:text))
  let l:lines = s:Remove_line_comments(l:lines)
  return slime#common#unlines(l:lines)
endfunction

" matlab 不用 在后面加 \r
" julia 需要加 \r
" 不知为什么
" noremap <localleader>d :call slime#send("help " . expand("<cword>") . "\r")<CR>
noremap <buffer> <localleader>d :call slime#send("help " . expand("<cword>"))<CR>
