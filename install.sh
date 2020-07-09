#! /bin/sh
#
# install.sh
# Copyright (C) 2020 junyi <junyi@Junix>
#
# Distributed under terms of the MIT license.
#


# tar Jc  .oh-my-zsh .dotfiles .vim .tmux -f dotfiles.tar.xz
stow zsh
stow vim
stow tmux
mkdir -p /home/junyi/.cache/vim/undo
