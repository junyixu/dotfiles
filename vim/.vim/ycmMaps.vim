nnoremap <buffer> <localleader>yd<Space> :YcmDiags<Space>
nnoremap <buffer> <localleader>ydf :YcmDiags FixIt<CR>
nnoremap <buffer> <localleader>gd :YcmCompleter GoTo<CR>
nnoremap <buffer> <localleader>y<space> :YcmCompleter<Space>
nnoremap <buffer> <localleader>gc :YcmGenerateConfig<CR>
nnoremap <buffer> <localleader>yl :YcmToggleLogs<CR>

" GetDoc
let g:ycm_auto_hover=''
nmap  <buffer>   <localleader>H      <Plug>(YCMHover)
nnoremap <buffer> <localleader>K :YcmCompleter GetDoc<CR>


" nnoremap <buffer> <localleader>gi :YcmCompleter GoToInclude<CR>
" nnoremap <buffer> <localleader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <localleader>gt :YcmCompleter GetType<CR>
nnoremap <buffer> <localleader>gp :YcmCompleter GetParent<CR>
nnoremap <buffer> <localleader>gf :YcmCompleter GotoInclude<CR>
nnoremap <buffer> <localleader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <buffer> <localleader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <buffer> <localleader>gr :YcmCompleter GoToReferences<CR>
