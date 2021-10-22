# 这个必须放在 p10k 的 instant prompt 之前，不然会报错
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    SESSION_NAME="test"
    tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
fi

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export C_INCLUDE_PATH=/home/junyi/.HHD/MyResource/C_Programming_Language/my_grep:$C_INCLUDE_PATH
# powerline-daemon -q
# . /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# for QuEST
#export CC=/usr/bin/gcc-8
#export CXX=/usr/bin/g++-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
# export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab
#export INCLUDE=$HOME/.local/mpich/include:$INCLUDE
#export INCLUDE=$HOME/.local/mpich/include

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

export GPG_TTY=$TTY

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=60

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	vi-mode
	tmux
	extract
	z
	colored-man-pages
	systemd
	git-auto-fetch
	zsh-autosuggestions
	fast-syntax-highlighting
	mosh
	gcloud
	fd
	ripgrep
	rsync
	alias-finder # 参数 -l (longer) ; -e (exact)
	git
	fzf-tab
	# dotbare
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=zh_CN.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# z
# export _Z_CMD=j

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshcfg="vi ~/.zshrc"
alias tmuxcfg="vi ~/.config/tmux/tmux.conf"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias okular='XDG_CONFIG_HOME=/home/junyi/okularconfig okular'
# alias inkscape='XDG_CONFIG_HOME=/home/junyi/ankiconfig inkscape'

# matlab
# for GNOME's bug
# export J2D_D3D=false
# export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre
alias matlab='unset GTK_MODULES && matlab'
# alias matlab='screen -S matlab -m sh -c "/opt/MATLAB/R2018a/bin/matlab -nodesktop -nosplash"'
alias mrun="matlab -nodesktop -nosplash -logfile `date +%Y_%m_%d-%H_%M_%S`.log -r"

alias clc='clear'

alias socks5='ALL_PROXY=socks5://localhost:1080 HTTP_PROXY=socks5://localhost:1080 HTTPS_PROXY=socks5://localhost:1080 '
alias proxy='ALL_PROXY=http://localhost:1081 HTTP_PROXY=http://localhost:1081 HTTPS_PROXY=http://localhost:1081 '

alias Syu='sudo pacman -Syu'
alias S='sudo pacman -S'
alias Si='pacman -Si'
alias Ss='pacman -Ss'
alias R='sudo pacman -Rs'
alias Qi='pacman -Qi'
alias Ql='pacman -Ql'
alias Qs='pacman -Qs'
alias Qsq='pacman -Qsq'
alias Qm='pacman -Qm'
alias Qmq='pacman -Qmq'
alias Qk='pacman -Qk'
alias Qkk='pacman -Qkk'
alias Qo='pacman -Qo'
alias F='pacman -F'
alias Fl='pacman -Fl'

alias search='baloosearch'

# 查询 ip
alias myip='curl https://ip.cn'
alias proxyip='proxychains -q curl https://ip.cn'

alias cpuf='cat /proc/cpuinfo | grep MHz | cut -f2 -d: | uniq -'
alias psmem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"

alias weather='curl wttr.in'
alias wget="wget --quiet --show-progress"
# youtube-dl and you-get
alias yd='youtube-dl --write-auto-sub --sub-lang en'
alias yden='youtube-dl --write-sub --sub-lang en'
alias ydcn='youtube-dl --write-sub --sub-lang zh-CN'

alias mkcd='foo(){ mkdir -p "$1"; cd "$1"  }; foo '
alias u='ffsend upload --copy'

alias sagenotes='cd ~/Desktop/learning/learning_python3/sage_files && jupyter lab --no-browser'

gvimt(){ command gvim --remote-tab-silent $@ || command gvim $@; }

alias ctl='systemctl'
alias sys='sudo systemctl'
alias user='systemctl --user'

alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias status="systemctl status"

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

alias open='xdg-open'
alias o='xdg-open'
alias screenshot='flameshot gui -r'

# alias vim='vim --cmd "let g:isProgramming=1" '
# alias vim='vim --cmd "let g:isProgramming=1" '
alias nvi='nvim'
alias wiki='vi -c "cd %:h" ~/Notes/index.md'
alias diary='vi -c "cd %:h" ~/Notes/diary/$(date +"%F").md'  # date +"%F" 的意思：eg: 2020-08-05


# plasmashell cpu占用过高，重启解决
alias restartplasmashell='kquitapp5 plasmashell ; kstart5 plasmashell'
alias plasmashellrestart='kquitapp5 plasmashell ; kstart5 plasmashell'

alias makebeamer='pandoc -t beamer -o makefile_demo.pdf --pdf-engine=xelatex makefile.md'

