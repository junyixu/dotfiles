" 不能放在 ~/.vim/ftplugin
" 必须放在 ~/.vim/after/ftplugin，
" 才能在 vim 加载完 fzf 的布局的颜色配置后再加载这行
nnoremap <buffer> <localleader>lf :call vimtex#fzf#run('ctli', g:fzf_layout)<cr>

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

function LazyLoadALE4TeX(timer) abort
	if &spelllang=='en_us' || &spelllang=='en_gb'
		let g:ale_linters['tex']=['textidote', 'lty']
	endif
endfunction
" TODO
" 把 * 换成 *.tex
" 但是已经在 ftplugin 里面了，不需要换了
" 怎么做更好呢
autocmd VimEnter * ++once call timer_start(1000, 'LazyLoadALE4TeX')
