" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
"set verbose=20 verbosefile=~/vimtest
set nocompatible						"We want the latest Vim settings/options.
let mapleader = ','						"The default leader is \, but a comma is much better. 尽量减少小指的负担
" 替换查找（f 或 t) 上一个为 \
noremap \ ,

set mouse=a								"在所有模式开启鼠标
"set mouse=v								"用鼠标选中 string. 用了它就不能在 gvim 中用鼠标调整窗口了
"set t_ti= t_te=						"退出 vim 后，内容显示在终端屏幕，可以用于查看和复制好处：误删什么的，如果以前屏幕打开，可以找回

filetype on
filetype plugin indent on
syntax enable							" 打开语法高亮
syntax on								" 开启文件类型侦测

"set paste								"允许粘贴模式（避免粘贴时自动缩进影响格式）
"=========================================================================
"80 字符警戒线
"set cursorcolumn=80						" 80 字符警戒线
"set textwidth=80							" 超过 80 个字符 的时候自动换行
"set fo+=mB									" 使中文也能如此，其中 m 表示允许在两个汉字中间换行，而 B 表示将两行合为一行的时 候不要在两个汉字之间加入空格。
"=========================================================================

"set nrformats=								"把 vim 中所有的数字都当成十进制
set smarttab

" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置编辑时制表符占用空格数
set tabstop=4

"如果只想在 Python 文件中将 Tab 展开成空格，就改换成下面这句"
autocmd FileType python set expandtab
" set expandtab

"上面的一些配置已经可以让你避免编译出现错误的问题了"
"不过下面还有一些配置是建议同学们根据需要加上的"
set smartindent "智能缩进"
set cindent "C 语言风格缩进"
set autoindent "自动缩进"

set noautochdir							"在打开多个文件的时候不要自动切换目录

