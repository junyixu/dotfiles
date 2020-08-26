let $GTAGSLABEL = 'native-pygments'
" 在 Linux 下，不配置 let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'也可以正常工作，好像默认会读这个文件。
" let $GTAGSCONF = $HOME.'/.globalrc'
" 下面还有个 nvim light
set background=dark

"=========== begin vim-plug ============={{{
if has("nvim")
    call plug#begin('~/.local/share/nvim/plugged')
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    "{{{
        nnoremap <leader>i :set lines=20<cr>i
        set background=light
        set laststatus=0
    "}}}
else
    call plug#begin('~/.vim/plugged')

" Plug 'vim-airline/vim-airline', {'on': [], 'frozen': 1}
Plug 'vim-airline/vim-airline', {'on': []}
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-cursorword'
" {{{
    " let g:airline_theme='deus'
    " let g:airline_theme='quantum'
    " let g:airline_theme='distinguished'
    " let g:airline_theme='gruvbox'
    " let g:airline_theme='onedark'
    " let g:airline_theme='base16'
    " let g:airline_theme='base16_classic'
    " let g:airline_theme='base16_nord'
    let g:airline_theme='base16_oceanicnext'
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

if version < 800
	echom '您的 vim 版本低于 8.0，你需要通过升级才能正常使用 w0rp/ale 等插件'
else
    Plug 'dense-analysis/ale', { 'for': ['python', 'sage.python', 'cmake', 'matlab', 'tex', 'go', 'yaml', 'javascript'] }
    " Plug 'dense-analysis/ale'
endif
endif
Plug 'chuling/ci_dark'

" optional
Plug 'luochen1990/rainbow'

" set fillchars+=vert:│

" let g:airline_theme = 'ci_dark'
" let g:lightline = {
"   \ 'colorscheme': 'ci_dark',
" }

"=========== textobj-user 全家桶 ============={{{
" Plug 'jeetsukumaran/vim-pythonsense'

Plug 'kana/vim-textobj-user'
" 以下都依赖 Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function', { 'for': ['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'julian/vim-textobj-variable-segment'
Plug 'coachshea/vim-textobj-markdown', {'for': 'markdown'}
Plug 'bps/vim-textobj-python', {'for':'python'}
"=========== end textobj-user 全家桶 =============}}}

Plug 'petRUShka/vim-sage'

Plug 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>

Plug 'dyng/ctrlsf.vim'
highlight link ctrlsfFilename Underlined
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_auto_focus = {'at': 'start'}
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_default_root = 'project'
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
inoremap <silent> <leader>/v <Esc>:CtrlSFToggle<CR>
nmap <leader>* <Plug>CtrlSFCwordExec
xmap <leader>* <Plug>CtrlSFVwordExec
vmap <leader>* <Plug>CtrlSFVwordExec
" cabbrev rg CtrlSF
" cabbrev rgt CtrlSF -T
" cabbrev rgr CtrlSF -R

Plug 'jpalardy/vim-slime', {'on': ['<Plug>SlimeRegionSend',
            \ '<Plug>SlimeParagraphSend', '<Plug>SlimeConfig']}
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 0
let g:slime_target = 'tmux'
" let g:slime_default_config = {
"             \ 'socket_name': get(split($TMUX, ','), 0),
"             \ 'target_pane': ':.'
"             \ }
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
xmap <M-c><M-c> <Plug>SlimeRegionSend
nmap <M-c><M-c> <Plug>SlimeParagraphSend
nmap <M-c>v <Plug>SlimeConfig

Plug 'wellle/tmux-complete.vim'
	" let g:tmuxcomplete#trigger = 'omnifunc'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"===========  git ============={{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-apathy'

Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
    "{{{
    let g:git_messenger_no_default_mappings = 0
    " let g:git_messenger_always_into_popup = 1
    noremap <leader>gm :GitMessenger<CR>
    "}}}

" 侧栏显示 git 标识
" Plug 'airblade/vim-gitgutter'
    " let g:gitgutter_max_signs=700

" 确定插件仓库中的分支或者 tag
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"=========== end git =============}}}

Plug 'easymotion/vim-easymotion'
" ================================= easymotion =============================={{{
let g:EasyMotion_smartcase = 1 " turn on case insensitive feature
" let g:EasyMotion_do_mapping = 0 " disable default malpings
let g:EasyMotion_use_smartsign_us = 1 " 1 will match 1 and !
" let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
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

" jk motions: line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" ================================= easymotion ==============================}}}

