" /usr/share/vim/vimfiles/plugin/gtags-cscope.vim
" if exists("g:loaded_gtags_cscope")
"   finish
" endif
" let g:loaded_gtags_cscope = 1


let s:global_command = $GTAGSGLOBAL
if s:global_command == ''
        let s:global_command = "global"
endif

function! s:My_GtagsCscope_AutoLoad()
  let cmd = s:global_command . " -pq"
  let cmd_output = system(cmd)
    if v:shell_error == 0
      GtagsCscope
    endif
endfunction

call s:My_GtagsCscope_AutoLoad()
