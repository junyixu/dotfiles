let $GTAGSLABEL = 'native-pygments'
" 在 Linux 下，不配置 let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'也可以正常工作，好像默认会读这个文件。
" let $GTAGSCONF = $HOME.'/.globalrc'
" 下面还有个 nvim light
set background=dark

"=========== vim-plug ============={{{
if g:isNVIM
	" nvim 的 py 默认是 py2，把它改成 py3
	let g:python_host_prog  = '/usr/bin/python'
    call plug#begin('~/.local/share/nvim/plugged')
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    "{{{
	  if exists('g:started_by_firenvim')
		  set laststatus=0
		  set background=light
		  nnoremap <leader>i :set lines=20<cr>i
	  else
		Plug 'voldikss/vim-mma'
		set background=dark
		  Plug 'vim-airline/vim-airline', {'on': []}
		  Plug 'vim-airline/vim-airline-themes'
		  " {{{  airline
		  " let g:airline_theme='deus'
		  " let g:airline_theme='quantum'
		  " let g:airline_theme='distinguished'
		  " let g:airline_theme='onedark'
		  " let g:airline_theme='base16'
		  " let g:airline_theme='base16_classic'
		  " let g:airline_theme='base16_nord'
		  let g:airline#extensions#tabline#enabled = 1
		  let g:airline_powerline_fonts = 1
		  let g:airline#extensions#vimtex#enabled = 1
		  function LazyLoadAirline(timer) abort
			  call plug#load('vim-airline')
			  call plug#load('vim-devicons')
			  execute 'AirlineInit'
			  " execute 'AirlineToggle'
		  endfunction
		  " https://github.com/vim-airline/vim-airline/issues/2047
		  " autocmd VimEnter * call timer_start(50, 'LazyLoadAirline')
		  autocmd VimEnter * ++once call timer_start(50, 'LazyLoadAirline')
		  "}}}
	  endif
    "}}}
else
    call plug#begin('~/.vim/plugged')

if !g:isPlain && !exists('g:started_by_firenvim')
	Plug 'vim-airline/vim-airline', {'on': []}
	Plug 'vim-airline/vim-airline-themes'
	" {{{  airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	function LazyLoadAirline(timer) abort
	  call plug#load('vim-airline')
	  call plug#load('vim-devicons')
	  execute 'AirlineInit'
	  " execute 'AirlineToggle'
	endfunction
	" https://github.com/vim-airline/vim-airline/issues/2047
	" autocmd VimEnter * call timer_start(50, 'LazyLoadAirline')
	autocmd VimEnter * ++once call timer_start(50, 'LazyLoadAirline')
	"}}}
endif

endif

if !g:isPlain && !exists('g:started_by_firenvim')
	Plug 'voldikss/vim-translator'
	"{{{ translator
	" let g:translator_target_lang='en'
	" let g:translator_source_lang='zh'
	" let g:translator_default_engines=['google']
	" nmap <silent> <localLeader>t <Plug>Translate
	vmap <silent> <localLeader>t <Plug>TranslateV
	" Display translation in a window
	" nmap <silent> <localLeader>w <Plug>TranslateW
	vmap <silent> <localLeader>w <Plug>TranslateWV
	" Replace the text with translation
	" nmap <silent> <localLeader>r <Plug>TranslateR
	vmap <silent> <localLeader>r <Plug>TranslateRV
	" Translate the text in clipboard
	nmap <silent> <localLeader>x <Plug>TranslateX
	"}}}

	if version < 800
		echom '您的 vim 版本低于 8.0，你需要通过升级才能正常使用 w0rp/ale 等插件'
	else
		Plug 'dense-analysis/ale', { 'for': ['python', 'sage.python', 'cmake', 'matlab', 'tex', 'go', 'markdown', 'vimwiki', 'text', 'json'] }
	endif

" 下划线
" Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-cursorword', { 'for': ['c', 'cpp', 'java', 'python', 'julia', 'matlab', 'cuda'] }
" ssh 远程复制粘贴
endif

if $SSH_CONNECTION != ''
	Plug 'fcpg/vim-osc52'
		vmap <C-c> y:Oscyank<cr>
		xmap <F7> y:Oscyank<cr>
endif

" 寄存器
Plug 'junegunn/vim-peekaboo'
	let g:peekaboo_delay=500

" Plug 'tyru/open-browser.vim'

if version < 800
	echom '您的 vim 版本低于 8.2，你需要通过升级才能正常使用 skywind3000/quickui 等插件'
else
	Plug 'skywind3000/vim-quickui'
endif

" Plug 'tpope/vim-unimpaired'
" impaired 受损的

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if !g:isPlain && !exists('g:started_by_firenvim')
"===========  git ============={{{

" gf <c-w>f <c-w>gf :find :sfind :tabfind ]i
Plug 'tpope/vim-apathy'

Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
    "{{{
    let g:git_messenger_no_default_mappings = 0
    " let g:git_messenger_always_into_popup = 1
    noremap <leader>gm :GitMessenger<CR>
    "}}}

" 侧栏显示 git 标识
Plug 'airblade/vim-gitgutter'
    " let g:gitgutter_max_signs=700

" 确定插件仓库中的分支或者 tag
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"=========== end git =============}}}
Plug 'tpope/vim-fugitive'
Plug 'zackhsi/fzf-tags'
nmap <C-]> <Plug>(fzf_tags)
" noreabbrev <expr> ts getcmdtype() == ":" && getcmdline() == 'ts' ? 'FZFTselect' : 'ts'

Plug 'dyng/ctrlsf.vim'
""{{{ ctrlsf
highlight link ctrlsfFilename Underlined
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_auto_focus = {'at': 'start'}
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_debug_mode = 0
let g:ctrlsf_follow_symlinks = 1
let g:ctrlsf_mapping = {
            \ 'open': ['<CR>', 'o'],
            \ 'openb': 'O',
            \ 'split': '<C-x>',
            \ 'vsplit': '<C-v>',
            \ 'tab': 't',
            \ 'tabb': 'T',
            \ 'popen': 'p',
            \ 'popenf': 'P',
            \ 'quit': 'sq',
            \ 'next': '<C-j>',
            \ 'prev': '<C-k>',
            \ 'pquit': 'sq',
            \ 'loclist': '',
            \ 'chgmode': '<M-m>',
            \ 'stop': '<C-c>',
            \ }
let g:ctrlsf_extra_root_markers = ['.root', '.project']
nmap     <leader>/f <Plug>CtrlSFPrompt
vmap     <leader>/f <Plug>CtrlSFVwordPath
nmap     <leader>/n <Plug>CtrlSFCwordPath
nmap     <leader>/p <Plug>CtrlSFPwordPath
nnoremap <leader>/o :CtrlSFOpen<CR>
nnoremap <leader>/v :CtrlSFToggle<CR>
nnoremap <leader>/<space> :CtrlSF<space>
nnoremap <leader>/r :CtrlSF<Space>-R<space>
nnoremap <leader>// :CtrlSF
let g:ctrlsf_confirm_save=0
nnoremap <silent> <leader>/v <Esc>:CtrlSFToggle<CR>
nmap <leader>* <Plug>CtrlSFCwordExec
xmap <leader>* <Plug>CtrlSFVwordExec
vmap <leader>* <Plug>CtrlSFVwordExec

" 没有-regex 选项时候，只有空格用加 `\` 括号不用加, CtrlSF 真奇怪
nnoremap <localleader>todo :CtrlSF TODO<CR>

" cabbrev rg CtrlSF
" cabbrev rgt CtrlSF -T
" cabbrev rgr CtrlSF -R
""}}}
Plug 'majutsushi/tagbar'
	nmap <leader>tb :TagbarToggle<CR>
endif

Plug 'jpalardy/vim-slime', {'on': ['<Plug>SlimeRegionSend',
            \ '<Plug>SlimeParagraphSend', '<Plug>SlimeConfig']}