Plug 'pboettch/vim-cmake-syntax', {'for': 'cmake'}
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
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
"========================= format ================================}}}

"===========  词典 ============={{{
" doc: apc
" Plug 'skywind3000/vim-auto-popmenu' 
	" enable this plugin for filetypes, '*' for all files.
	let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'vimwiki':1}
    let g:apc_enable_tab=0
	let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text', 'tex':'tex, latex, text'}
	" source for dictionary, current or other loaded buffers, see ':help cpt'
	" complete
	set cpt=.,k,w,b,t
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


Plug 'tpope/vim-abolish'
Plug 'skywind3000/asyncrun.vim'
    "{{{
    " 自动打开 quickfix window ，高度为 6
    let g:asyncrun_open = 6

    " 任务结束时候响铃提醒
    let g:asyncrun_bell = 1

    let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

    nnoremap <silent> <F4> :AsyncRun -cwd=<root>/build cmake .. <cr>
    nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    nnoremap <silent> <F6> :AsyncRun -cwd=<root>/build -raw make test <cr>
    nnoremap <silent> <F7> :AsyncRun -cwd=<root>/build make <cr>
    nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
    " 设置 F10 打开 / 关闭 Quickfix 窗口
    nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
    "}}}



if has('nvim')
if 0
	" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'

	" enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()

	" IMPORTANT: :help Ncm2PopupOpen for more information
	set completeopt=noinsert,menuone,noselect

	" NOTE: you need to install completion sources to get completions. Check
	" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	" julia
	let g:default_julia_version = '1.0'

	" language server
	let g:LanguageClient_autoStart = 1
	let g:LanguageClient_serverCommands = {
	\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
	\       using LanguageServer;
	\       using Pkg;
	\       import StaticLint;
	\       import SymbolServer;
	\       env_path = dirname(Pkg.Types.Context().env.project_file);
	\       debug = false;
	\
	\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "");
	\       server.runlinter = true;
	\       run(server);
	\   ']
	\ }

	nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
	nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
	nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    " set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

endif
else
	" Plug 'ycm-core/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer', 'for': ['c', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab', 'fortran']}
	Plug 'ycm-core/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer'}
	Plug 'ycm-core/lsp-examples'
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' , 'on': 'YcmGenerateConfig'}
endif

Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}

" 启动时间
" Plug 'dstein64/vim-startuptime'

" ----------------- ctags and gtags ------------------{{{
Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp', 'cuda', 'julia', 'tex', 'python', 'cmake', 'go', 'matlab']}
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview', { 'for': ['c', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab']}
    "{{{
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    noremap <m-u> :PreviewScroll -1<cr>
    noremap <m-d> :PreviewScroll +1<cr>
    inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
    noremap <m-b> :PreviewScroll -2<cr>
    noremap <m-f> :PreviewScroll +2<cr>
    inoremap <m-b> <c-\><c-o>:PreviewScroll -2<cr>
    inoremap <m-f> <c-\><c-o>:PreviewScroll +2<cr>
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

Plug 'lilydjwg/fcitx.vim'

" Plug 'xolox/vim-session'
	" let g:session_autosave=0
	" let g:session_autoload=0
" Plug 'xolox/vim-misc'

" -----------------begin 美观 ------------------{{{
" 缩进插件
Plug 'Yggdroot/indentLine', {'for': ['python']}
    "{{{
    nnoremap <leader>tt :Vista!!<CR>
	let g:indentLine_char = '¦'
	let g:indentLine_setConceal = 0
	" let g:indentLine_fileTypeExclude = ['text', 'sh', 'txt', 'tex', 'vim']
	"let g:indentLine_fileType = ['py', 'c', 'cpp', 'f', 'f90']
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    "}}}
" Plug 'itchyny/vim-cursorword', { 'for': ['c', 'cpp', 'java', 'python', 'julia', 'matlab', 'cuda'] }
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'lfv89/vim-interestingwords' " 使用 <M-k> 和 <M-K> 选择和取消  该插件在 "~/.vim/plugin/ 下面
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align'
    "{{{
    nnoremap <leader>tt :Vista!!<CR>
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
    "}}}
Plug 'mhinz/vim-startify'

