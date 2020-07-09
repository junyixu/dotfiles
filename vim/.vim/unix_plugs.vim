
let $GTAGSLABEL = 'native'
" 在 Linux 下，不配置 let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'也可以正常工作，好像默认会读这个文件。
" let $GTAGSCONF = $HOME.'/.globalrc'

"=========== begin vim-plug ============={{{
if has("nvim")
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'easymotion/vim-easymotion'
" Plug 'ntpeters/vim-better-whitespace'
" let g:better_whitespace_ctermcolor='<desired_color>'
" let g:better_whitespace_guicolor='<desired_color>'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
Plug 'petRUShka/vim-sage'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"===========  git ============={{{
Plug 'tpope/vim-fugitive'

Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
    let g:git_messenger_no_default_mappings = 0
    " let g:git_messenger_always_into_popup = 1
    noremap <leader>gm :GitMessenger<CR>

" 侧栏显示 git 标识
" Plug 'airblade/vim-gitgutter'
    " let g:gitgutter_max_signs=700

" 确定插件仓库中的分支或者 tag
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"=========== end git =============}}}

" Plug 'derekwyatt/vim-fswitch' "替换 vim-scripts/a.vim

Plug 'pboettch/vim-cmake-syntax'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader> :WhichKey ','<CR>
" nnoremap <silent> g :WhichKey 'g'<CR>


" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" let g:VM_leader = ','
" let g:VM_theme = 'ocean'
" let g:VM_maps = {}
" let g:VM_maps["Move Right"] = '<M-C-l>'
" let g:VM_maps["Move Left"] = '<M-C-h>'

Plug 'tpope/vim-repeat'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'ferrine/md-img-paste.vim'
let g:mdip_imgdir = 'resources'
let g:mdip_imgname = 'image1'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
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

"===========  词典 ============={{{
" doc: apc
Plug 'skywind3000/vim-auto-popmenu' 
	" enable this plugin for filetypes, '*' for all files.
	let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'vimwiki':1}
    let g:apc_enable_tab=0
	" source for dictionary, current or other loaded buffers, see ':help cpt'
	set cpt=.,k,w,b

	" don't select the first item.
	set completeopt=menu,menuone,noselect

	" suppress annoy messages.
	set shortmess+=c
    " let g:ycm_filetype_blacklist = {'text':1, 'markdown':1, 'php':1}
    " let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
Plug 'skywind3000/vim-dict'
"===========  词典 =============}}}


Plug 'tpope/vim-abolish'
Plug 'skywind3000/asyncrun.vim'
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

"=========== textobj-user 全家桶 ============={{{
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for': ['c', 'cpp', 'vim', 'java', 'julia', 'matlab'] }
Plug 'sgur/vim-textobj-parameter'
"=========== end textobj-user 全家桶 =============}}}
"
" Plug 'prabirshrestha/asyncomplete.vim'

if has("nvim")
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
    set shortmess+=c

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

else
	" Plug 'Valloric/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer', 'for': ['c', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab', 'fortran']}
	Plug 'Valloric/YouCompleteMe', {'frozen': 1, 'do': './install.py --clangd-completer'}
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' , 'on': 'YcmGenerateConfig'}
endif

Plug 'JuliaEditorSupport/julia-vim'



" 启动时间
" Plug 'dstein64/vim-startuptime'

" ----------------- ctags and gtags ------------------{{{
Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp', 'cuda', 'sage.python', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab']}
" Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview', { 'for': ['c', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab']}
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    noremap <m-u> :PreviewScroll -1<cr>
    noremap <m-d> :PreviewScroll +1<cr>
    inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
" Plug 'liuchengxu/vista.vim', { 'for': ['c','markdown', 'vimwiki', 'cpp', 'cuda', 'tex', 'julia', 'python', 'cmake', 'go', 'matlab']}
Plug 'liuchengxu/vista.vim'
    nnoremap <leader>t :Vista!!<CR>
     let g:vista_no_mappings=1
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> q    :close<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> <CR> :<c-u>call vista#cursor#FoldOrJump()<CR>
     autocmd FileType vista,vista_kind nnoremap <buffer> <silent> p    :<c-u>call vista#cursor#TogglePreview()<CR>
" ----------------- tags ------------------}}}

" Plug 'lilydjwg/fcitx.vim', {'for': ['tex', 'markdown', 'vimwiki']}
Plug 'lilydjwg/fcitx.vim'

" Plug 'xolox/vim-session'
	" let g:session_autosave=0
	" let g:session_autoload=0
" Plug 'xolox/vim-misc'