" {{{ slime 发送文本
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1
let g:slime_target = 'tmux'
" let g:slime_target = 'vimterminal'
" let g:slime_default_config = {
"             \ 'socket_name': get(split($TMUX, ','), 0),
"             \ 'target_pane': ':.'
"             \ }
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
autocmd filetype python,matlab,julia,sage.python xmap <silent><buffer> <CR> <Plug>SlimeRegionSend
" autocmd filetype python,matlab,julia nmap <silent><buffer> <CR> <Plug>SlimeParagraphSend
" autocmd filetype python,matlab,julia nmap <silent><buffer> <space><space> :exec "normal \<Plug>SlimeParagraphSend"<cr>}j
autocmd filetype python,matlab,julia,sage.python nmap <silent><buffer> <space><space> <Plug>SlimeParagraphSend

autocmd filetype python,matlab,julia,sage.python nmap <silent><buffer> <localleader>C <Plug>SlimeConfig
" autocmd filetype matlab,julia nmap <silent> <localleader>r :exec "normal \<Plug>SlimeSendCell"<cr>zj
autocmd filetype matlab,julia,sage.python nmap <silent> <localleader>r :exec "normal \<Plug>SlimeSendCell"<cr>
" autocmd filetype matlab,julia,sage.python nnoremap <silent> <C-CR> :exec "normal \<Plug>SlimeSendCell"<cr>

autocmd filetype python,matlab,julia,sage.python nmap <M-CR> <Plug>SlimeSendCell
" autocmd filetype python,matlab,julia,sage.python nnoremap <C-CR> <Plug>SlimeSendCell
" nnoremap <s-cr> :w

autocmd filetype python nmap <localleader>r <Plug>SlimeSendCell
" autocmd filetype python,matlab nmap <CR> <Plug>SlimeMotionSend
" autocmd filetype python,matlab,julia nmap <localleader><localleader> <Plug>SlimeLineSend
autocmd filetype python,matlab,julia,sage.python nmap <silent><buffer> <CR> :exec "normal \<Plug>SlimeLineSend"<cr>j
" }}}
" TODO
"
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

Plug 'easymotion/vim-easymotion'
" ================================= easymotion =============================={{{
let g:EasyMotion_smartcase = 1 " turn on case insensitive feature
" let g:EasyMotion_do_mapping = 0 " disable default malpings
let g:EasyMotion_use_smartsign_us = 1 " 1 will match 1 and !
" let g:EasyMotion_use_upper = 1
" let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj;23456789'
noremap q <Nop>
let EasyMotion_leader_key = 'q'
" let EasyMotion_leader_key = '<Space>'
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1

" nmap t <Plug>(easymotion-bd-f2)
" nmap <leader>g <Plug>(easymotion-bd-w)
" nmap <leader><leader>f <Plug>(easymotion-s2)
" nmap <leader><leader>w <Plug>(easymotion-bd-W)
" nmap <leader><leader>e <Plug>(easymotion-bd-E)
" map t <Plug>(easymotion-bd-t)
" map f <Plug>(easymotion-bd-f)
" map <leader>f <Plug>(easymotion-bd-f)
nmap qq <Plug>(easymotion-s2)
" omap t <Plug>(easymotion-tl)
" omap f <Plug>(easymotion-fl)
" " Gif config
map  q/ <Plug>(easymotion-sn)
omap q/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  qn <Plug>(easymotion-next)
map  qN <Plug>(easymotion-prev)
map  qp <Plug>(easymotion-prev)

" jk motions: line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" ================================= easymotion ==============================}}}
"
" must after easymotion plugin
Plug 'junyixu/vim-easymotion-chs', {'for': ['markdown', 'vimwiki', 'tex', 'text']}

" archlinux cmake 包自带 cmake syntax and indent
" Plug 'pboettch/vim-cmake-syntax', {'for': 'cmake'}

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    " {{{
    " To register the descriptions when using the on-demand load feature,
    " use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
    set timeoutlen=500
    nnoremap <silent> <leader> :WhichKey ','<CR>
    nnoremap <silent> <localleader> :WhichKey '<Space>'<CR>
    " nnoremap <silent> <localleader> :WhichKey '_'<CR>
    " nnoremap <silent> g :WhichKey 'g'<CR>
    "}}}

Plug 'tpope/vim-repeat'

if !g:isPlain && !exists('g:started_by_firenvim')
"========================= format ==============================={{{

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType fortran AutoFormatBuffer fprettify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
"========================= format ================================}}}
endif

" ===========  词典 ============={{{
" doc: apc
" Plug 'skywind3000/vim-auto-popmenu' 
	" enable this plugin for filetypes, '*' for all files.
	let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'vimwiki':1}
    let g:apc_enable_tab=0
	let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text', 'tex':'tex, latex, text'}
	" source for dictionary, current or other loaded buffers, see ':help cpt'
	" complete
	" set cpt=.,k,w,b,t
	" set cpt=.,k,w,b
	" set complete+=k

	" don't select the first item.
	" set completeopt=menu,noselect

	" suppress annoy messages.
	" set shortmess+=c
    " let g:ycm_filetype_blacklist = {'text':1, 'markdown':1, 'php':1}
    " let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
Plug 'skywind3000/vim-dict'
"===========  词典 =============}}}

if !g:isPlain && !exists('g:started_by_firenvim')
" ===========  tmux ============={{{
" Plug 'tmux-plugins/vim-tmux'
    Plug 'tmux-plugins/vim-tmux-focus-events'

    Plug 'roxma/vim-tmux-clipboard'

	" ^X^U 在 vim 中补全 tmux 里的内容
    Plug 'wellle/tmux-complete.vim'
        " let g:tmuxcomplete#trigger = 'omnifunc'
	
	" 和 vim-floaterm 配合使用
	" Plug 'benmills/vimux'
" ===========  tmux =============}}}
" Plug 'voldikss/vim-floaterm'

Plug 'mhinz/vim-startify'

" ============ vimspector 调试 ============={{{
Plug 'puremourning/vimspector'
let g:vimspector_install_gadgets = [ 'debugpy', 'CodeLLDB'  ]
let g:vimspector_enable_mappings = 'HUMAN'

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

" ============ end 调试 =============}}}
endif

" toml 语法高亮
Plug 'cespare/vim-toml', {'for': 'toml'}

Plug 'tpope/vim-abolish'

"===================== 异步任务 ================={{{
" Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop'] }
Plug 'skywind3000/asyncrun.vim'
    "{{{ asyncrun
    " 自动打开 quickfix window ，高度为 6
    let g:asyncrun_open = 6

    " 任务结束时候是否响铃提醒
    let g:asyncrun_bell = 0

    let g:asyncrun_rootmarks = ['.svn', '.git', '.root','.project', '_darcs', 'build.xml', '.tasks']
	" let g:asynctasks_term_pos = 'tab' " vim, bottom

    " nnoremap <silent> <F4> :AsyncRun -cwd=<root>/build cmake .. <cr>

    " " 设置 F10 打开 / 关闭 Quickfix 窗口
    " nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
    "}}}

if !g:isPlain && !exists('g:started_by_firenvim')
	Plug 'skywind3000/asyncrun.extra'

	" lazy load
	" Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask', 'AsyncTaskMacro', 'AsyncTaskList', 'AsyncTaskEdit'] }
	Plug 'skywind3000/asynctasks.vim'
	" asynctask {{{
	 let g:asynctasks_template = '~/.vim/template.ini'
	noremap <silent><leader>r :AsyncTask file-run<cr>
	" noremap <silent><f5> :AsyncTask file-run<cr>
	" noremap <silent><leader>r :AsyncTask file-run<cr>
	" noremap <silent><f9> :AsyncTask file-build<cr>
	" noremap <silent><S-f5> :AsyncTask project-run<cr>
	" noremap <silent><S-f9> :AsyncTask project-run<cr>
	" noremap <silent><S-f9> :AsyncTask project-build<cr>
    " nnoremap <silent> <S-F6> :AsyncTask project-test<cr>
    " nnoremap <silent> <C-f10> :AsyncTaskList<cr>
    " nnoremap <silent> <F7> :AsyncRun -cwd=<root>/build make <cr>
    " nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
	" }}}