" Plug 'terryma/vim-smooth-scroll'
    " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    " noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    " noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" -----------------end 美观 ------------------}}}

Plug 'farmergreg/vim-lastplace'  "打开 vim 到上次编辑的位置

Plug 'tpope/vim-surround'

Plug 'Raimondi/delimitMate'  " 自动补全括号
    "{{{
    nnoremap <leader>tt :Vista!!<CR>
	" For Python docstring.
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
	au FileType python let b:delimitMate_nesting_quotes = ['"']
	" imap <S-Tab> <Plug>delimitMateS-Tab
    "}}}

Plug 'luochen1990/rainbow', {'on': 'RainbowToggle'}
Plug 'tpope/vim-commentary' " 注释插件
    "{{{
    nnoremap <leader>tt :Vista!!<CR>
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType matlab setlocal commentstring=%\ %s
    autocmd FileType systemd setlocal commentstring=#\ %s
    autocmd FileType dosini setlocal commentstring=#\ %s
    " 对 c 没有用
    " autocmd FileType c setlocal commentstring=%\ %s
    "}}}


" 匹配增强
" Plug 'andymass/vim-matchup', { 'for': ['julia', 'python', 'cmake', 'matlab', 'sh', 'vim', 'fortran']}
Plug 'andymass/vim-matchup'

" matlab
Plug 'yinflying/matlab.vim', {'for': 'matlab'}
Plug 'yinflying/matlab-screen', {'for': 'matlab'}

" vim 中文文档
Plug 'yianwillis/vimcdoc'

Plug 'ryanoasis/vim-devicons'

"======================= 🌲️ 项目树 ========================={{{
" 抽屉式项目树
Plug 'tpope/vim-vinegar'
    " let g:NERDTreeHijackNetrw = 1 " add this line if you use NERDTree

Plug 'francoiscabrol/ranger.vim'
    let g:ranger_map_keys = 0
    map <M-e> :RangerWorkingDirectoryNewTab<CR>
    " let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    nnoremap <leader>tu :UndotreeToggle<cr>
"======================= 🌲️ 项目树 =========================}}}

"================== begin colorscheme ======================{{{
Plug 'morhetz/gruvbox' "colorscheme
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim' "colorscheme

" Plug 'kevinhwang91/vim-one'
" let g:one_termcolors = 0
" let g:one_allow_italics = 1

" augroup ColorTheme
"     autocmd!
"     autocmd ColorScheme * call s:color_scheme()
" augroup end

" function s:color_scheme() abort
"     highlight! link TermCursor Cursor
"     if g:colors_name ==# 'one'
"         highlight CurrentWord cterm=bold ctermbg=238 gui=bold guibg=#314365
"     endif
" endfunction
"
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one' "colorscheme
"================== end colorscheme ======================}}}


"Plugin 'lyokha/vim-xkbswitch'
Plug 'jupyter-vim/jupyter-vim', {'for': ['python', 'julia']}

Plug 'vimwiki/vimwiki'
"=============== Markdown ==============={{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['vimwiki', 'markdown', 'vim-plug']}
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown'
	let g:vim_markdown_folding_disabled = 1
	let g:tex_conceal = ""
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

"=============== begin LaTeX ==============={{{
Plug 'lervag/vimtex', {'for': 'tex'}
" Plug 'lervag/vimtex'
	let g:vimtex_fold_enabled=1
Plug 'PietroPate/vim-tex-conceal', {'for': 'tex'}
	set conceallevel=2
	let g:tex_conceal="abdgm"
"=============== end LaTeX ===============}}}

" ============== 补全 ==============={{{
set noshowmode
if has("nvim") || version < 802
    Plug 'Shougo/echodoc.vim'
    " To use echodoc, you must increase 'cmdheight' value.
        let g:echodoc#type="floating"
        let g:echodoc_enable_at_startup = 1
endif

Plug 'Linfee/ultisnips-zh-doc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"============== =====================}}}

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	" let g:pymode_rope_completion = 0
	" let g:pymode_rope_complete_on_dot = 0
Plug 'vim-python/python-syntax', { 'for': 'python'}
    let g:python_highlight_all = 1
" Plug 'tmhedberg/SimpylFold', { 'for': 'python'}

Plug 'aperezdc/vim-template'

