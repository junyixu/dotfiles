" 使用 vim-plug
"=========== begin vim-plug =============
call plug#begin('~/.vim/plugged')
"Plug 'junegunn/seoul<t_CO>.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'

"=========== begin git =============
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
	"nnoremap <Leader>gd :SignifyDiff<cr>
Plug 'junegunn/gv.vim'
"=========== end git =============
Plug 'derekwyatt/vim-fswitch' "替换 vim-scripts/a.vim


Plug 'xolox/vim-session'
	let g:session_autosave=0
	let g:session_autoload=0
Plug 'xolox/vim-misc'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'farmergreg/vim-lastplace' "打开 vim 到上次编辑的位置

" -----------------begin 美观 ------------------
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords' "使用 <Leader>k 和 <Leader>K 选择和取消
" -----------------end 美观 ------------------
"
Plug 'Raimondi/delimitMate' " 自动补全括号
	" For Python docstring.
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
	au FileType python let b:delimitMate_nesting_quotes = ['"']

Plug 'octol/vim-cpp-enhanced-highlight',{'for':'c,cpp'}
Plug 'Yggdroot/indentLine',{'for':'c,cpp,python'}
	"let g:indentLine_char = '┆'
	"let g:indentLine_setConceal = 0
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_setConceal = 0
"Plug 'FuDesign2008/randomColor.vim' "不再使用
"let g:random_color_start = 0
Plug 'yianwillis/vimcdoc'
"Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'				"不会用 airline, 装了 powerline
"Plug 'vim-airline/vim-airline-themes'
"Plugin 'lyokha/vim-xkbswitch'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'PietroPate/vim-tex-conceal', {'for': 'tex'}
	set conceallevel=2
	let g:tex_conceal="abdgm"
"Plug 'vim-scripts/Align'

"=============== begin markdown ===============
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':'markdown'}
Plug 'hotoo/pangu.vim'
"=============== end markdown ===============

Plug 'mhinz/vim-startify'

" ============== begin 补全 ===============
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py','for':'cpp' }
	let g:ycm_seed_identifiers_with_syntax = 1
	let g:ycm_collect_identifiers_from_tags_files = 1
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
   let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/Ultisnips']
Plug 'ervandew/supertab'  "解决 tab 键的矛盾
"============== end 补全 ===============

Plug 'vimwiki/vimwiki'
Plug 'aperezdc/vim-template'
call plug#end()
"=========== end vim-plug =============


"---------------------Plugs config -------------------------------------"

" fcitx.vim
if has('Unix')
set timeout timeoutlen=3000 ttimeoutlen=100
let g:powerline_pycmd="py3"
endif
colorscheme gruvbox
set background=dark

"================== make UltiSnips coporate with YCM ============
" <https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"=================== end ========================================

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

nnoremap <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"

"=================== begin LeaderF ===============================
let g:Lf_ShortcutF = '<C-n>'
let g:Lf_ShortcutB = '<C-p>'
noremap <M-m> :LeaderfMru<cr>
noremap <M-f> :LeaderfFunction!<cr>
noremap <C-p> :LeaderfBuffer<cr>
noremap <M-t> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_CommandMap = {'<C-x>': ['<cr>'], '<C-]>': ['<C-\>'], '<C-j>': ['<C-n>'], '<C-k>': ['<C-p>']}
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"=================== end LeaderF ===============================

"==================== begin w0rp/ale =============================
" <https://www.zhihu.com/question/47691414/answer/373700711>
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"let g:airline#extensions#ale#enabled = 1
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_command_wrapper = 'nice -n5'

let g:ale_linters = {
      \ 'c': ['gcc', 'clang'],
      \ 'cpp': ['gcc', 'cppcheck'],
      \ 'python': ['flake8', 'pylint'],
      \ 'lua': ['luac'],
      \ 'go': ['go build', 'gofmt'],
      \ 'java': ['javac'],
      \ 'javascript': ['eslint'],
      \ }

"let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta
"==================== end w0rp/ale =============================



"==================== begin nerdtree======================
" Close nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Make NERDTree easier to toggle.
nmap <Leader>t :NERDTreeToggle<cr>
let g:NERDTreeMapOpenVSplit = '\'
let g:NERDTreeMapOpenSplit = '-'

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
"==================== end nerdtree======================




"==================== begin vim-templates ======================
let g:templates_directory = '$HOME/.vim/templates'
let g:templates_user_variables = [['EMAIL', 'GetEmail'],]