endif
"===================== end 异步任务 =================}}}

" {{{ ========================== ycm or coc 补全 ============================
" if !g:isPlain && !exists('g:started_by_firenvim') && hostname()!='Surface'
if !g:isPlain && !exists('g:started_by_firenvim')
	if g:isNVIM
		 Plug 'neoclide/coc.nvim'
	else
		 Plug 'ycm-core/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer'}
		" Plug 'ycm-core/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer'}
		Plug 'ycm-core/lsp-examples'
		Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' , 'on': 'YcmGenerateConfig'}
	endif
endif
"  ========================== end 补全 ============================ }}}

" 启动时间
" Plug 'dstein64/vim-startuptime'

if !g:isPlain && !exists('g:started_by_firenvim')
" ----------------- ctags and gtags ------------------{{{
Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
" Plug 'skywind3000/vim-preview', { 'for': ['c', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab', 'fortran', 'tex', 'mma']}
    "{{{
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    noremap <m-u> :PreviewScroll -1<cr>
    noremap <m-d> :PreviewScroll +1<cr>
    " inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
    " inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
    noremap <m-b> :PreviewScroll -2<cr>
    noremap <m-f> :PreviewScroll +2<cr>
    " inoremap <m-b> <c-\><c-o>:PreviewScroll -2<cr>
    " inoremap <m-f> <c-\><c-o>:PreviewScroll +2<cr>
    "}}}
" Plug 'liuchengxu/vista.vim', { 'for': ['c','markdown', 'vimwiki', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab']}
" Plug 'liuchengxu/vista.vim', {'on': 'Vista!!'}
Plug 'liuchengxu/vista.vim'
    "{{{
    nnoremap <leader>tt :Vista!!<CR>
     let g:vista_no_mappings=1
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> q    :close<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> <CR> :<c-u>call vista#cursor#FoldOrJump()<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> p    :<c-u>call vista#cursor#TogglePreview()<CR>
     " }}}
" ----------------- tags ------------------}}}
endif


" export isWSL='yes' in ~/.zprofile
if SUDO!=1 && g:isPlain!=1 && $isWSL!='yes'
" if SUDO!=1
	" fcitx.vim 共需要 30 毫秒左右
	Plug 'lilydjwg/fcitx.vim'
endif

" au FileType tex,vimwiki,markdown nmap <silent> w <Plug>(coc-ci-w)
" au FileType tex,vimwiki,markdown nmap <silent> b <Plug>(coc-ci-b)

" Plug 'xolox/vim-session'
	" let g:session_autosave=0
	" let g:session_autoload=0
" Plug 'xolox/vim-misc'

" -----------------美观 ------------------{{{
"  latex 语法高亮 http://padamson.github.io/chapel/seamless/2016/02/27/highlight-chapel-syntax-in-latex-in-vim.html
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SyntaxRange'

" 缩进插件
" Plug 'Yggdroot/indentLine', {'for': ['python', 'fortran']}
Plug 'Yggdroot/indentLine', {'for': ['python']}
    "{{{
	let g:indentLine_char = '¦'
    " 和 tex 共用的时候 conceal 颜色会被覆盖
    let g:indentLine_setColors=0
    " let g:indentLine_setConceal=1
    let g:indentLine_concealcursor=1
	" let g:indentLine_fileTypeExclude = ['text', 'sh', 'txt', 'tex', 'vim']
	" let g:indentLine_fileType = ['py', 'f', 'f90']
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    "}}}
	Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
" Plug 'lfv89/vim-interestingwords' " 使用 <localleard>k 和 <localleard>K 选择和取消  该插件在 "~/.vim/plugin/ 下面
Plug 'kshenoy/vim-signature'

" Plug 'terryma/vim-smooth-scroll'
    " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    " noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    " noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" -----------------end 美观 ------------------}}}
" 打开 vim 到上次编辑的位置
Plug 'farmergreg/vim-lastplace'  

" 注释插件
Plug 'tpope/vim-commentary' 
    "{{{ comment plug
    " autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType nginx setlocal commentstring=#\ %s
    autocmd FileType systemd setlocal commentstring=#\ %s
    autocmd FileType dosini setlocal commentstring=#\ %s
    autocmd FileType crontab setlocal commentstring=#\ %s
    autocmd FileType desktop setlocal commentstring=#\ %s
    autocmd FileType autohotkey setlocal commentstring=;\ %s
    "}}}

if !g:isPlain && !exists('g:started_by_firenvim')
	Plug 'machakann/vim-sandwich'
	" 匹配增强
	Plug 'andymass/vim-matchup'
else
	Plug 'tpope/vim-surround'
	Plug 'chrisbra/matchit'
endif

  " 自动补全括号
Plug 'Raimondi/delimitMate'
    "{{{
	" For Python docstring.
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
	au FileType python let b:delimitMate_nesting_quotes = ['"']
	" imap <S-Tab> <Plug>delimitMateS-Tab
    "}}}

Plug 'luochen1990/rainbow', {'on': 'RainbowToggle'}

"======================= 🌲️ 项目树 ========================={{{
" 抽屉式项目树
Plug 'tpope/vim-vinegar'
    " let g:NERDTreeHijackNetrw = 1 " add this line if you use NERDTree
	
Plug 'francoiscabrol/ranger.vim'

if !g:isPlain && !exists('g:started_by_firenvim')
    let g:ranger_map_keys = 0
    map <M-e> :RangerWorkingDirectoryNewTab<CR>
    " let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
endif

" Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    nnoremap <leader>tu :UndotreeToggle<cr>
"======================= 🌲️ 项目树 =========================}}}

"================== colorscheme ======================{{{
Plug 'morhetz/gruvbox'

Plug 'joshdick/onedark.vim'
"================== colorscheme ======================}}}

" Plug 'jupyter-vim/jupyter-vim', {'for': ['python', 'julia']}
    " let g:jupyter_mapkeys = 0
Plug 'mattn/calendar-vim'
	let g:calendar_diary=$HOME.'/Notes/diary/' 
	let g:calendar_monday = 1
	let g:calendar_wruler = '日 一 二 三 四 五 六'
	let g:calendar_datetime = 'title'
	let g:calendar_no_mappings=0
	  let g:calendar_keys = { 'goto_next_month': '<C-Right>', 'goto_prev_month': '<C-Left>', 'close': '<M-q>', 'goto_next_year': '<C-Down>', 'goto_prev_year': '<C-Up>', 'goto_today': 'td'}
Plug 'vimwiki/vimwiki'
"=============== Markdown ==============={{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['vimwiki', 'markdown', 'vim-plug']}
let g:mkdp_filetypes = ['markdown', 'vimwiki']
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
	let g:vim_markdown_folding_disabled = 1
	" let g:tex_conceal = ""
	let g:vim_markdown_math = 1
	" 代码块不 conceal
	let g:vim_markdown_conceal_code_blocks = 0
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
	let g:vmt_auto_update_on_save = 0
Plug 'ferrine/md-img-paste.vim', {'for': 'markdown'}
	let g:mdip_imgdir = 'resources'
	let g:mdip_imgname = 'screenshot'
	autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
	autocmd FileType vimwiki nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
"=============== End Markdown ===============}}}


" ============== 补全 ==============={{{
set noshowmode
if g:isNVIM && version < 802
    Plug 'Shougo/echodoc.vim'
    " To use echodoc, you must increase 'cmdheight' value.
        let g:echodoc#type="floating"
        let g:echodoc_enable_at_startup = 1
endif

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
set rtp+=./snippets
"============== =====================}}}

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	" let g:pymode_rope_completion = 0
	" let g:pymode_rope_complete_on_dot = 0