set wildmenu
set wildmode=longest:list,full
"命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
"=============================begin list ===========================
" 说明  Plug 'Yggdroot/indentLine' 只适用于空格，以下适用于 tab
"
"方案一
"set list                     " 显示 Tab 符，
"set listchars=tab:\┊\ ,      " 使用一高亮竖线代替 把符号显示为 |
"""set listchars=tab:>-,trail:-
"set listchars=tab:\┊\ ,nbsp:%,trail:-
"highlight LeaderTab guifg=#666666   " 设定行首 tab 为灰色
"match LeaderTab /\t/        " 匹配行首 tab

"方案二
"set listchars=tab:»■,trail:■
"set list								"如果行尾有多余的空格（包括 tab 键）, 该配置将让这些空格显示成可见的小方块。
"============================= end list===========================
"----------------------Fold--------------------------------------"
"set foldenable
set foldmethod=marker
"set foldcolumn=0			"设置折叠宽度
"setlocal foldlevel=1		"设置折叠层数为
"set foldclose=all			"设置自动关闭折叠
nnoremap <leader>z @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"---------------------tex---------------------------------"
"autocmd BufReadPost *.md setlocal spell spelllang=en_us,cjk		"忽略中文对英文进行拼写检查
" 更改拼写错误
inoremap <M-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"set spell spelllang=en_us				"打开英语单词的拼写检查
"set 和 setlocal 的区别：set 可以对新开的窗口和标签生效？
"---------------------------------------------------------"
set magic
set backspace=indent,eol,start			"Make backspace behave like every other editor


"---------------------Search---------------------------------"
set hlsearch
set incsearch
set ignorecase smartcase				" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

"---------------------Window Split Management----------------------"
set splitbelow
set splitright

" for windows
set t_ut=""

" 暂时没找到好的调整窗口大小的方法
nnoremap <M-K> <C-w>+
nnoremap <M-J> <C-w>-
nnoremap <M-H> <C-w><
nnoremap <M-L> <C-w>>
nnoremap sz <C-w>|
" nnoremap <C-w>\ <C-w><C-v>
" nnoremap <C-w>- <C-w><C-s>
"---------------------vim Functions-------------------------------"
" 定义跳出括号函数，用于跳出括号
"function! SkipThePair()
"	if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
"		return "\<ESC>la"
"	else
"		return "\t"
"	endif
"endfunc
"" 将 tab 键绑定为跳出括号引号
"inoremap <TAB> :call SkipThePair()<CR>


" 数中文字符有多少个
function! ChineseCount() range
	let save = @z
	silent exec 'normal! gv"zy'
	let text = @z
	let @z = save
	silent exec 'normal! gv'
	let cc = 0
	for char in split(text, '\zs')
		if char2nr(char) >= 0x2000
			let cc += 1
		endif
	endfor
	echo "Count of Chinese charasters is:"
	echo cc
endfunc
vnoremap <F7> :call ChineseCount()<cr>

"---------------------Auto-Command---------------------------------"
"Automatically source the .vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
" 如果是 Windows 则用
" autocmd! bufwritepost _vimrc source %
" 如果是 neovim 只要把 .vimrc 改成 init.vim 就可以了

"---------------------Visual---------------------------------"
" set t_Co=256 " 记着注释或者删除这一行 我们用 24 bit 真彩色，不用256
" " Enable true color 启用终端24位色
if exists('+termguicolors')
  set termguicolors
endif
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" https://github.com/microsoft/terminal/issues/832
" if (&term =~ '^xterm')
"       set t_ut= | set ttyscroll=1
"   endif
set cursorline							"显示当前行
set relativenumber   "显示相对行号
set number								"Let's activate line numbers.
" 按 F2 快速打开(或关闭)显示行号
"nnoremap <F2> :set nu! nu?<CR>
"----------------------ab----------------------------------------"
ab mymail junyixu0@gmail.com
"---------------------Mappings------------------------"
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nnoremap <leader>ex Q
noremap <silent>Q :confirm qall<cr>
nnoremap Z ZZ
nnoremap S :w<cr>
"忘记 sudo vim 时
nmap <M-s> :w !sudo tee % > /dev/null<CR>
nnoremap cd :tcd %:h<cr>

nnoremap s <C-w>

" nnoremap <silent><tab> <nop>
	
" 使用 ctag 查找
"nmap <Leader>f :tag<space>

"map gf :e <cfile><CR>

"自动缩进整篇
"nnoremap =ae mzgg=G`z
" 复制整篇 cope all the passge
nmap yaa mzggVG"+y`z

" 打开标签列表
" noremap  <C-]> g<C-]>

" 复制一行
nmap Y y$

"在一行有居多字的时候可以跳转
"nnoremap gj j
"nnoremap gk k
"nnoremap k gk
"nnoremap j gj

"System Clipboard
"vnoremap <C-c> "+y
"map tp "+P

" For copying to both the Clipboard and primary selection
vnoremap <C-c> "*y :let @+=@*<CR>

" 插入模式时使用 emacs 键位
"inoremap <C-K> <ESC>lC
" 插入模式中的 movement
"inoremap <C-j> <Down> 和 Ultisnip 冲突
"inoremap <C-l> <Right>
"inoremap <C-f> <Right>
"inoremap <C-b> <Left>

inoremap <C-e> <ESC>A
"退出 补全
inoremap <C-c> <C-e>

" Paren
"inoremap {<CR> {<CR>}<ESC>O
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap ( ()<ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

" 翻页
"nnoremap <M-f> <C-f>
"nnoremap <M-b> <C-b>
nnoremap <space> <c-f>

" choose buffer
" map <leader>1 :w<CR>:b1<CR>
" map <leader>2 :w<CR>:b2<CR>
" map <leader>3 :w<CR>:b3<CR>
" map <leader>4 :w<CR>:b4<CR>
" map <leader>5 :w<CR>:b5<CR>
" map <leader>6 :w<CR>:b6<CR>
" map <leader>7 :w<CR>:b7<CR>
" map <leader>8 :w<CR>:b8<CR>
" map <leader>9 :w<CR>:b9<CR>
"关于切换 buffer 的快捷键
map H :bp<cr>
map L :bn<cr>

nnoremap <backspace> :b1<cr>
" choose tab but it may not work in terminal 后来装了依云的插件就好了
" ~/.vim/plugin/
nnoremap <M-h> gT
nnoremap <M-l> gt
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
" 在插入模式
map <M-1> <C-O>1gt
map <M-2> <C-O>2gt
map <M-3> <C-O>3gt
map <M-4> <C-O>4gt
map <M-5> <C-O>5gt
map <M-6> <C-O>6gt
map <M-7> <C-O>7gt
map <M-8> <C-O>8gt
map <M-9> <C-O>9gt

" 正向遍历同名标签
nmap <C-n> :tnext<CR>
" 反向遍历同名标签
nmap <C-p> :tprevious<CR>

" VIM的has()属于系统级查询，效率极低，拖慢速度。尽可能减少使用。
if has('Unix')
    if has('nvim')
        so ~/.local/share/nvim/unix.vim
        " 插件
        so ~/.local/share/nvim/unix_plugs.vim
    else
        so ~/.vim/unix.vim
        " 插件
        so ~/.vim/unix_plugs.vim
    endif
else
	so ~/.vim/windows.vim
    " 插件
    so $HOME\.vim\autoload\plug.vim
    so $HOME/.vim/windows_plugs.vim
endif


" if has('win32') || has('win64') ||has('win95') ||has('win16')
" 	so ~/.vim/windows.vim
"     " 插件
"     so $HOME\.vim\autoload\plug.vim
"     so $HOME/.vim/windows_plugs.vim
" endif
