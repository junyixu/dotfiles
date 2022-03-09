if &cp
  set nocompatible " openSUSE needs this because its /etc/vimrc calls syntax on too early
endif

augroup filetypedetect
	" v2ray config.json
  autocmd BufNewFile,BufRead config.json setlocal filetype=jsonc
  au BufNewFile,BufRead *.asm				setf masm
  au BufNewFile,BufRead TAGS				setf tags
  au BufNewFile,BufRead *.cls				setf tex
  au BufNewFile,BufRead frp?.ini				setf systemd
  au BufNewFile,BufRead hg-editor-*.txt			setf hgcommit
  au BufNewFile,BufRead *openvpn*/*.conf,*.ovpn		setf openvpn
  au BufNewFile,BufRead	*.pxi				setf pyrex
  au BufRead		$HOME/.cabal/config		setf cabal
  au BufNewFile,BufRead *.stp				setf stap
  au BufNewFile,BufRead *.io				setf io
  au BufNewFile,BufRead supervisor*.conf                setf dosini
  au BufRead		*procmaillog			setf mail
  au BufNewFile,BufRead *.i				setf swig

  " Websites
  au BufRead		forum.ubuntu.org.cn_*,bbs.archlinuxcn.org_post.php*.txt		setf bbcode
  au BufRead		*fck_source.html*		setf html
  au BufRead		*docs.google.com_Doc*		setf html
  au BufNewFile,BufRead	*postmore/wiki/*.wiki		setf googlecodewiki
  au BufRead		lilydjwg.is-programmer.com_edit*		setf html
  au BufNewFile,BufRead	*.mw,*wpTextbox*.txt,*wiki__text*.txt		setf wiki
  au BufRead		/tmp/segmentfault.com_*-input*	setf markdown
" http://localhost:8888/lab
  autocmd BufEnter *localhost* setf python
  autocmd BufEnter mail.google.com_mail-u*.txt setf markdown
  autocmd BufEnter chaoli.club_index-php-*.txt setf markdown
  autocmd BufNewFile chaoli.club_index-php-*.txt	0r ~/.vim/templates/test.chaoli
augroup END