" -----------------begin 美观 ------------------{{{
" Plug 'itchyny/vim-cursorword', { 'for': ['c', 'cpp', 'java', 'python', 'julia', 'matlab', 'cuda'] }
Plug 'itchyny/vim-cursorword'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'lfv89/vim-interestingwords' " 使用 <M-k> 和 <M-K> 选择和取消  该插件在 "~/.vim/plugin/ 下面
Plug 'kshenoy/vim-signature'
" Plug 'MattesGroeger/vim-bookmarks'
  " nmap ml <Plug>BookmarkShowAll
  " " let g:bookmark_manage_per_buffer = 1
  " let g:bookmark_auto_save_file = $HOME .'/.cache/vim/vim-bookmarks'
  " let g:bookmark_auto_close = 1
  " " let g:bookmark_location_list = 1
Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-smooth-scroll'
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <S-Space> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <Space> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" -----------------end 美观 ------------------}}}

Plug 'farmergreg/vim-lastplace' "打开 vim 到上次编辑的位置

Plug 'tpope/vim-surround'

Plug 'Raimondi/delimitMate' " 自动补全括号
	" For Python docstring.
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
	au FileType python let b:delimitMate_nesting_quotes = ['"']

Plug 'luochen1990/rainbow', {'on': 'RainbowToggle'}
Plug 'tpope/vim-commentary' " 注释插件
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType matlab setlocal commentstring=%\ %s
    autocmd FileType systemd setlocal commentstring=#\ %s
    autocmd FileType dosini setlocal commentstring=#\ %s
    " 对 c 没有用
    " autocmd FileType c setlocal commentstring=%\ %s
" 缩进插件
Plug 'Yggdroot/indentLine', {'for': ['python', 'tex']}
	let g:indentLine_char = '¦'
	let g:indentLine_setConceal = 0
	" let g:indentLine_fileTypeExclude = ['text', 'sh', 'txt', 'tex', 'vim']
	"let g:indentLine_fileType = ['py', 'c', 'cpp', 'f', 'f90']
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']


Plug 'andymass/vim-matchup', { 'for': ['julia', 'python', 'cmake', 'matlab', 'sh', 'vim']}
Plug 'yinflying/matlab.vim', {'for': 'matlab'}
Plug 'yinflying/matlab-screen', {'for': 'matlab'}

Plug 'yianwillis/vimcdoc'
Plug 'tpope/vim-vinegar'

Plug 'francoiscabrol/ranger.vim', {'on': 'RangerWorkingDirectoryNewTab'}
    let g:ranger_map_keys = 0
    map <M-e> :RangerWorkingDirectoryNewTab<CR>
    " let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
    " let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
    

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    nnoremap <leader>2 :UndotreeToggle<cr>

"================== begin colorscheme ======================{{{
Plug 'morhetz/gruvbox' "colorscheme
" Plug 'joshdick/onedark.vim' "colorscheme
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one' "colorscheme
"================== end colorscheme ======================}}}


"Plugin 'lyokha/vim-xkbswitch'

"=============== begin LaTeX ==============={{{
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'PietroPate/vim-tex-conceal', {'for': 'tex'}
	set conceallevel=2
	let g:tex_conceal="abdgm"
"=============== end LaTeX ===============}}}

"=============== begin markdown ==============={{{
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['vimwiki', 'markdown', 'vim-plug']}
Plug 'hotoo/pangu.vim'
"=============== end markdown ===============}}}


" ============== 补全 ==============={{{
set noshowmode
if has("nvim") || version < 802
    Plug 'Shougo/echodoc.vim'
    " To use echodoc, you must increase 'cmdheight' value.
        let g:echodoc#type="floating"
        let g:echodoc_enable_at_startup = 1
endif
if version < 800
	echom '您的 vim 版本低于 8.0，你需要通过升级才能正常使用 w0rp/ale 等插件'
else
    " Plug 'dense-analysis/ale', { 'for': ['cuda', 'python', 'sage.python', 'sh', 'bash', 'julia', 'cmake', 'julia', 'matlab', 'tex', 'go', 'yaml', 'javascript', 'fortran'] }
    Plug 'dense-analysis/ale'
endif
    "set completeopt=menu,menuone
    "let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_autoclose_preview_window_after_completion=1

" Plug 'Linfee/ultisnips-zh-doc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"============== =====================}}}

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
Plug 'vimwiki/vimwiki'
Plug 'aperezdc/vim-template'
Plug 'bootleq/vim-cycle'

"====================== begin airline=========================={{{
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
    " let g:airline_theme='deus'
    " let g:airline_theme='quantum'
    " let g:airline_theme='distinguished'
    " let g:airline_theme='gruvbox'
    " let g:airline_theme='onedark'
    " let g:airline_theme='minimalist'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
