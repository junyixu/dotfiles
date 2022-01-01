#! /bin/sh
#
# install.sh
# Copyright (C) 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


# tar Jc  .oh-my-zsh .dotfiles .vim .tmux -f dotfiles.tar.xz
# tar --no-same-owner -I zstd -cvf dotfiles.tar.zst  .oh-my-zsh .dotfiles .vim .tmux .fzf .ssh

stow zsh
stow vim
stow tmux
stow git
stow ripgrep
stow fd
stow pip
stow ranger
stow MyShell
mkdir -p ~/.cache/vim/undo