Plug 'vim-python/python-syntax', { 'for': 'python'}
"{{{  python-syntax
" let g:python_highlight_all=0
let g:python_highlight_func_calls=1
let g:python_highlight_builtins=1
let g:python_highlight_builtin_objs=1
let g:python_highlight_builtin_types=1
let g:python_highlight_builtin_funcs=1
let g:python_highlight_builtin_funcs_kwarg=1
let g:python_highlight_exceptions=1
"}}}
" Plug 'tmhedberg/SimpylFold', { 'for': 'python'}

Plug 'aperezdc/vim-template'

"=============== LaTeX ==============={{{
Plug 'lervag/vimtex'
	set conceallevel=2
	let g:tex_conceal="abdgm"
"=============== end LaTeX ===============}}}

" cycle: true <-> false etc
Plug 'bootleq/vim-cycle'
"=================== vim-cycle ================{{{
let g:cycle_no_mappings = 1
nmap <silent> <c-a> <Plug>CycleNext
vmap <silent> <c-a> <Plug>CycleNext
nmap <silent> <c-x> <Plug>CyclePrev
vmap <silent> <c-x> <Plug>CyclePrev
noremap <silent> <Plug>CycleFallbackNext <C-A>
noremap <silent> <Plug>CycleFallbackPrev <C-X>

	"----------------------------------------------------------------------
	" https://github.com/bootleq/vim-cycle
	"----------------------------------------------------------------------
	let g:cycle_default_groups = [
				\   [['true', 'false']],
				\   [['True', 'False']],
				\   [['dark', 'light']],
				\   [['yes', 'no']],
				\   [['error', 'warning', 'info', 'debug']],
				\   [['on', 'off']],
				\   [['+', '-']],
				\   [['>', '<']],
				\   [['==', '!=']],
				\   [['and', 'or']],
				\   [["only", "except"]],
				\   [["new", "delete"]],
				\   [['是', '否']],
				\   [['{:}', '[:]', '(:)'], 'sub_pairs'],
				\   [['（:）', '「:」', '『:』'], 'sub_pairs'],
				\   [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
				\     'Friday', 'Saturday'], 'hard_case', {'name': 'Days'}],
				\   [['January', 'February', 'March', 'April', 'May', 'June', 
				\     'July', 'August', 'September', 'October', 'November', 
				\     'December'], 'hard_case', {'name': 'Months'}],
				\ ]

"=================== vim-cycle ================}}}

"=========== textobj-user 全家桶 ============={{{
" Plug 'jeetsukumaran/vim-pythonsense'

Plug 'kana/vim-textobj-user'
" 以下都依赖 Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-fold'
if !g:isPlain && !exists('g:started_by_firenvim')
Plug 'kana/vim-textobj-lastpat'
endif
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function', { 'for': ['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'julian/vim-textobj-variable-segment'
Plug 'coachshea/vim-textobj-markdown', {'for': 'markdown'}
Plug 'bps/vim-textobj-python', {'for':'python'}
"=========== end textobj-user 全家桶 =============}}}

if !g:isPlain && !exists('g:started_by_firenvim')
	Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
	Plug 'junegunn/vim-easy-align'
		"{{{
		" Start interactive EasyAlign in visual mode (e.g. vipga)
		xmap ga <Plug>(EasyAlign)
		" Start interactive EasyAlign for a motion/text object (e.g. gaip)
		nmap ga <Plug>(EasyAlign)
		"}}}
		
	" vim 中文文档
	Plug 'yianwillis/vimcdoc'
	
	" matlab
	Plug 'andymass/vim-matlab', {'for': 'matlab'}
	" Plug 'yinflying/matlab-screen', {'for': 'matlab'}

	Plug 'ryanoasis/vim-devicons'
	Plug 'petRUShka/vim-sage', {'for': 'sage'}
endif

call plug#end()

"=========== end vim-plug =============}}}

"---------------------Plugs config -------------------------------------"

if !g:isPlain && !exists('g:started_by_firenvim')
"{{{ sandwich 改 surround 键位
runtime macros/sandwich/keymap/surround.vim
" Text objects to select a text surrounded by brackets or user-specified characters.

xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
" Text objects to select the nearest surrounded text automatically.
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)
vmap s <Plug>(textobj-sandwich-auto-i)
vmap s <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user
xmap iq <Plug>(textobj-sandwich-literal-query-i)
xmap aq <Plug>(textobj-sandwich-literal-query-a)
omap iq <Plug>(textobj-sandwich-literal-query-i)
omap aq <Plug>(textobj-sandwich-literal-query-a)

" i for Instant surroundings.
" f for Function
" t for Tag to edit HTML
let g:sandwich#magicchar#f#patterns = [
        \   {
        \     'header' : '\<\%(\h\k*\.\)*\h\k*',
        \     'bra'    : '(',
        \     'ket'    : ')',
        \     'footer' : '',
        \   },
        \ ]
         
" 和 vim surround 一样的括号
	let g:sandwich#recipes += [
	\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
	\
	\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
	\
	\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
	\
	\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['{']},
	\
	\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['[']},
	\
	\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['(']},
	\ ]
        let g:sandwich#recipes += [
        \   {'buns': ['*',     '*'],           'nesting': 0, 'input': [ '*' ],    'filetype': ['markdown', 'vimwiki'] },
        \   {'buns': ['**',     '**'],           'nesting': 0, 'input': [ 'b' ],    'filetype': ['markdown', 'vimwiki'] },
        \   {'buns': ['“',     '”'],           'nesting': 0, 'input': [ 'U"' ],    'filetype': ['tex', 'plaintex', 'markdown', 'vimwiki', 'text'] },
        \   {'buns': ['\left(',           '\right)'],           'nesting': 1, 'input': [ 'm)' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\left[',           '\right]'],           'nesting': 1, 'input': [ 'm]' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\left|',           '\right|'],           'nesting': 1, 'input': [ 'm|' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\left\{',          '\right\}'],          'nesting': 1, 'input': [ 'm}' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\left\langle ',    '\right\rangle '],    'nesting': 1, 'input': [ 'm>' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\mqty(',        ')'],        'nesting': 1, 'input': [ 'M(' , 'M)' ],   'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\mqty[',        ']'],        'nesting': 1, 'input': [ 'M[' ,'M]' ],    'filetype': ['tex',       'plaintex'] },
        \   {'buns': ['\mqty|',        '|'],        'nesting': 1, 'input': ['M|' ],           'filetype': ['tex',       'plaintex'] },
		\   {'buns': ['\mqty\{',       '\}'],       'nesting': 1, 'input': [ 'M{' ,'M}' ],    'filetype': ['tex',       'plaintex'] },
        \ ]
"}}}
"
"
" {{{ 格式化
"" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
" 不知道这句怎么使用
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
" }}}
endif
"=================== delimitMate ================{{{
" 用 Tab 键进行 delimitMate 的光标跳转（也就是说，输入左括号后使用 Tab 键就可跳转到 delimitMate 生成的右括号的右边，而无需 <S-TAB>），且不破坏 UltiSnips 的 Tab 键展开，同时禁用 delimitMate 自带的 <S-TAB>
" https://sololand.moe/2017/01/03/youcompleteme-ultisnips-c-cpp-function-parameters/
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "<Tab>"
" autocmd VimEnter * inoremap <S-TAB> <S-TAB>
" if g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger
" 	" 跳到第二个
"    imap <Tab> "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" elseif delimitMate#ShouldJump() 
" 	imap <Tab> delimitMate#JumpAny() 
" else
" 	inoremap <Tab> <Tab>
"}}}
"====================== 🌈️彩虹括号 =========================={{{
let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

"====================== end 🌈️彩虹括号 ==========================}}}
" =========================  colorscheme {{{
"colorscheme molokai-mod
" let g:molokai_transparent=1

