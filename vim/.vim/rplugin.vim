" perl plugins


" node plugins


" python3 plugins


" ruby plugins


" python plugins
"call remote#host#RegisterPlugin('python', '/home/junyi/.dotfiles/vim/.vim/plugged/vim-matlab/rplugin/python/vim_matlab', [
"      \ {'sync': v:true, 'name': 'MatlabCliActivateControls', 'type': 'command', 'opts': {}},
"      \ {'sync': v:false, 'name': 'BufDelete', 'type': 'autocmd', 'opts': {'pattern': '*.m'}},
"      \ {'sync': v:false, 'name': 'BufEnter', 'type': 'autocmd', 'opts': {'pattern': '*.m'}},
"      \ {'sync': v:true, 'name': 'BufWrite', 'type': 'autocmd', 'opts': {'pattern': '*.m'}},
"      \ {'sync': v:true, 'name': 'MatlabFixName', 'type': 'command', 'opts': {'nargs': '*'}},
"      \ {'sync': v:false, 'name': 'InsertEnter', 'type': 'autocmd', 'opts': {'pattern': '*.m'}},
"      \ {'sync': v:true, 'name': 'MatlabCliCancel', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliHelp', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliOpenInMatlabEditor', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliOpenVar', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliOpenWorkspace', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabWriteFunctionFiles', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabOpenTempScript', 'type': 'command', 'opts': {'nargs': '*'}},
"      \ {'sync': v:true, 'name': 'MatlabRename', 'type': 'command', 'opts': {'nargs': '1'}},
"      \ {'sync': v:true, 'name': 'MatlabCliRunCell', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliRunLine', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabPrintCellLines', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliRunSelection', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliViewSelectedVar', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'MatlabCliViewVarUnderCursor', 'type': 'command', 'opts': {}},
"      \ {'sync': v:true, 'name': 'VimLeave', 'type': 'autocmd', 'opts': {'pattern': '*'}},
"     \ ])
"
"