" Plug 'vim-airline/vim-airline', {'on': [], 'frozen': 1}
Plug 'vim-airline/vim-airline', {'on': []}
Plug 'ryanoasis/vim-devicons', {'on': []} 
" Plug 'vim-airline/vim-airline-themes'
function LazyLoadAirline(timer) abort
    " let g:airline_theme = 'one'
    let g:airline_theme='gruvbox'
    call plug#load('vim-airline')
    call plug#load('vim-devicons')
    execute 'AirlineInit'
    " execute 'AirlineToggle'
endfunction
" https://github.com/vim-airline/vim-airline/issues/2047
" autocmd VimEnter * call timer_start(50, 'LazyLoadAirline')
autocmd VimEnter * ++once call timer_start(50, 'LazyLoadAirline')

" powerline
" let g:powerline_pycmd="py3"
" set laststatus =2
"====================== end airline==========================}}}

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
autocmd VimEnter * imap <silent> <expr> <TAB> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "<Tab>"
autocmd VimEnter * inoremap <S-TAB> <S-TAB>
"}}}

"====================== matlab =========================={{{
autocmd FileType matlab compiler mlint
autocmd FileType matlab vnoremap <buffer> <F5> :call RunSelectInMatlab()<CR>
autocmd FileType matlab nnoremap <buffer> <F5> :call RunCurrentFileInMatlab()<CR>
autocmd FileType matlab nnoremap <buffer> <Leader>d :call GetMatlabDoc()<CR>
let g:matlab_term_cmd='matlab -nodesktop -nosplash'

autocmd FileType matlab noremap <buffer> <F5>  :call matlab#RunSelected()<CR>
autocmd FileType matlab noremap <buffer> <C-F5>  :call matlab#RunCell()<CR>
autocmd FileType matlab noremap <buffer> <F5>  :call matlab#RunCurrentFile()<CR>
autocmd FileType matlab noremap <buffer> <F1>  :call matlab#GetDoc()<CR>
autocmd FileType matlab noremap <buffer> <F10>  :call matlab#Toggle()<CR>
let g:matlab_screen_terminal_height = 6
" autocmd FileType matlab nnoremap <Leader>mb  :call matlab#SetBreak()<CR>
" autocmd FileType matlab nnoremap <Leader>mv  :call matlab#WatchVarible()<CR>
" autocmd FileType matlab nnoremap <Leader>mf  :call matlab#OpenCurrentFile()<CR>
" autocmd FileType matlab nnoremap <Leader>maf :call matlab#OpenAllFile()<CR>
" autocmd FileType matlab nnoremap <Leader>mw  :call matlab#OpenWorkspace()<CR>
" autocmd FileType matlab nnoremap <Leader>mc  :call matlab#ClearVariables()<CR>
" autocmd FileType matlab nnoremap <Leader>ms  :call matlab#GetVariableSize()<CR>
"====================== end matlab ==========================}}}

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


" ================================= easymotion =============================={{{
let g:EasyMotion_smartcase = 1 " turn on case insensitive feature
let g:EasyMotion_do_mapping = 0 " disable default malpings
let g:EasyMotion_use_smartsign_us = 1 " 1 will match 1 and !
" let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1

nmap t <Plug>(easymotion-t2)
" nmap <leader>g <Plug>(easymotion-bd-w)
nmap <leader><leader>f <Plug>(easymotion-s2)
nmap <leader><leader>w <Plug>(easymotion-bd-W)
nmap <leader><leader>e <Plug>(easymotion-bd-E)
" map t <Plug>(easymotion-bd-t)
" map f <Plug>(easymotion-bd-f)
map <leader>f <Plug>(easymotion-bd-f)
" nmap f <Plug>(easymotion-bd-f)
" omap t <Plug>(easymotion-tl)
" omap f <Plug>(easymotion-fl)

" jk motions: line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" ================================= easymotion ==============================}}}


" =========================  colorscheme {{{
"colorscheme molokai-mod
let g:molokai_transparent=1
" colorscheme hybrid
colorscheme gruvbox
" colorscheme onedark
" colorscheme ayu
" colorscheme quantum
" let g:gruvbox_contrast_dark='hard'
set background=dark
"}}}

set timeoutlen=500

"====================== ctags =========================={{{
" https://www.zhihu.com/question/47691414/answer/373700711
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件 / 目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_project_root = ['.root', '.svn', '.hg', '.project']
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
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+nliazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_exclude_project_root = [ '/home/junyi/.local/share/nvim' ]
" let g:gutentags_exclude_project_root = [ '/home/junyi/.vim' ]

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0