" cycle: true <-> false etc
Plug 'bootleq/vim-cycle'
	let g:cycle_no_mappings = 1

call plug#end()

"=========== end vim-plug =============}}}
"" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
" 不知道这句怎么使用
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

"---------------------Plugs config -------------------------------------"

"=================== vim-cycle ================{{{
noremap <silent> <Plug>CycleFallbackNext <C-A>
noremap <silent> <Plug>CycleFallbackPrev <C-X>
nmap <silent> <c-a> <Plug>CycleNext
vmap <silent> <c-a> <Plug>CycleNext
nmap <silent> <c-x> <Plug>CyclePrev
vmap <silent> <c-x> <Plug>CyclePrev


"----------------------------------------------------------------------
" https://github.com/bootleq/vim-cycle
"----------------------------------------------------------------------
let g:cycle_default_groups = [
			\   [['true', 'false']],
			\   [['yes', 'no']],
			\   [['error', 'warning', 'info', 'debug']],
			\   [['on', 'off']],
			\   [['+', '-']],
			\   [['>', '<']],
			\   [['"', "'"]],
			\   [['==', '!=']],
			\   [['and', 'or']],
			\   [["in", "out"]],
			\   [["up", "down"]],
			\   [["min", "max"]],
			\   [["get", "set"]],
			\   [["add", "remove"]],
			\   [["to", "from"]],
			\   [["read", "write"]],
			\   [["only", "except"]],
			\   [['without', 'with']],
			\   [["exclude", "include"]],
			\   [["asc", "desc"]],
			\   [["begin", "end"]],
			\   [["first", "last"]],
			\   [["slow", "fast"]],
			\   [["small", "large"]],
			\   [["push", "pull"]],
			\   [["before", "after"]],
			\   [["new", "delete"]],
			\   [["while", "until"]],
			\   [["up", "down"]],
			\   [["left", "right"]],
			\   [["top", "bottom"]],
			\   [["one", "two", "three", "four", "five", "six", "seven",
			\     "eight", "nine", "ten"]],
			\   [['是', '否']],
			\   [['\leftarrow', '\rightarrow', '\leftrightarrow', ]],
			\   [['\Longleftarrow', '\Longrightarrow' ]],
			\   [['void', 'int', 'char']],
			\   [['{:}', '[:]', '(:)'], 'sub_pairs'],
			\   [['（:）', '「:」', '『:』'], 'sub_pairs'],
			\   [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
			\     'Friday', 'Saturday'], 'hard_case', {'name': 'Days'}],
			\   [['January', 'February', 'March', 'April', 'May', 'June', 
			\     'July', 'August', 'September', 'October', 'November', 
			\     'December'], 'hard_case', {'name': 'Months'}],
			\ ]


"=================== vim-cycle ================}}}

"=================== delimitMate ================{{{
" 用 Tab 键进行 delimitMate 的光标跳转（也就是说，输入左括号后使用 Tab 键就可跳转到 delimitMate 生成的右括号的右边，而无需 <S-TAB>），且不破坏 UltiSnips 的 Tab 键展开，同时禁用 delimitMate 自带的 <S-TAB>
" https://sololand.moe/2017/01/03/youcompleteme-ultisnips-c-cpp-function-parameters/
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "<Tab>"
" autocmd VimEnter * inoremap <S-TAB> <S-TAB>
"}}}
" if g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger
" 	" 跳到第二个
"    imap <Tab> "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" elseif delimitMate#ShouldJump() 
" 	imap <Tab> delimitMate#JumpAny() 
" else
" 	inoremap <Tab> <Tab>


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
try
    " colorscheme one
	colorscheme onedark
catch
endtry
" colorscheme hybrid
" colorscheme gruvbox
" colorscheme base16-gruvbox-dark-pale
" colorscheme base16-nord
" colorscheme base16-woodland
" colorscheme base16-oceanicnext
" colorscheme ayu
" colorscheme quantum
" let g:gruvbox_contrast_dark='hard'
"}}}

"====================== ctags =========================={{{
" https://www.zhihu.com/question/47691414/answer/373700711
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件 / 目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_project_root = ['.root', '.project']
" 这里我把 .git 去掉了，如果我需要这个插件直接在项目顶层，touch .root



