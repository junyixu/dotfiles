# 这个必须放在 p10k 的 instant prompt 之前，不然会报错
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    SESSION_NAME="test"
    tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
fi

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

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
#export INCLUDE=$HOME/.local/mpich/include:$INCLUDE
#export INCLUDE=$HOME/.local/mpich/include
export GPG_TTY=$TTY

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# if [ "$SSH_CONNECTION" = "" ]; then
	# ZSH_THEME="random"
	# ZSH_THEME=powerlevel10k/powerlevel10k
	# ZSH_THEME="random"
# fi
ZSH_THEME=powerlevel10k/powerlevel10k

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
 export UPDATE_ZSH_DAYS=30

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
    alias-finder
	git
	fzf-tab
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"

# z
# export _Z_CMD=j

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshcfg="$EDITOR ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cpuf='cat /proc/cpuinfo | grep MHz | cut -f2 -d: | uniq -'

# alias matlab='screen -S matlab -m sh -c "/opt/MATLAB/R2018a/bin/matlab -nodesktop -nosplash"'

# for GNOME's bug
alias matlab='unset GTK_MODULES && matlab'
# alias okular='XDG_CONFIG_HOME=/home/junyi/okularconfig okular'
# alias inkscape='XDG_CONFIG_HOME=/home/junyi/ankiconfig inkscape'
alias nvrun="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
alias mrun="matlab -nodesktop -nosplash -logfile `date +%Y_%m_%d-%H_%M_%S`.log -r"
alias ctl='systemctl'
alias weather='curl wttr.in'
alias clc='clear'
alias notes='cd ~/Desktop/university/current_course && $EDITOR main.tex'
alias myip='curl https://ip.cn'
alias proxyip='proxychains4 -q curl https://ip.cn'
alias psmem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias wget="proxychains -q wget --quiet --show-progress"
alias yd='youtube-dl --write-auto-sub --sub-lang en'
alias yden='youtube-dl --write-sub --sub-lang en'
# alias j='z'
alias ydcn='youtube-dl --write-sub --sub-lang zh-CN'
alias yg='you-get'
alias tmuxcfg='$EDITOR ~/.tmux.conf'
alias todo='$EDITOR ~/Notes/todolist.wiki'
alias lacate='lacate --ignore-case'
alias makebeamer='pandoc -t beamer -o makefile_demo.pdf --pdf-engine=xelatex makefile.md'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1"  }; foo '
alias sagenotes='cd /home/junyi/Desktop/learning/learning_python3/sage_files && jupyter lab'
alias svi='sudo vim'
alias sys='sudo systemctl'
alias sus='systemctl --user'
alias u='ffsend upload --copy'

# 判断是否有 lsd， hash 在大部分系统下等价于 which
if hash lsd 2> /dev/null; then
	alias ls='lsd'
	alias l='ls -l'
	alias la='ls -a'
	alias lla='ls -la'
	alias lt='ls --tree'
fi

alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias status="systemctl status"
alias restart="sudo systemctl restart"
alias gtar="tar -Ipigz czfv"
alias btar="tar -Ilbzip2 cjfv"
alias 7tar="7z a -mmt"
# alias la='exa -a'
# alias ll='exa -l'
alias cat='bat'
alias e='$EDITOR'
alias vi='$EDITOR'
alias nvi='nvim'

#alias rsync='myrsync.sh'
alias vimcmake='$EDITOR CMakeLists.txt'
(( $+commands[you-get] )) && alias you-getp="you-get -p baka-mplayer"
#alias cat='bat'
alias turbo='sudo sh -c "echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo"'
alias no_turbo='sudo sh -c "echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"'
alias top='htop'
alias anki='XDG_CONFIG_HOME=/home/junyi/ankiconfig anki'
alias sudo='sudo -E'
# alias pacman='powerpill'


alias -s php=vim
alias -s rb=vim
alias -s c=vim
alias -s cpp=vim
alias -s md=vim
alias -s tex=vim
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


# https://www.reddit.com/r/kde/comments/asseoc/how_to_hide_qfilesystemwatcherremovepaths_list_is/
export QT_LOGGING_RULES='*=false'

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


[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

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

# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "[[ $(file --mime {}) =~ binary ]] & echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview  "bat --style=numbers --color=always {} | head -33" '
# export FZF_DEFAULT_OPTS='--layout=reverse --border --preview  "bat --style=numbers --color=always {} | head -33" '
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --info=inline'
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline'
# export FZF_DEFAULT_OPTS='--height 40% --border'

# vim 用 xargs 需要用 -o 选项 详情见
# https://superuser.com/questions/336016/invoking-vi-through-find-xargs-breaks-my-terminal-why
se() { du -a ~/bin/* ~/.config/* | awk '{ print $2 }'  | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }
etc() { du -a /etc/* | awk '{ print $2 }'  | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }
# system() { du -a ~/.config/systemd/user/* /etc/systemd/* /usr/lib/systemd/* | awk '{ print $2 }'  | fzf | xargs -ro $EDITOR; }
sd() { du -a ~/.config/systemd/user/* /etc/systemd/* /usr/lib/systemd/* | awk '{ print $2 }'  | fzf --preview 'bat --style=numbers --color=always {} | head -33' | xargs -ro $EDITOR; }

# fstart - start systemd unit
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
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  	# -n 检测字符串长度是否不为 0，不为 0 返回 true
  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
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

export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/.ripgreprc

# 不要自作聪明，我需要通配符
unsetopt nomatch

alias gtree='git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ad)%Creset''
alias gxtree='git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ar)%Creset''
alias greftree='git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=iso'
alias grefxtree='git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=relative'
alias gfetched-xtree='git xtree @{1}..'

# 与 Powerlevel10k instant prompt 一起使用会报错
# '\e[2 q' 是光标方块，不闪烁
# '\e[1 q' 是光标方块，闪烁
# '\e[6 q' 是光标竖线，不闪烁
# '\e[5 q' 是光标竖线，闪烁
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
if hash lsd 2> /dev/null; then
	zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'lsd -1 --color=always $realpath'
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

# http://www.crazylaw.cn/2018/11/15/linux-shell-huanhangbuchong/
# oh-my-zsh 换行补偿
# PROMPT_EOL_MARK=''

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PIPENV_PYPI_MIRROR=https://pypi.tuna.tsinghua.edu.cn/simple

# Load pyenv automatically by appending
# the following to ~/.zshrc:
eval "$(pyenv init -)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export -U PATH