alias notes='cd ~/Desktop/university/current_course && $EDITOR main.tex'
alias vitodo='vi ~/Notes/todolist.md'

alias svi='sudo -E vim --cmd "let g:SUDO=1" --cmd "let g:isPlain=1" '
# 088.987  000.001: --- VIM STARTED --- 启动 只需要 88 毫秒
alias vi='vim --cmd "let g:isPlain=1"'
alias vim='vim --cmd "let g:isPlain=0"'
# 打开到 上一次 打开的地方
alias lvi='vi -c "normal '\''0"'

# For git front-end: vim-fugitive
alias vig='vim -c "G"'
alias vit='vim --servername TEX'
alias gvit='gvim --servername TEX'
alias vitv='vim --servername TEX -c 'VimtexView''
alias gvitv='vim --servername TEX -c 'VimtexView''
alias testtex="cd ~/Desktop/university/testtex && vim --servername TEX -c 'VimtexView' main.tex"
# 打开 jupyter qtconsole
alias jvi="vim -c JupyterConnect"
# alias jvi="jupyter qtconsole& ; vim -c JupyterConnect"

# Show open ports
alias ports='netstat -tulanp'
# alias ssh='ssh -Y'

alias tldr='https_proxy=http://127.0.0.1:1081 tldr'
# note
# find -name *.java -print0 | xargs -0 p4 add
# 它的工作原理是，find 命令在目录树下找到所有的以 ".java" 结尾的文件，把它们用NULL字符隔开做成一个字符串，然后交给 xargs。
#
# 比如我要删除所有 *.java
# find -name *.java -print0 | xargs -0 rm


# tar flag 打包并压缩
# gtar 包.tar.gz  打包对象1 打包对象2 ...
alias gtar="tar -Ipigz czvf"
# btar 包.tar.bz2  打包对象1 打包对象2 ...
# alias btar="tar -Ilbzip2 cjvf"
alias btar="tar cjvf"
# ztar 包.tar.zst  打包对象1 打包对象2 ...
# --no-same-owner 解压时不保留用户信息
# alias ztar='tar --no-same-owner -I zstd -cvf'
ztar(){
	local __tar_name=$(echo $1:r | sed 's/^\.[^\/]?//')
	# 去除第一个参数的拓展名  $1:r
	# 如果是隐藏文件则去掉开头的 .
	# 并且防止 ./*
	
	tar --no-same-owner -I zstd -cvf $__tar_name.tar.zst $@
}

alias unztar='tar -I zstd -xvf'
alias 7tar="7z a -mmt"

alias copy='xclip -selection clipboard -in'

#alias rsync='myrsync.sh'
alias vicmake='$EDITOR CMakeLists.txt'
alias vimcmake='$EDITOR CMakeLists.txt'

(( $+commands[you-get] )) && alias you-getp="you-get -p mpv"
#alias cat='bat'
alias turbo='sudo sh -c "echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo"'
alias no_turbo='sudo sh -c "echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"'
alias top='htop'
alias anki='XDG_CONFIG_HOME=/home/junyi/lightconfig anki'
# alias sudo='sudo -E'
# alias pacman='powerpill'

alias -s php=vim
alias -s rb=vim
alias -s c=vim
alias -s cpp=vim
alias -s md=vim
alias -s tex='vim --servername TEX'
alias -s pdf=okular

# winecfg
# 生成 32 位 Wine 环境
# export WINEARCH=win32
# export WINEPREFIX=~/.eudic