let g:gitgutter_max_signs=1200

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" 通过 setlocal tags+=... 添加到局部 tags 搜索列表中。
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
" 原来是没有 l 选项的,TODO 这个 l 选项是干嘛的
let g:gutentags_ctags_extra_args = ['--fields=+nliazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_exclude_project_root = [ '/home/junyi/.local/share/nvim' ]
" let g:gutentags_exclude_project_root = [ '/home/junyi/.vim' ]

" windows 下需要, 否则会有路径名等问题，垃圾 windows
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为, 由于我一个 vim
" 只打开一个工程，用 tmux 和 vim 结合的方式，所以这里不需要了.
let g:gutentags_auto_add_gtags_cscope = 0

"====================== end ctags ==========================}}}

"================== git ============{{{
nnoremap <leader>gsv :Gvdiffsplit<cr>
nnoremap <leader>gss :Gdiffsplit<cr>
"================== git ============}}}

"================== youcompleteme ============{{{
"set completeopt=menu,menuone

" 错误标记
 let g:ycm_log_level = 'info'
" let g:ycm_error_symbol = '✗'  "set error or warning signs
" let g:ycm_error_symbol = '⨉'  "set error or warning signs
let g:ycm_error_symbol = "\ue009\ue009"  "set error or warning signs
let g:ale_sign_error = "\ue009\ue009"
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
let g:ycm_warning_symbol                                = '--'
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_collect_identifiers_from_tags_files           = 1 " 开启 YC基于标签引擎  The only supported tag format is the Exuberant Ctags format
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
let g:ycm_seed_identifiers_with_syntax                  = 1 " 开启语义补全
let g:ycm_complete_in_comments                          = 1  "在注释输入中也能补全

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
			\ 'coc-explorer' : 1,
			\ 'tagbar'       : 1,
			\ 'vista'        : 1,
			\ 'leaderf'      : 1,
			\ 'fzf'          : 1,
			\ 'gitcommit'    : 1,
			\ 'markdown'     : 1,
			\ 'vimwiki'      : 1,
			\ 'text'         : 1,
			\ }

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,cuda': ['re!\w{3}'],
			\ 'python': ['re!\w{2}'],
            \ 'java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs, lua,javascript, typescript': ['re!\w{2}'],
			\ 'matlab': ['re!\w{2}'],
			\ 'julia': ['re!\w{3}'],
			\ }

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

let s:lsp = '/home/junyi/.vim/plugged/lsp-examples'
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
			\	'cmdline': ['julia', '--startup-file=no', '--history-file=no', '-e', '
			\       using LanguageServer;
			\       using Pkg;
			\       import StaticLint;
			\       import SymbolServer;
			\       env_path = dirname(Pkg.Types.Context().env.project_file);
			\       debug = false;
			\
			\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
			\       server.runlinter = true;
			\       run(server);
			\   ']
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

"普通模式下，sp 前往上一个错误或警告，sn 前往下一个错误或警告
nmap [e <Plug>(ale_previous_wrap)
nmap ]e  <Plug>(ale_next_wrap)

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
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'asm': ['gcc'],
            \   'nasm': ['nasm'],
            \   'c': ['cppcheck', 'clang'],
            \   'cpp': ['cppcheck', 'clang++'],
            \   'cmake': ['cmakeformat', 'cmakelint'],
            \   'python': ['pyflakes'],
            \   'cuda': ['nvcc'],
            \   'go': ['gofmt'],
            \   'java': ['javac'],
            \   'javascript': ['eslint'],
            \   'shell': ['shell -n flag'],
            \   'yaml': ['prettier'],
            \   'matlab': ['mlint'],
            \   'tex': ['alex', 'chktex', 'lacheck'],
            \   'sh': ['language_server', 'shell', 'shellcheck'],
            \   'bash': ['language_server', 'shell', 'shellcheck'],
            \   'vue': ['eslint'],
            \   'json': ['jsonlint'],
            \ }

let g:ale_fixers = {'python': ['autopep8'], 'html': [], '*': ['remove_trailing_lines', 'trim_whitespace']}
"==================== end =============================}}}

"================== UltiSnips ============{{{
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/Ultisnips']
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
""    " exe '!cd ~/Documents/Notes/; git add . && git commit -S -s -m "' 'Update file(s): '.expand('%:t'). '" && git push '
""endfunction

let g:vimwiki_table_mappings=0
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink

"=================== end vimwiki ===============================}}}

"================= VimTex ==============================={{{
" au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
au filetype tex let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

