"---------------------c language---------------------------------"
inoremap <buffer> {<CR> {<CR>}<ESC>O

"c 文件的编译运行
"BufNewFile,BufRead
"
"下面这句已经不需要了，因为有了 vim-templates 插件 和 Ultisnips 插件
"autocmd BufNewFile,BufRead *.c nmap <leader>main i#include <stdio.h><ESC>o<cr>int main(int argc, char *argv[]<ESC>o{<cr>return 0;<ESC>O<ESC>O
"autocmd BufNewFile,BufRead *.c nnoremap <F5> :w<cr>:!gcc % -lm && ./a.out<cr>

"为什么初始打开 c 文件时不能"autocmd bufreadpost *.c nnoremap <f5> :w<cr>:!gcc % -lm && ./a.out<cr>
"autocmd bufreadpost *.c inoremap print printf("<esc>a;<esc>f"i
"autocmd bufreadpost *.c inoremap scan scanf("<esc>a;<esc>f"i

"autocmd BufNewFile,BufRead *.c au VimEnter * RainbowParenthesesToggle
"autocmd BufNewFile,BufRead *.c au Syntax * RainbowParenthesesLoadRound
"autocmd BufNewFile,BufRead *.c au Syntax * RainbowParenthesesLoadSquare
"autocmd BufNewFile,BufRead *.c au Syntax * RainbowParenthesesLoadBraces
"autocmd BufNewFile,BufRead *.c au Syntax * RainbowParenthesesLoadChevrons
"
"autocmd BufNewFile,BufRead *.cpp au VimEnter * RainbowParenthesesToggle
"autocmd BufNewFile,BufRead *.cpp au Syntax * RainbowParenthesesLoadRound
"autocmd BufNewFile,BufRead *.cpp au Syntax * RainbowParenthesesLoadSquare
"autocmd BufNewFile,BufRead *.cpp au Syntax * RainbowParenthesesLoadBraces
"autocmd BufNewFile,BufRead *.cpp au Syntax * RainbowParenthesesLoadChevrons