# time 命令格式
# export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# socks5 代理 (curl, git, pacman, yay 可以设置 all_proxy 变量直接使用）
# export all_proxy="socks5://127.0.0.1:1080"
# 笔记： 这是 python requests 包里的语法格式，对 shell 没用，多了个h 的意思是域名也送给代理解析，本地不解析域名
#export all_proxy="socks5h://127.0.0.1:1080"
# export all_proxy="http://127.0.0.1:1081"
# export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# if [ "$SSH_CONNECTION" != "" ]; then
	# powerline-daemon -q
	# . /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
	[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# else
	# [[ -f ~/.p10k_Junix.zsh ]] && source ~/.p10k_Junix.zsh
# fi

#tmux
# if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ] && [ "$HOST" != "Junix" ]; then
#     SESSION_NAME="test"
#     tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
# fi

todo() {
 echo "$2" | /usr/bin/mail -s "$1" $TICKTICKEMAIL
}

# switch window 用 fzf 糢糊切换程序窗口
switch_window() { 
	local __window_id

	# 不需要 桌面 和 Latte Dock 栏，用 grep -v 去除
	__window_id=$(wmctrl -l | grep -v Plasma | grep -v Latte| fzf | cut -d' ' -f1)

	# 最小化当前窗口 没弄懂 怎么用 wmctrl 最小化窗口
	# xdotool windowminimize $(xdotool getactivewindow)
	wmctrl -ia $__window_id
}

alias s=switch_window

if hash lsd 2> /dev/null; then
	alias ls='lsd'
fi

r() {
  if [ "$1" != "" ]; then
    if [ -d "$1" ]; then
      ranger "$1"
    else
      ranger "$(_z -e $1)"
    fi
  else
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
  fi
	return $?
}

# https://www.reddit.com/r/kde/comments/asseoc/how_to_hide_qfilesystemwatcherremovepaths_list_is/
export QT_LOGGING_RULES='*=false'

# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "[[ $(file --mime {}) =~ binary ]] & echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview  "bat --style=numbers --color=always {} | head -33" '
# export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --preview  "bat --style=numbers --color=always --line-range :500 {}" '
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --info=inline --preview  "bat --style=numbers --color=always {} | head -33" '
# export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --ansi '
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --ansi'  # --ansi 选项使 fzf 可以带有 fd 的彩色输出
# export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git"
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git *.log *.bbl *.pdf *.aux *.out *.xdv *.fdb*'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude *.out --exclude *.svg'
export FZF_DEFAULT_COMMAND='fd --type f --color=auto --hidden --follow --exclude .git'  # 遵循符号链接: --follow;  并包含隐藏文件: --hidden (但不包括.git文件夹) :
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND='fd --type d . --color=always'
# export FZF_DEFAULT_OPTS='--height 40% --border'

# xargs -r 表示 如果为空，那么什么都不做
# vim 用 xargs 需要用 -o 选项 详情见
# https://superuser.com/questions/336016/invoking-vi-through-find-xargs-breaks-my-terminal-why
se() { du -a ~/bin/* ~/.config/* | awk '{ print $2 }'  | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }

visearch() { baloosearch $1 | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }

etc() { du -a /etc/* | awk '{ print $2 }'  | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }
# system() { du -a ~/.config/systemd/user/* /etc/systemd/* /usr/lib/systemd/* | awk '{ print $2 }'  | fzf | xargs -ro $EDITOR; }
# vim 用 xargs 必须要有 -o, 这是 vim 的 bug
sd() { 
	__sd_filename=$(find -H ~/.config/systemd /etc/systemd /usr/lib/systemd -type f \(  -name '*.timer' -o -name '*.service' \) | fzf --preview 'bat --style=numbers --color=always {} | head -33')
	# if [[ $__sd_filename == $HOME* ]]; then  # 使用 $HOME 通配符, [[ ]] 里面可以使用字符串比较的高级特性
	#    $EDITOR $__sd_filename
	# else
	# 	sudo -E $EDITOR $__sd_filename
    # fi
	[[ $__sd_filename != "" ]] &&	 ([[ $__sd_filename == $HOME* ]] && $EDITOR $__sd_filename || sudo -E $EDITOR $__sd_filename)  # 使用 $HOME 通配符, [[ ]] 里面可以使用字符串比较的高级特性
    # __sd_filename 一旦设置，出了函数也还在，需要用 unset 消除
	unset __sd_filename
}

fnotes(){
	local __current_working_dir
	local __note_name
	local __note_dir
	local __note_dir_name
	__current_working_dir=$(pwd)
	cd ~/.cache/LaTeXNotesPDFImg
	__note_name=$(ls ./* | fzfimg.sh)
	if [[ $__note_name != "" ]]; then
		__note_name=$(basename $__note_name .jpg)
		__note_dir_name=$HOME/Desktop/university/bachelor-3
		 __note_dir=$__note_dir_name/$__note_name
		cd $__note_dir
		vim --servername TEX -c 'VimtexView' ./main.tex
	else
		cd $current_working_dir
		echo '字符串为空，没有选择任何pdf文件'
	fi
}
    # local __DEFAULT_SIZE="1920x1080"
	# pdftoppm -f 1 -l 1 \
			 # -scale-to-x "${__DEFAULT_SIZE%x*}" \
			 # -scale-to-y -1 \
			 # -singlefile \
			 # -jpeg -tiffcompression jpeg \
			 # -- "$__note_dir/latex.out/main.pdf" "$HOME/.cache/LaTeXNotesPDFImg/$__note_dir_name" 
# 更改 v2ray 配置
v2ray() { 
	cd /etc/v2ray
	ls ./* | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro sudo -E $EDITOR; 
}


vimrc() { find -H ~/.vim -type d \( -path ~/.vim/doc -o -path  ~/.vim/plugged  \) -prune -false -o -type f -print| fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }
# vimrc() { find -L ~/.vim  \( -path ~/.vim/plugged -o -path ~/.vim/doc -o -path ~/.vim/cache \) -prune -o -type f -print | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }
config() { find ~/.dotfiles \( -path ~/.dotfiles/vim -o -path ~/.dotfiles/systemd -o -path ~/.dotfiles/.git \) -prune -false -o -type f -not -name '.gitignore' -print | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }

# fstart - start systemd unit
#
fstart() {
  unit=$(systemctl list-unit-files | grep disabled |
    awk '{print $1}' | grep service | fzf)
  [ -n "$unit" ] && sudo systemctl start $unit &&
    journalctl -u $unit --since "10 sec ago" --no-pager
}

# fstop - stop systemd unit
fstop() {
  unit=$(systemctl list-units | grep running |
    awk '{print $1}' | grep service | fzf)
  [ -n "$unit" ] && sudo systemctl stop $unit &&
    journalctl -u $unit --since "10 sec ago" --no-pager
}

# finstall - install new package
finstall() {
  package=$(pacman -Ssq | fzf)
  if [ -n "$package" ]; then
    pacman -Ss "^$package$"
    sudo pacman -S $package
  fi
}

# fdelete - completely uninstall package
fdelete() {
  package=$(pacman -Qqe | fzf)
  [ -n "$package" ] && sudo pacman -Rscn $package
}

fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# unalias z
# unalias zz
# unalias j
j() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

jj() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

jt() {
	# 用 sed 去掉 开头的     数字 , . /
	# 用 sed 去掉末尾的      .pdf
	_z "$(/bin/ls -1 ~/Sync/uni_pdf | sed 's/^[0-9,.\/]* *//' | sed 's/\.pdf$//' | fzf)" 
  vim --servername TEX -c 'VimtexView' ./main.tex
}

# 搜索pdf笔记中的内容
searchnotes() {
	# 让 awk 用 冒号 : 分隔
	okular $(rga $@ ~/Sync/uni_pdf | fzf | awk -F: '{print $2, $1}' | sed s/Page/--page/) --find $@
}

# 不行，-- 的作用
# s() {
# 	local __note_page_name
# 	# 让 awk 用 冒号 : 分隔
# 	__note_page_name=$(rga $@ ~/Sync/uni_pdf | fzf | awk -F: '{print $2, $1}' | sed s/Page/--page/)
# 	echo $__note_page_name
# 	if [ ! -z $__note_page_name ]; then  # 判断字符串是否为空，若不为空，则：
# 		okular $__note_page_name
# 	else # 若字符串为空，则
# 		echo '字符串为空，没有选择任何pdf文件'
# 	fi
# }

t() {
	local __current_working_dir
	local __note_name
	__current_working_dir=$(pwd)
	cd ~/.cache/LaTeXNotesPDFImg  # TODO fzfimg.sh 必须 cd 到那个目录，如何修改使之不需要 cd 到那个目录？
	__note_name=$(ls ./* | fzfimg.sh)

	if [ ! -z $__note_name ]; then  # 判断字符串是否为空，若不为空，则：
	# 用 sed 去掉 开头的     数字 , . /
	# 用 sed 去掉末尾的      .jpg
	xdg-open ~/Sync/uni_pdf/$__note_name:r.pdf || echo '没有这个文件'
	else # 若字符串为空，则
		cd $__current_working_dir
		echo '字符串为空，没有选择任何pdf文件'
	fi
}

tt() {
	local __current_working_dir
	local __note_name
	__current_working_dir=$(pwd)
	cd ~/.cache/LaTeXNotesPDFImg  # TODO fzfimg.sh 必须 cd 到那个目录，如何修改使之不需要 cd 到那个目录？
	__note_name=$(ls ./* | fzfimg.sh)

	if [ ! -z $__note_name ]; then  # 判断字符串是否为空，若不为空，则：
	# 用 sed 去掉 开头的     数字 , . /
	# 用 sed 去掉末尾的      .jpg
	_z "$(echo $__note_name | sed 's/^[0-9,.\/]* *//' | sed 's/\.jpg$//')" && vim --servername TEX -c 'VimtexView' ./main.tex || echo '没有这个目录'
	else # 若字符串为空，则
		cd $__current_working_dir
		echo '字符串为空，没有选择任何pdf文件'
	fi
}


rf() {
    if [[ "$#" -ne 0 ]]; then
        ranger $(j $@)
        return
    fi
    ranger "$(j -l | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}
# [[ -s ~/.config/zsh/zsh-interactive-cd.plugin.zsh ]] && source ~/.config/zsh/zsh-interactive-cd.plugin.zsh
# source ~/.config/zsh/zsh-interactive-cd.plugin.zsh

fb() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}
# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
# fuzzy vi
fvi() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  	# -n 检测字符串长度是否不为 0，不为 0 返回 true
  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# 用 xdg-open 打开文件
# fuzzy open
fo() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  	# -n 检测字符串长度是否不为 0，不为 0 返回 true
  if [[ -n $files ]]
  then
     xdg-open $files
     print -l $files[1]
  fi
}


# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
# fuzzy cd
fcd() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# Google Chrome (OS X/linux)
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/chromium/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# b - browse chrome bookmarks
b() {
     bookmarks_path=~/.config/chromium/Default/Bookmarks

     jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    jq -r $jq_script < "$bookmarks_path" \
        | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' \
        | fzf --ansi \
        | cut -d$'\t' -f2 \
        | xargs open
}

# Like f, but not recursive.
fm() f "$@" --max-depth 1

man-find() {
    f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
}

fman() {
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}

export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

# 不要自作聪明，我需要通配符
unsetopt nomatch


# git
alias gpp='git add . && git commit -m "update" && git push'
alias gc1='git clone --depth=1 '
alias gtree='git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ad)%Creset''
alias gxtree='git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ar)%Creset''
alias greftree='git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=iso'
alias grefxtree='git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=relative'
alias gfetched-xtree='git xtree @{1}..'

#
# 与 Powerlevel10k instant prompt 一起使用会报错
# '\e[2 q' 是光标方块，不闪烁
# '\e[1 q' 是光标方块，闪烁
# '\e[6 q' 是光标竖线，不闪烁
# '\e[5 q' 是光标竖线，闪烁
# if [ "$SSH_CONNECTION" == "" ]; then

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        >$TTY echo -ne '\e[2 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        >$TTY echo -ne '\e[6 q'
    fi
}
# zle -N zle-keymap-select

# Use beam shape cursor on startup.
>$TTY echo -ne '\e[6 q'

# Use beam shape cursor for each new prompt.
preexec() {
	>$TTY echo -ne '\e[6 q'
}

_fix_cursor() {
	>$TTY echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)


zle -N zle-line-init
zle -N zle-keymap-select

KEYTIMEOUT=1
# fi

# fzf-tab
# https://github.com/Aloxaf/fzf-tab/blob/master/README_CN.md
# 当补全命令的开关时禁用排序
zstyle ':completion:complete:*:options' sort false

# 当补全 _z 时，使用输入作为查询字符串
zstyle ':fzf-tab:complete:_z:*' query-string input

# （实验性功能，未来可能更改）
# 一些定义 extract 变量的样板代码
# 稍后需要使用这个变量，请记得复制这段代码
local extract="
# 提取输入（当前选择的内容）
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# 获取当前补全状态的上下文（待补全内容的前面或者后面的东西）
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# 真实路径
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

# 补全 `kill` 命令时提供命令行参数预览
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# 补全 cd 时使用 exa 预览其中的内容
if hash exa 2> /dev/null; then
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
fi

# lazygit
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
export GTAGSLABEL=native-pygments

# 让 gtags 把 *.h 视为 cpp 文件
# export GTAGSFORCECPP=

# http://www.crazylaw.cn/2018/11/15/linux-shell-huanhangbuchong/
# oh-my-zsh 换行补偿
# PROMPT_EOL_MARK=''

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 自动在项目目录的 .venv 目录创建虚拟环境
# export PIPENV_VENV_IN_PROJECT=1


 #Load pyenv automatically by appending
# the following to ~/.zshrc:
# hash 为了判断 pyenv 是否存在
# if hash pyenv 2> /dev/null; then
# 	eval "$(pyenv init -)"
# fi
# 已经写入 ~/.zprofile 不再需要在 ~/.zshrc 中写入


[ "$TERM" == alacritty ] && unset LSCOLORS && unset LS_COLORS && export TERM="xterm-256color"

# 按空格键时自动进行历史扩展
bindkey " " magic-space
# 直接执行历史扩展的结果 (任何选项直接加 no 就是相反效果) (或者用 unsetopt)
# setopt no_hist_verify
unsetopt hist_verify
setopt extendedglob

# electron 电子
export ELECTRON_MIRROR='https://npm.taobao.org/mirrors/electron/'
export SASS_BINARY_SITE='https://npm.taobao.org/mirrors/node-sass'

# systemd-journal 格式, 折行
export SYSTEMD_LESS=FRXMK journalctl

# export TEXINPUTS="/usr/share/texmf//:"

export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia/static


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export -U PATH
