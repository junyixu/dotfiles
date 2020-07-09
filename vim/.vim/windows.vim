"set pythondll=$HOME\Python27\python27.dll

"let $PYTHONHOME='$HOME\python-3'
"let $PYTHONHOME='C:\Users\junyi\AppData\Local\Microsoft\WindowsApps\'

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"<https://vi.stackexchange.com/questions/15090/syntax-highlighting-of-underscores-in-latex-even-though-they-only-appear-in-fil>
let g:tex_no_error=1
"if has('win32') || has ('win64')
"	let $VIMHOME = $VIM."/vimfiles"
"else
"	let $VIMHOME = $HOME."/.vim"
"endif

if has("vms") 
set nobackup " do not keep a backup file, use versions instead 
" else 
" set backup " keep a backup file 
"set nowritebackup
endif
if has('win32') || has('win64') || has('win95') || has('win16')
	set dir=~\tmp
	"------------Gvim中文菜单乱码解决方案-------------
	" 参考 http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
	" 设置文件编码格式
	set encoding=utf-8
	set fileencoding=utf-8

	set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
	"解决菜单乱码 删除菜单，再重新添加菜单，vim会按照之前设定的编码格式创建菜单栏
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

	"解决consle提示信息输出乱码
	language messages zh_CN.utf-8

	"--------以上是Gvim中文菜单乱码解决方案------------
endif

"====================== begin airline==========================
"let g:airline_theme='molokai'
"let g:airline#extensions#tabline#enabled = 0
"let g:airline_powerline_fonts = 1
" 由于不会用 airline 所以 pacman -S powerline ...
"====================== end airline==========================

"-------------------gvimrc-------------------------------"
"set linespace=0				"Gvim-specific line-height.
set guioptions-=m
"set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=t
set guioptions-=T
set guioptions-=r
"set guifont=SourceCodePro\ 14
set guifont=MesloLGS_NF:h14:cANSI
"set guifont=Courier\ 10\ Pitch\ 16


" Make it easy to edit the .vimrc file.
nmap <Leader>ev :tabedit ~/.vim/windows.vim<cr>
" Make it easy to edit the plugs file.
nmap <Leader>ep :tabedit ~/.vim/windows_plugs.vim<cr>