au filetype tex call vimtex#imaps#add_map({
  \ 'lhs' : '<CR>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})
autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
autocmd FileType tex nnoremap <buffer><silent> <C-n> o\input{lec_.tex}<Esc>F_a
    let g:vimtex_doc_handlers = ['MyHandler']
    function! MyHandler(context)
      call vimtex#doc#make_selection(a:context)
      if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
      endif
      return 1
    endfunction

 let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" https://github.com/lervag/vimtex/issues/1233#issuecomment-627959240
let g:vimtex_compiler_latexmk = {
    \ 'options' : '-pdf -verbose -bibtex -file-line-error -synctex=1 --interaction=nonstopmode',
    \}
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

""打开后前一个 call 函数就会消失
"call vimtex#imaps#add_map({
"  \ 'lhs' : '<CR>',
"  \ 'rhs' : '\\&= ',
"  \ 'leader' : '',
"  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
"  \ 'context' : ["align"],
"  \})

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=1

autocmd filetype tex inoremap <S-CR> \\<CR>
" 待解决
"call vimtex#imaps#add_map({
"  \ 'lhs' : '<S-CR>',
"  \ 'rhs' : '\\',
"  \ 'leader' : '',
"  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
"  \ 'context' : ["itemize", "enumerate"],
"  \})
let g:vimtex_compiler_latexmk = {'callback' : 0}
"=================== end VimTex ===============================}}}

"=================== fzf ==============================={{{
nnoremap <leader>ft :BTags<space>
nnoremap <leader>fT :Tags<space>
nnoremap <leader>fr :Rg<space>
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
 nnoremap <silent> <Leader>fg :call fzf#run(fzf#wrap({'source':'global -x .', 'sink':function('<sid>gtags_search'),
             \ 'options': ['-m', '-d', '\t', '--with-nth', '1,2', '-n', '1', '--prompt', 'Tags> ']}))<CR>


" An action can be a reference to a function that processes selected lines
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
if version < 802
	let g:fzf_layout = { 'down': '~40%' }
else
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain --theme=TwoDark -n -- {} || cat {}'
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
    nmap css :cscope find s <C-R>=expand("<cword>")<CR>
    " 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 def
    nmap csd :cscope find g <C-R>=expand("<cword>")<CR>
    " 查找本函数调用的函数 ref
    nmap csR :cscope find d <C-R>=expand("<cword>")<CR>
    " 查找调用本函数的函数 ref
    nmap csr :cscope find c <C-R>=expand("<cword>")<CR>
    " 查找指定的字符串 string
    nmap cst :cscope find t <C-R>=expand("<cword>")<CR>
    " 查找egrep模式，相当于egrep功能，但查找速度快多了
    nmap cse :cscope find e <C-R>=expand("<cword>")<CR>
    " 查找并打开文件，类似vim的find功能
    nmap csf :cscope find f <C-R>=expand("<cfile>")<CR>
    " 查找包含本文件的文件 include
    nmap csi :cscope find i ^<C-R>=expand("<cfile>")<CR>$
	" 查找此符号被赋值的位置, a: arguments
    nmap csa :cscope find a <C-R>=expand("<cword>")<CR>
    " 自己来输入命令
    nmap cs<Space> :cscope find<Space>

	" # 水平分屏
	" :scs find f block_builder.cc
	" " # 垂直分屏
	" " :vert scs find f table_builder.cc
	" }}}
"gtags.vim 设置项

" let GtagsCscope_Auto_Load = 1

" let CtagsCscope_Auto_Map = 1

" let GtagsCscope_Quiet = 1

nnoremap g<space> :Gtags<space>
nnoremap ga<space> :Gtagsa<space>
nnoremap <space>/<space> :cs find<space>

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

nnoremap <space>f :tags<space>
nnoremap <space>t :tjump<space>

" 在写入的时候自动刷新 ctags
" autocmd BufWritePost * call system("ctags -R")

"=================== Gtags ===============================}}}
"
" ========================= tagbar ==================================={{{
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }
" ========================= tagbar ===================================}}}

" 注释显示斜体
highlight Comment cterm=italic
highlight Comment gui=italic
"
" let g:indentLine_color_term="8"
" hi clear Conceal
" highlight Conceal ctermfg=darkgray
" hi Conceal ctermbg=none