function GetEmail()
	return 'junyixu0@gmail.com'
endfunction
"==================== end vim-templates ======================

"=================== begin vimwiki ===============================
"let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~\Notes', 'syntax': 'markdown'}]

" windows 下用 & 表示 ;
nmap <Leader>gt <Plug>VimwikiTabnewLink
nmap <Leader>vsp <Plug>VimwikiVSplitLink
nmap <Leader>sp <Plug>VimwikiSplitLink

nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink
" windows 使用 & 表示 ;
"autocmd BufWritePost ~/Notes/*.md exe '!cd C:\Users\junyi\Notes & git pull& git add . & git commit -s -m "' 'Update file(s): '.expand('%:t'). '" & git push '
"autocmd BufWritePost ~/Notes/*.md call SaveAndUpdate()
function! SaveAndUpdate()
    let cwd = getcwd()
    let fname = expand('%:t')
    echo cwd
    exe 'cd C:\Users\junyi\Notes'
    echo "Updating your Notes repository ..."
    silent exe '!git pull & git add . & git commit -s -m "' 'Update file(s): '. fname . '" & git push '
    echo "Done!"
    exe 'cd' cwd
    redraw!
endfunction

"markdown-preview.nvim
map <Leader>vm :MarkdownPreview<cr>
"=================== end vimwiki ===============================
"
"---------------------Latex--------------------------------------"
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'xelatex'
"let g:livepreview_cursorhold_recompile = 0
map <leader>vt :LLPStartPreview<CR>
"=================== begin VimTex ===============================
let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'
map <leader>ll :VimtexCompile<CR>
map <leader>le :VimtexError<CR>
map <leader>lv :VimtexView<CR>
call vimtex#imaps#add_map({
  \ 'lhs' : '<CR>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})
"let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

autocmd BufReadPost *.tex inoremap <S-CR> \\<CR>
" 待解决
"call vimtex#imaps#add_map({
"  \ 'lhs' : '<S-CR>',
"  \ 'rhs' : '\\',
"  \ 'leader' : '',
"  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
"  \ 'context' : ["itemize", "enumerate"],
"  \})

let g:vimtex_compiler_latexmk = {'callback' : 0}

"=================== end VimTex ===============================

"=================== begin RandomColor ===============================

"let g:favorite_color_schemes = ['molokai-mod',
"					"\ 'eink',
"                    "\ 'zenburn',
"                    \ 'jellybeans',
"					"\ 'peaksea',
"					\ 'solarized_dark']
"
"let g:favorite_color_schemes = [
"			\'autumn_lily',
"			\'beachcomber',
"			\'biogoo',
"			\'blueprint',
"			\'borland',
"			\'buttercream',
"			\'calmar256_light',
"			\'camo',
"			\'caramel',
"			\'chela_light',
"			\'darkBlue',
"			\'darkspectrum',
"			\'desertEx',
"			\'dusk',
"			\'dw_cyan',
"			\'dw_green',
"			\'earendel',
"			\'eclipse',
"			\'eink',
"			\'ekvoli',
"			\'fine_blue',
"			\'freya',
"			\'fruit',
"			\'habilight',
"			\'impact',
"			\'inkpot',
"			\'ironman',
"			\'jellybeans',
"			\'kolor',
"			\'leo',
"			\'lilydjwg_dark',
"			\'lilydjwg_green',
"			\'lilypink',
"			\'lucius',
"			\'manuscript',
"			\'manxome',
"			\'marklar',
"			\'matrix',
"			\'metacosm',
"			\'midnight',
"			\'molokai',
"			\'moss',
"			\'motus',
"			\'navajo_night',
"			\'navajo',
"			\'neon',
"			\'night',
"			\'northland',
"			\'papayawhip',
"			\'peaksea',
"			\'pink_lily',
"			\'refactor',
"			\'relaxedgreen',
"			\'rootwater',
"			\'settlemyer',
"			\'sienna',
"			\'silent',
"			\'solarized_dark',
"			\'spring2',
"			\'tabula',
"			\'tango2',
"			\'tango',
"			\'tolerable',
"			\'torte',
"			\'vc',
"			\'vividchalk',
"			\'wombat256',
"			\'wombat',
"			\'xoria256',]
"=================== end RandomColor ===============================

" 说明
"=========================================================
" 使用此文件需要在.vimrc 中加入 "so ~/.vim/plugs.vim"
" 插件只是辅助
" vim 本身就已经很强大 ( 参见《vim 实用技巧》)
"=========================================================
