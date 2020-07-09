"----------------------Markdown---------------------------------"
" autocmd filetype markdown nnoremap ZZ :Pangu<cr>ZZ
setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查

"markdown-preview.nvim
map <Leader>vm :MarkdownPreview<cr>

"句首字母大写
for char in split('abcdefghijklmnopqrstuvwxyz', '\zs')
    exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnw') ? '%s' : '%s'", char, toupper(char), char)
endfor

for char in split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnW') ? '%s' : '%s'", char, tolower(char), char)
endfor