" konsole 不支持波浪线，spell check 显示不出来
if !has('gui_running')
" https://github.com/morhetz/gruvbox/issues/175#issuecomment-390428621
let g:gruvbox_guisp_fallback = "bg"
" let g:gruvbox_undercurl = 0
endif

let g:airline_theme='gruvbox'
" let g:airline_theme='base16_oceanicnext'
try
    " colorscheme one
	" colorscheme onedark
	colorscheme gruvbox
catch
endtry
" colorscheme hybrid
" colorscheme base16-gruvbox-dark-pale
" colorscheme base16-nord
" colorscheme base16-woodland
" colorscheme base16-oceanicnext
" colorscheme ayu
" colorscheme quantum
" let g:gruvbox_contrast_dark='hard'
"}}}
if !g:isPlain && !exists('g:started_by_firenvim')
"====================== ctags =========================={{{
" https://www.zhihu.com/question/47691414/answer/373700711
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件 / 目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_project_root = ['.root', '.project', '.git', '.tasks']
" note:
" 不需要这个插件的项目 touch .notags
" 如果我需要这个插件直接在项目顶层，touch .root



let g:gitgutter_max_signs=1200

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 0

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = ['ctags']
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
" TODO 不起作用，我想在 写 tex 的时候不用 gtags
" if executable('gtags-cscope') && executable('gtags') && &filetype!='tex'

" if executable('gtags-cscope') && executable('gtags')
" 	let g:gutentags_modules += ['gtags_cscope']
" endif

" 配置 ctags 的参数，
" extra=+q 表示强制要求ctags对同一个语法元素 再记一行(如果某个语法元素是类的一个成员，ctags默认会给其记录一行)，这样可以保证在Vim中多个同名函数可以通过路径不同来区分
" 老的 Exuberant-ctags 不能有 --extra=+q，注意

" notes:
" l        局部变量(local variables)，默认不提取
" S 表示如果是函数，则生成的tag文件要标识函数的原型(Signature)

" let g:gutentags_ctags_extra_args = ['--fields=+nliazS', '--extras=+q']
" let g:gutentags_ctags_extra_args = ['--fields=+niaz', '--extras=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" ctags识别很多元素，但未必全都记录，例如“函数声明”这一语法元素默认是不记录的，可以控制ctags记录的语法元素的种类。如下命令要求ctags记录c++文件中的函数声明和各种外部和前向声明
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_exclude_project_root = [ '/home/junyi/.local/share/nvim', '/home/junyi/.vim', '/usr/local']

" 禁用 gutentags 自动加载 gtags 数据库的行为, 由于我一个 vim
" 只打开一个工程，用 tmux 和 vim 结合的方式，所以这里不需要了.
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_exclude_filetypes=['vim', 'sh']
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
"====================== end ctags ==========================}}}
endif
"================== git ============{{{
nnoremap <leader>gsv :Gvdiffsplit<cr>
nnoremap <leader>gss :Gdiffsplit<cr>
" left 留下左边
nnoremap <leader>gh :diffget //2<cr>
" right 留下右边
nnoremap <leader>gl :diffget //3<cr>
"================== git ============}}}
if !g:isPlain && !exists('g:started_by_firenvim')
"================== youcompleteme ============{{{
"set completeopt=menu,menuone

" 错误标记
 " let g:ycm_log_level = 'debug'
" let g:ycm_error_symbol = '✗'  "set error or warning signs
" let g:ycm_error_symbol = '⨉'  "set error or warning signs
let g:ycm_error_symbol = "\ue009\ue009"  "set error or warning signs
let g:ale_sign_error = "\ue009\ue009"
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_add_preview_to_completeopt = 0
" let g:ale_sign_error = '⨉'
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
"highlight YcmErrorSign       标记颜色
" highlight YcmErrorSign ctermbg=red ctermfg=white
" highlight YcmErrorSign ctermbg=red ctermfg=yellow
" highlight YcmWarningSign ctermbg=none
" highlight ALEErrorSign ctermbg=red ctermfg=white
" highlight ALEErrorSign ctermfg=red ctermbg=white
" highlight ALEWarningSign ctermbg=none
" highlight YcmErrorSection      代码中出错字段颜色
" highlight YcmWarningSection ctermbg=none
" highlight YcmErrorLine        出错行颜色
" highlight YcmWarningLine

" warning标记
" let g:ycm_warning_symbol = '⚠'
" au filetype cuda let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_goto_buffer_command = 'vertical-split'
" if has('patch-8.0.1000')
" 	set completeopt+=noselect
" endif
let g:ycm_warning_symbol                                = '--'
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_collect_identifiers_from_tags_files           = 1 " 开启 YC基于标签引擎  The only supported tag format is the Exuberant Ctags format
let g:ycm_python_sys_path = ['/usr/lib/python3.9/site-packages/numpy']
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings                           = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
" let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf                         = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_key_list_select_completion                    = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion                  = ['<C-p>', '<Up>']
let g:ycm_cache_omnifunc                                = 0  " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax                  = 1 " 开启语法自动补全
let g:ycm_complete_in_comments                          = 0  "在注释输入中也能补全
let g:ycm_always_populate_location_list = 1
let g:ycm_python_sys_path = ['/usr/lib/python3.9/site-packages/numpy']
" let g:ycm_filetype_whitelist = {
" 			\ "c":1,
" 			\ "cpp":1,
"             \ "cuda":1,
" 			\ "objc":1,
"             \ "python":1,
"             \ "tex":1,
" 			\ "sh":1,
" 			\ "julia":1,
" 			\ "zimbu":1,
" 			\ "fortran":1,
" 			\ "matlab":1,
" 			\ "vim":1,
" 			\ }

let g:ycm_filetype_blacklist = {
			\ 'notes':        1,
			\ 'netrw':        1,
			\ 'unite':        1,
			\ 'pandoc':       1,
			\ 'infolog':      1,
			\ 'mail':         1,
			\ 'coc-explorer': 1,
			\ 'tagbar':       1,
			\ 'vista':        1,
			\ 'leaderf':      1,
			\ 'fzf':          1,
 			\ 'julia':        1,
			\ 'gitcommit':    1,
			\ 'markdown':     1,
			\ 'vimwiki':      1,
			\ 'text':         1,
			\ }

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,cuda': ['re!\w{4}'],
			\ 'python': ['re!\w{2}'],
            \ 'java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs, lua,javascript, typescript': ['re!\w{2}'],
			\ 'matlab': ['re!\w{2}'],
			\ 'julia': ['re!\w{3}'],
			\ }

" let g:vimtex_enabled = 0

" https://github.com/lervag/ vimtex/issues/168#issuecomment-108019496
" let g:tex_fast = "bMpr"

nnoremap <leader>yd<Space> :YcmDiags<Space>
nnoremap <leader>ydf :YcmDiags FixIt<CR>
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>y<space> :YcmCompleter<Space>
nnoremap <leader>ygp :YcmCompleter GetParent<CR>
nnoremap <leader>ygc :YcmGenerateConfig<CR>
nnoremap <leader>yl :YcmToggleLogs<CR>

" GetDoc
let g:ycm_auto_hover=''
nmap     <leader>H      <Plug>(YCMHover)
nnoremap <leader>K :YcmCompleter GetDoc<CR>

  augroup MyYCMCustom
    autocmd!
    autocmd FileType c,cpp let b:ycm_hover = {
      \ 'command': 'GetDoc',
      \ 'syntax': &filetype
      \ }
  augroup END


nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
" nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
" nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gf :YcmCompleter GotoInclude<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
let g:julia_cmdline = ['julia-1.0', '--startup-file=no', '--history-file=no', '-e', '
			\       using LanguageServer;
			\       using Pkg;
			\       import StaticLint;
			\       import SymbolServer;
			\       env_path = dirname(Pkg.Types.Context().env.project_file);
			\       
			\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
			\       server.runlinter = true;
			\       run(server);
\   ']


let s:lsp = $HOME.'.vim/plugged/lsp-examples'
let g:ycm_language_server = [
			\   { 'name': 'fortran',
			\     'filetypes': [ 'fortran' ],
			\     'cmdline': [ 'fortls' ],
			\   },
			\   {
			\     'name': 'bash',
			\     'cmdline': [ 'node', expand( s:lsp . '/bash/node_modules/.bin/bash-language-server' ), 'start' ],
			\     'filetypes': [ 'sh', 'bash' ],
			\  },
			\   { 'name': 'vim',
			\     'filetypes': [ 'vim' ],
			\     'cmdline': [ expand( s:lsp . '/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
			\   },
			\   { 'name': 'docker',
			\     'filetypes': [ 'dockerfile' ],
			\     'cmdline': [ expand( s:lsp . '/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
			\   },
			\   {
			\   'name': 'yaml',
			\   'filetypes': ['yaml'],
			\   'cmdline': ['node', expand( s:lsp . '/yaml/node_modules/.bin/yaml-language-server'), '--stdio' ]
			\   },
			\   {
			\   'name': 'json',
			\   'filetypes': ['json'],
			\   'cmdline': ['node', expand(s:lsp . '/json/node_modules/.bin/vscode-json-languageserver'), '--stdio']
			\   },
			\   { 
			\     'name': 'julia',
			\     'filetypes': [ 'julia' ],
			\     'project_root_files': [ 'Project.toml' ],
			\	'cmdline': g:julia_cmdline
			\  },
			\ ]

"=================== YCM | you complete me========================================}}}
"==================== w0rp/ale ============================={{{
" <https://www.zhihu.com/question/47691414/answer/373700711>
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" let g:ale_c_gcc_autoinclude_source_dir = 1

" 在 vim 自带的状态栏中整合 ale
" let g:ale_statusline_format = ['⨉ %d', '⚡ %d', '✔ OK']
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:airline#extensions#ale#enabled = 1

" let g:ale_completion_enabled=1
" let g:ale_completion_tsserver_autoimport=1

" 自定义 error 和 warning 图标
" let g:ale_sign_error = '⨉'
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
" let g:ale_sign_warning = '⚠ '
" let g:ale_sign_error = "\ue009\ue009"
"let g:ale_c_clang_options = '-I/home/junyi/Desktop/My_QuEST/QuEST/include -I/home/junyi/Desktop/My_QuEST/QuEST/src -Wall -std=c99'
"let g:ale_c_clangd_options = '-x c -DQuEST_EXPORTS -DQuEST_PREC=2 -I/home/junyi/Desktop/My_QuEST/QuEST/include -I/home/junyi/Desktop/My_QuEST/QuEST/src -Wall -std=c99'
" let g:ale_c_clangd_options = '-fopenmp -Wall -I./ -I/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include -I/home/junyi/Desktop/My_QuEST/QuEST/include -I/home/junyi/Desktop/My_QuEST/QuEST/src -std=c99'
" let g:ale_c_clang_options = '-fopenmp -Wall -I./ -I/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include -I/home/junyi/Desktop/My_QuEST/QuEST/include -I/home/junyi/Desktop/My_QuEST/QuEST/src -std=c99'
" let g:ale_c_build_dir = '~/Desktop/My_QuEST/build'

"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta

" 暂时没想到好办法使 YCM 的跳转到下一页错误 :ll 和 ale 的相容
nmap [e :ll<cr>
nmap ]e :ll<cr>
au filetype python,matlab nmap <buffer> [e <Plug>(ale_previous_wrap)
au filetype python,matlab nmap <buffer> ]e  <Plug>(ale_next_wrap)

" c/c++ 的设置
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''

"<Leader>s 触发 / 关闭语法检查
nmap <Leader>as :ALEToggleBuffer<CR>
nmap <Leader>ae :ALEEnable<CR>
nmap <Leader>ad :ALEDetail<CR>
nmap <Leader>af :ALEFix<CR>
"<Leader>d 查看错误或警告的详细信息
" nnoremap <Leader>d :ALEDetail<CR>

"打开文件时不进行检查
let g:ale_lint_on_enter = 0

" let g:ale_command_wrapper = 'nice -n5'

" let g:ale_julia_executable = '/usr/bin/julia'
" let g:ale_completion_enabled = 1

let g:ale_linters = {
            \   'asm': ['gcc'],
            \   'nasm': ['nasm'],
            \   'cmake': ['cmakeformat', 'cmakelint'],
            \   'python': ['pyflakes'],
            \   'go': ['gofmt'],
            \   'java': ['javac'],
            \   'javascript': ['eslint'],
            \   'matlab': ['mlint'],
            \   'shell': ['shell -n flag'],
            \   'yaml': ['prettier'],
            \   'markdown': ['languagetool', 'textidote'],
			\   'lua': ['luac'], 
            \   'vimwiki': ['textidote'],
            \   'tex': ['textidote'],
            \   'sh': ['language_server', 'shell', 'shellcheck'],
            \   'bash': ['language_server', 'shell', 'shellcheck'],
            \   'vue': ['eslint'],
            \   'json': ['jsonlint'],
            \ }
" let g:ale_languagetool_options='--autoDetect --mothertongue zh-CN'
" alias 好像不起作用
" let g:ale_linter_aliases = {
" 			\   'Dockerfile': 'dockerfile',
" 			\   'csh': 'sh',
" 			\   'javascriptreact': ['javascript', 'jsx'],
" 			\   'plaintex': 'tex',
" 			\	'tex': ['text', 'tex'],
" 			\	'markdown': ['markdown', 'text'],
" 			\   'ps1': 'powershell',
" 			\   'rmarkdown': 'r',
" 			\   'rmd': 'r',
" 			\   'svelte': ['svelte', 'javascript'],
" 			\   'systemverilog': 'verilog',
" 			\   'typescriptreact': ['typescript', 'tsx'],
" 			\   'verilog_systemverilog': ['verilog_systemverilog', 'verilog'],
" 			\   'vimwiki': 'markdown',
" 			\   'vue': ['vue', 'javascript'],
" 			\   'xsd': ['xsd', 'xml'],
" 			\   'xslt': ['xslt', 'xml'],
" 			\   'zsh': 'sh',
" 			\}

let g:ale_fixers = {'python': ['autopep8'], 'html': [], 'tex': ['latexindent'], '*': ['remove_trailing_lines', 'trim_whitespace']}
"==================== end =============================}}}
endif
"================== UltiSnips ============{{{
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/UltiSnips', './UltiSnips']
nnoremap <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"
" ultisnips
" remap Ultisnips for compatibility
" let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsExpandTrigger            = "<Nop>"
" let g:UltiSnipsListSnippets             = "<Nop>"
" Ulti的代码片段的文件夹
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" Ulti python version
" tab for ExpandTrigger
" https://github.com/leoatchina/leovim/blob/13fda65c4d90dc01ecf8a61725c0c0a49a1ea8d1/settings/complete_engine.vim#L250
" function! g:UltiSnips_Tab()
" 	if pumvisible()
" 		call UltiSnips#ExpandSnippetOrJump()
" 		if exists("g:ulti_expand_res") && g:ulti_expand_res > 0
" 			return "\<Right>"
" 		else
" 			if exists('v:completed_item') && empty(v:completed_item)
" 				return "\<C-n>"
" 			else
" 				return "\<C-y>"
" 			endif
" 		endif
" 	elseif delimitMate#ShouldJump()
" 		return delimitMate#JumpAny()
" 	else
" 		return "\<Tab>"
" 	endif
" endfunction
" au BufEnter * exec "inoremap <silent> <Tab> <C-R>=g:UltiSnips_Tab()<cr>" 
"=================== end ========================================}}}
"==================== mappings for vim-fswitch ================{{{
"Plug 'derekwyatt/ "替换 vim-scripts/a.vim
"- Switch to the file and load it into the current window >
	"nmap <silent> <Leader>of :FSHere<cr>
"" Switch to the file and load it into the window on the right >
	"nmap <silent> <Leader>ol :FSRight<cr>
""- Switch to the file and load it into a new window split on the right >
	"nmap <silent> <Leader>oL :FSSplitRight<cr>
"" - Switch to the file and load it into the window on the left >
	"nmap <silent> <Leader>oh :FSLeft<cr>
"" - Switch to the file and load it into a new window split on the left >
	"nmap <silent> <Leader>oH :FSSplitLeft<cr>
"" - Switch to the file and load it into the window above >
	"nmap <silent> <Leader>ok :FSAbove<cr>
"" - Switch to the file and load it into a new window split above >
	"nmap <silent> <Leader>oK :FSSplitAbove<cr>
"" - Switch to the file and load it into the window below >
	"nmap <silent> <Leader>oj :FSBelow<cr>
"" - Switch to the file and load it into a new window split below >
	"nmap <silent> <Leader>oJ :FSSplitBelow<cr>
"==================== mappings for vim-fswitch ================}}}
if !g:isPlain && !exists('g:started_by_firenvim')
"==================== nerdtree ======================{{{
" Close nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Make NERDTree easier to toggle.
nmap <Leader>te :NERDTreeToggle<cr>
" let g:NERDTreeMapOpenVSplit = '\'
" let g:NERDTreeMapOpenSplit = '-'

"nerdtree-git-plugin
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Unknown"   : "?"
"    \ }
"==================== end nerdtree======================}}}
endif

"==================== vim-templates ======================{{{
let g:templates_directory = '$HOME/.vim/templates'
let g:templates_user_variables = [['EMAIL', 'GetEmail'],]

function GetEmail()
	return 'junyixu0@gmail.com'
endfunction
"==================== end vim-templates ======================}}}

"=================== vimwiki ==============================={{{

imap <M-L><C-J> <Plug>VimwikiListNextSymbol
imap <M-L><C-K> <Plug>VimwikiListPrevSymbol
imap <M-L><C-M> <Plug>VimwikiListToggle
"let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/Notes', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
" let g:vimwiki_list = [{'path': '~/Notes', 'syntax': 'markdown'}]
"autocmd BufRead,BufNewFile *.wiki setfiletype vimwiki
"autocmd BufWritePost ~/.HHD/MyResource/Notes/*.md nnoremap ,gl :!cd ~/.HHD/MyResource/Notes/ && git pull<cr>
"autocmd BufWritePost ~/.HHD/MyResource/Notes/*.md exe '!cd ~/.HHD/MyResource/Notes/; git pull; git add . && git commit -S -s -m "' 'Update file(s): '.expand('%:t'). '" && git push '
"""autocmd BufWritePost ~/.HHD/MyResource/Notes/*.md silent exe '!cd ~/.HHD/MyResource/Notes/; git pull; git add . && git commit -s -m "' 'Update file(s): '.expand('%:t'). '" && git push '
""
""autocmd BufWritePost ~/.HHD/MyResource/Notes/*.md call SaveAndUpdate()
""function! SaveAndUpdate()
""    let cwd = getcwd()
""    let fname = expand('%:t')
""    echo cwd
""    exe 'cd /home/junyi/.HHD/MyResource/Notes'
""    echo "Updating your Notes repository ..."
""    silent exe '!git pull '
""    silent exe '!git add .'
""    silent exe '!git commit -s -m "' 'Update file(s): '. fname . '">/dev/null'
""    silent exe '!git push >/dev/null 2>/dev/null'
""    echo "Done!"
""    exe 'cd' cwd
""    redraw!
""    " exe '!cd ~/Notes/; git add . && git commit -S -s -m "' 'Update file(s): '.expand('%:t'). '" && git push '
""endfunction

let g:vimwiki_table_mappings=0
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink

"=================== end vimwiki ===============================}}}

if !g:isPlain && !exists('g:started_by_firenvim')
"================= VimTeX ==============================={{{

" fold 造成 vimtex 相当卡顿
let g:vimtex_fold_enabled=0

" 在这里需要注意一下, 如果用了自动补全的插件, 需要设置:
let g:vimtex_fold_manual=1
" 不然会变得好慢.

" let  g:vimtex_fold_types = {
" 	   \ 'preamble' : {'enabled' : 1},
" 	   \ 'envs' : {
" 	   \	'whitelist' : ['figure', 'table'],
" 	   \},
" 	   \ 'sections' : {
" 	   \   'parse_levels' : 2,
" 	   \   'sections' : [      
" 	   \     'part',
" 	   \     'chapter',
" 	   \     'section',
" 	   \   ],
" 	   \   'parts' : [     
" 	   \     'appendix',
" 	   \     'frontmatter',
" 	   \     'mainmatter',
" 	   \     'backmatter',
" 	   \   ],
" 	   \ },
" 	   \}

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
  call vimtex#doc#make_selection(a:context)
  if !empty(a:context.selected)
	execute '!texdoc' a:context.selected '&'
	" let myjob=job_start('texdoc '+a:context.selected)
  endif
  return 1
endfunction

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" https://github.com/lervag/vimtex/issues/1233#issuecomment-627959240

" " 编译选项 连续编译 preview
" let g:vimtex_compiler_latexmk = {
" 			\ 'callback' : 1,
" 			\ 'executable' : 'latexmk',
" 			\ 'options' : [
" 			\ '-pdf',
" 			\ '-verbose',
" 			\ '-bibtex',
" 			\ '-file-line-error',
" 			\ '-synctex=1',
" 			\ '-interaction=nonstopmode',
" 			\ ],
" 			\}

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

"=================== end VimTex ===============================}}}
endif

"=================== fzf ==============================={{{
nnoremap <leader>ft :BTags<space>
nnoremap <leader>fT :Tags<space>
nnoremap <leader>f* :<C-U><C-R>=printf("Rg %s ", expand("<cword>"))<CR>
nnoremap <silent> <leader>fh :History<cr>
nnoremap <silent> <leader>f: :History:<cr>
nnoremap <silent> <leader>f/ :History/<cr>
nnoremap <silent> <leader>ff :Files %:h<cr>
nnoremap <leader>f<space> :Files<space>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fw :Windows<CR>
nnoremap <silent> <leader>fs :Snippets<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>gc :BCommits<CR>
nnoremap <silent> <leader>gC :Commits<CR>
nnoremap <silent> <leader>fm :Marks<CR>
nnoremap <silent> <leader>fM :Maps<CR>
nnoremap <leader>fl :BLines<space>
nnoremap <leader>fL :Lines<space>

" gtags 搜索
function s:gtags_search(line)
     let l:line = split(a:line)[1]
     let l:file = split(a:line)[2]
     execute 'edit +'.l:line l:file
endfunction
 nnoremap <silent> <Leader>fr :call fzf#run(fzf#wrap({'source':'global -x .', 'sink':function('<sid>gtags_search'),
             \ 'options': ['-m', '-d', '\t', '--with-nth', '1,2', '-n', '1', '--prompt', 'Tags> ']}))<CR>

" command -nargs=1 FZFfindref call fzf#run(fzf#wrap({'source':'global ' . shellescape(<args>) . 'sink':function('<sid>gtags_search'), 
" 			\ 'options': ['-m', '-d', '\t', '--with-nth', '1,2', '-n', '1', '--prompt', 'Tags> ']}))

" command! -bang -nargs=* FindRef
"   \ call fzf#vim#grep(
"   \   'global '.shellescape(<q-args>), 0,
"   \ 'options': ['-m', '-d', '\t', '--with-nth', '1,2', '-n', '1', '--prompt', 'Tags> ']})

" An action can be a reference to a function that processes selected lines

command! -bar -bang Snippets call fzf#vim#snippets({'options': '-n ..'}, <bang>0)
imap <silent> <M-k> <ESC>:Snippets<cr>
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'TAB': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
	" echom '您的 vim 版本低于 8.0，你需要通过升级才能正常使用 fzf 的 pop windows'
if version < 802 && !has('nvim')
	let g:fzf_layout = { 'down': '~40%' }
else
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

" let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain --theme=TwoDark -n -- {} || cat {}'
let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain --theme=gruvbox-dark -n -- {} || cat {}'
let g:fzf_history_dir = '~/.local/share/fzf-history'
    " function! s:update_fzf_colors()
  " let rules =
  " \ { 'fg':      [['Normal',       'fg']],
    " \ 'bg':      [['Normal',       'bg']],
    " \ 'hl':      [['Comment',      'fg']],
    " \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    " \ 'bg+':     [['CursorColumn', 'bg']],
    " \ 'hl+':     [['Statement',    'fg']],
    " \ 'info':    [['PreProc',      'fg']],
    " \ 'prompt':  [['Conditional',  'fg']],
    " \ 'pointer': [['Exception',    'fg']],
    " \ 'marker':  [['Keyword',      'fg']],
    " \ 'spinner': [['Label',        'fg']],
    " \ 'header':  [['Comment',      'fg']] }
  " let cols = []
  " for [name, pairs] in items(rules)
    " for pair in pairs
    "   let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
    "   if !empty(name) && code > 0
    "     call add(cols, name.':'.code)
    "     break
    "   endif
    " endfor
  " endfor
  " let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  " let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
    "     \ empty(cols) ? '' : (' --color='.join(cols, ','))
" endfunction
" autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
" augroup _fzf
"   autocmd!
"   autocmd ColorScheme * call <sid>update_fzf_colors()
" augroup END
"=================== fzf ===============================}}}

"=================== Gtags ==============================={{{
" NOTE 如何跳转到注释的末尾: ]/
" set cscopetag " 使用 cscope 作为 tags 命令

	" 没有对querytype=f指定使用quickfix窗口，所以:cs find f builder的结果以位置列表(location list)的方式显示
	" set cscopequickfix=s-,c-,d-,i-,t-,e-
    " set cscopequickfix=s-,c-,d-,i-,t-,e-
	
	" f+ 表示 builder每次的结果都会“累加”，比如执行10次就会有6*10=60个匹配项
	" :set cscopequickfix=s-,c-,d-,i-,t-,e-,f+

    " 映射 {{{
    " 查找C语言符号，即查找函数名、宏、枚举值等出现的地方 symbol
    " nmap css :cscope find s <C-R>=expand("<cword>")<CR>
    " " 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 def
    " nmap csd :cscope find g <C-R>=expand("<cword>")<CR>
    " " 查找本函数调用的函数 ref
    " nmap csR :cscope find d <C-R>=expand("<cword>")<CR>
    " " 查找调用本函数的函数 ref
    " nmap csr :cscope find c <C-R>=expand("<cword>")<CR>
    " " 查找指定的字符串 string
    " nmap cst :cscope find t <C-R>=expand("<cword>")<CR>
    " " 查找egrep模式，相当于egrep功能，但查找速度快多了
    " nmap cse :cscope find e <C-R>=expand("<cword>")<CR>
    " " 查找并打开文件，类似vim的find功能
    " nmap csf :cscope find f <C-R>=expand("<cfile>")<CR>
    " " 查找包含本文件的文件 include
    " nmap csi :cscope find i ^<C-R>=expand("<cfile>")<CR>$
	" " 查找此符号被赋值的位置, a: arguments
    " nmap csa :cscope find a <C-R>=expand("<cword>")<CR>
    " " 自己来输入命令
    " nmap cs<Space> :cscope find<Space>

	" # 水平分屏
	" :scs find f block_builder.cc
	" " # 垂直分屏
	" " :vert scs find f table_builder.cc
	" }}}
"gtags.vim 设置项

" let GtagsCscope_Auto_Load = 1

" let CtagsCscope_Auto_Map = 1

" let GtagsCscope_Quiet = 1

nnoremap <space>/<space> :cs find<space>
    " Gtags 映射 {{{
    " 查找C语言符号，即查找函数名、宏、枚举值等出现的地方 symbol
	nmap g<space> :Gtags<space>

	nmap ga<space> :Gtagsa<space>
	nmap gr<space> :Gtags -r<space>
	nmap gar<space> :Gtagsa -r<space>
	nmap t<space> :tjump<space>
    nmap g} :GtagsCursor<CR>

    nmap gss :Gtags <C-R>=expand("<cword>")<CR>
    " 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 def
    nmap gsd :Gtags -d <C-R>=expand("<cword>")<CR>
    " 查找调用本函数的函数 ref
    nmap gsr :Gtags -r <C-R>=expand("<cword>")<CR>
    " 查找指定的字符串 string
    nmap gst :Gtags -s <C-R>=expand("<cword>")<CR>
    " 查找egrep模式，相当于egrep功能，但查找速度快多了
    nmap gse :Gtags -e <C-R>=expand("<cword>")<CR>
    " 查找并打开文件，类似vim的find功能
    nmap gsf :Gtags -P <C-R>=expand("<cfile>")<CR>
    " 查找包含本文件的文件 include
    nmap gsi :Gtags -i ^<C-R>=expand("<cfile>")<CR>$
	" 查找此符号被赋值的位置, a: arguments
    nmap gsa :Gtags -a <C-R>=expand("<cword>")<CR>
    " 自己来输入命令
    nmap gs<Space> :Gtags find<Space>

	" # 水平分屏
	" :scs find f block_builder.cc
	" " # 垂直分屏
	" " :vert scs find f table_builder.cc
	" }}}

" 定义
nnoremap <space>/d :cscope find g<space> 
" 引用
nnoremap <space>/r :cscope find c<space>
" 字符串
nnoremap <space>/s :cscope find t<space>

" regular expression 正则
nnoremap <space>/e :cscope find e<space>

" include file
nnoremap <space>/i :cscope find i<space>

"	Find assignments  :cs find 9 or a
nnoremap <space>/a :cscope find a<space>

nnoremap <space>/* :<C-U><C-R>=printf("cscope find g %s ", expand("<cword>"))<CR>

" 在写入的时候自动刷新 ctags
" autocmd BufWritePost * call system("ctags -R")

"=================== Gtags ===============================}}}

if !g:isPlain && !exists('g:started_by_firenvim')
" ========================= tagbar ==================================={{{
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }
let g:tagbar_map_togglesort='S'
let g:tagbar_map_close='<M-q>'
" ========================= tagbar ===================================}}}
endif

" 使用 wolfram 计算 {{{
" jobstart 和 jobwait 只有 nvim 可用
" vim 用 job_start 和 waittime 或 timeout
inoremap <CR> <C-R>=Caculate()<CR>
let s:caculate_dict={}
function s:callback(jd,data,event) dict
	let msg=join(a:data)
	let self.data .= msg
endfunction
let s:caculate_dict.on_stdout=function("s:callback")
function! Caculate()
	let buf=getline(".")
	let n=2
	" 当前光标的位置之前一列
	let ps=col(".")-1
	if(ps<4 || buf[ps-1] isnot '=')
		return "\<CR>"
	endif
	while(1)
		if(ps-n<0||buf[ps-1] is "'")
			break
		endif
		let n+=1
	endwhile
	let expr=buf[ps-n+2:ps-2]
	let cmd="wolframscript -code "."'".expr."'"
	let s:caculate_dict.data=""
	let job_id=jobstart(cmd,s:caculate_dict)
	let status=jobwait([job_id], 20000)[0]==-1
	if status
		return "timeout"
	endif
	return s:caculate_dict.data
endfunction
" }}}

" 注释显示斜体
" highlight Comment cterm=italic
" highlight Comment gui=italic
"
" let g:indentLine_color_term="8"
" hi clear Conceal
" highlight Conceal ctermfg=darkgray
" hi Conceal ctermbg=none
" 高亮当前行号, 不高亮当前行
" if has('nvim') == 0 && has('patch-8.1.2020')
" 	set cursorlineopt=number
" 	" set cursorlineopt=number cursorline
" endif
