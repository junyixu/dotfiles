if has('Unix')
	so ~/.config/nvim/unix.vim
endif

if has('win32') || has('win64') ||has('win95') ||has('win16')
	so ~/.vim/windows.vim
endif