"====================== end ctags ==========================}}}

"================== git ============{{{
nnoremap <leader>gd :Gvdiffsplit<cr>

"================== git ============}}}

"================== youcompleteme ============{{{
nnoremap <C-j>  :YcmCompleter GoTo<CR>
" 只能是 #include 或已打开的文件
" nnoremap <M-j> :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yd :YcmDiags<CR>
nnoremap <leader>yf :YcmDiags FixIt<CR>

" 错误标记
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
let g:ycm_warning_symbol = '--'

let g:ycm_add_preview_to_completeopt = 1
" au filetype cuda let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings=1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" <https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
            \ "cuda":1,
			\ "objc":1,
            \ "python":1,
            \ "tex":1,
			\ "sh":1,
			\ "julia":1,
			\ "zimbu":1,
			\ "fortran":1,
			\ "matlab":1,
			\ }
"let g:ycm_semantic_triggers =  {
"			\ 'python,java,go,erlang,perl': ['re!\w{2}'],
"			\ 'cs,lua,javascript': ['re!\w{2}'],
"			\ }
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,cuda': ['re!\w{7}'],
			\ 'python': ['re!\w{4}'],
            \ 'java, julia, go,erlang,perl': ['re!\w{2}'],
			\ 'cs, lua,javascript, typescript': ['re!\w{2}'],
			\ }
" 开启基于 tag 的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1

" let g:ycm_language_server =
"   \ [
"   \   {
"   \     'name': 'julia',
"   \     'cmdline': [ '/home/junyi/.julia/packages/LanguageServer/', '--stdio',  '--startup-file=no', '--history-file=no', '-e'],
"   \     'filetypes': [ 'julia' ]
"   \   }
"   \ ]
"=================== YCM ========================================}}}


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
nmap <tab>p <Plug>(ale_previous_wrap)
nmap <tab>n  <Plug>(ale_next_wrap)

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
            \   'fortran': ['language_server', 'gcc'],
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
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/Ultisnips']
nnoremap <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"
"=================== end ========================================}}}

"==================== mappings for vim-fswitch ================{{{
"Plug 'derekwyatt/ "替换 vim-scripts/a.vim
"- Switch to the file and load it into the current window >
	nmap <silent> <Leader>of :FSHere<cr>
" Switch to the file and load it into the window on the right >
	nmap <silent> <Leader>ol :FSRight<cr>
"- Switch to the file and load it into a new window split on the right >
	nmap <silent> <Leader>oL :FSSplitRight<cr>
" - Switch to the file and load it into the window on the left >
	nmap <silent> <Leader>oh :FSLeft<cr>
" - Switch to the file and load it into a new window split on the left >
	nmap <silent> <Leader>oH :FSSplitLeft<cr>
" - Switch to the file and load it into the window above >
	nmap <silent> <Leader>ok :FSAbove<cr>
" - Switch to the file and load it into a new window split above >
	nmap <silent> <Leader>oK :FSSplitAbove<cr>
" - Switch to the file and load it into the window below >
	nmap <silent> <Leader>oj :FSBelow<cr>
" - Switch to the file and load it into a new window split below >
	nmap <silent> <Leader>oJ :FSSplitBelow<cr>
"==================== mappings for vim-fswitch ================}}}

"==================== nerdtree ======================{{{
" Close nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Make NERDTree easier to toggle.
nmap <Leader>1 :NERDTreeToggle<cr>
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

"---------------------Latex--------------------------------------"
"=================== VimTex ==============================={{{
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

let g:vimtex_compiler_latexmk = {
    \ 'options' : '-pdf -verbose -bibtex -file-line-error -synctex=1 --interaction=nonstopmode',
    \}
map <leader>ll :VimtexCompile<CR>
map <leader>le :VimtexError<CR>
map <leader>ls :VimtexStatus<CR>
map <leader>lv :VimtexView<CR>
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

call vimtex#imaps#add_map({
  \ 'lhs' : '<CR>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})

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
nnoremap <C-b> :Buffer<cr>
nnoremap <C-K> :BTags<cr>
nnoremap <C-f> :Rg<space>
" nnoremap <C-F> :<C-U><C-R>=printf("Rg %s ", expand("<cword>"))<CR>
nnoremap <C-H> :History<cr>
nnoremap <C-l> :Files<cr>
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
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
" highlight Comment cterm=italic
" highlight Comment gui=italic
" 似乎没有用
" highlight Comment font=OperatorMonoLight
"
let g:indentLine_color_term="8"
hi clear Conceal
highlight Conceal ctermfg=darkgray

