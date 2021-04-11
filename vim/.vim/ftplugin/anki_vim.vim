setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查
setlocal spellfile=~/.vim/spell/en.utf-8.add
setlocal spellfile+=~/.vim/spell/latex.utf-8.add

if !has('gui_running')
" 我有时不想手写字母大写，gruvbox 终端拼写检查的提示是红色，很刺眼，错误反而是绿色，晕，也许应该学学改配色了
setlocal spellcapcheck=""
endif
