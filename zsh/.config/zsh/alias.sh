# 虚拟机
# sudo virsh list
# sudo virsh start archlinux
# sudo virsh shutdown archlinux
alias v='sudo -E virsh'

alias cpuf='cat /proc/cpuinfo | grep MHz | cut -f2 -d: | uniq -'
alias psmem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"

alias zshcfg="vi ~/.zshrc"
alias tmuxcfg="vi ~/.tmux.conf"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# alias okular='XDG_CONFIG_HOME=/home/junyi/okularconfig okular'
# alias inkscape='XDG_CONFIG_HOME=/home/junyi/ankiconfig inkscape'

# alias matlab='unset GTK_MODULES && env MESA_LOADER_DRIVER_OVERRIDE=i965 && matlab'
# alias matlab='screen -S matlab -m sh -c "/opt/MATLAB/R2018a/bin/matlab -nodesktop -nosplash"'
alias mrun="env MESA_LOADER_DRIVER_OVERRIDE=iHD matlab -nodesktop -nosplash -logfile `date +%Y_%m_%d-%H_%M_%S`.log -r"
# matlab tmux 布局
alias tmatlab='tmux -f ~/.tmux/scripting/matlab.conf attach'

alias weather='curl wttr.in'
# youtube-dl and you-get
alias yd='youtube-dl --write-auto-sub --sub-lang en'
alias yden='youtube-dl --write-sub --sub-lang en'
alias ydcn='youtube-dl --write-sub --sub-lang zh-CN'
alias y='yt-dlp'

alias mkcd='foo(){ mkdir -p "$1"; cd "$1"  }; foo '
alias rd='rmdir'
alias u='chevereto_upload.py -c ~/.config/chevereto/config.json -s'

alias sagenotes='cd ~/Desktop/learning/learning_python3/sage_files && jupyter lab --no-browser'
alias jl='julia --startup-file=no --quiet'
gvimt(){ command gvim --remote-tab-silent $@ || command gvim $@; }
alias jc='journalctl'
alias jcu='journalctl --user'
alias sc='systemctl'
alias sc-hibernate='systemctl hibernate'
alias sc-suspend-then-hibernate='systemctl suspend-then-hibernate'
alias sc-suspend='systemctl suspend'


# edit
# https://bbs.archlinux.org/viewtopic.php?id=240765 edit 要用 /usr/bin/systemctl 绝对路径
alias sce='sudo -E /usr/bin/systemctl edit --full'
alias scu='systemctl --user'
# edit
alias scue='/usr/bin/systemctl --user edit --full'

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

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

alias unzip='unzip -O GBK'

alias svi='sudo -E vim --cmd "let g:SUDO=1" --cmd "let g:isPlain=1" '
# 088.987  000.001: --- VIM STARTED --- 启动 只需要 88 毫秒
alias vi='vim --cmd "let g:isPlain=1"'
# alias vim='vim --cmd "let g:CoC=1" --cmd "let g:isPlain=0"'
alias vim='vim --cmd "let g:isPlain=0"'
alias nvim='vim --cmd "let g:CoC=1" --cmd "let g:isPlain=0"'
# alias nvim='nvim --cmd "let g:isPlain=0"'
# 打开到 上一次 打开的地方
alias lvi='vi -c "normal '\''0"'

# For git front-end: vim-fugitive
alias vig='vi --cmd "let g:usingGit=1" -c "G" -c "only"'
alias vit='vim --servername TEX'
alias gvit='gvim --servername TEX --cmd "let g:isPlain=0"'
alias vitv='vim --servername TEX -c 'VimtexView''
alias gvitv='gvim --servername TEX --cmd "let g:isPlain=0" -c 'VimtexView''
alias testtex="cd ~/Desktop/university/testtex && gvim --servername TEX --cmd "let g:isPlain=0" -c 'VimtexView' main.tex"
# 打开 jupyter qtconsole
alias jvi="vim -c JupyterConnect"
# alias jvi="jupyter qtconsole& ; vim -c JupyterConnect"

# Show open ports
# alias ports='netstat -tulanp'
alias ports='netstat -lntp'

# alias ssh='ssh -Y'
alias sshphone='ssh -p8022 _gateway'
alias pb='curl -F sunset=1200 -F "c=@-" "http://8.140.148.238:10002"'


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

# git
alias gpp='git add . && git commit -m "update" && git push'
alias gc1='git clone --depth=1 '
alias gtree="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ad)%Creset'"
alias gxtree="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%an%Creset: %s %Cblue(%ar)%Creset'"
alias greftree="git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=iso"
alias grefxtree="git reflog --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %Cgreen%gn%Creset: %gs %Cblue(%gd)%Creset' --date=relative"
alias gfetched-xtree='git xtree @{1}..'

if [[ -f /proc/version ]]
then
if grep -q "archlinux" /proc/version
    then
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
elif grep -q "debian" /proc/version
then
	alias Syu='sudo apt update && apt upgrade'
	alias S='sudo apt install'
	alias Si='apt show'
	alias Ss='apt search'
	alias R='sudo apt remove'
fi
else
	# for termux
	alias S='pkg install'
	alias Ss='pkg search'
fi

alias rsync-copy="rsync -avz --progress -h --exclude=__pycache__"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h --exclude=__pycache__"
alias rsync-synchronize="rsync -avzu --delete --progress -h --exclude=__pycache__"
alias git-ls="\\ls -A --group-directories-first -1 | while IFS= read -r line; do git log --color --format=\"\$(\\ls -d -F --color \"\$line\") =} %C(bold black)▏%Creset%Cred%h %Cgreen(%cr)%Creset =} %C(bold black)▏%Creset%s %C(bold blue)<%an>%Creset\" --abbrev-commit --max-count 1 HEAD -- \"\$line\"; done | awk -F'=}' '{ nf[NR]=NF; for (i = 1; i <= NF; i++) { cell[NR,i] = \$i; gsub(/\\033\\[([[:digit:]]+(;[[:digit:]]+)*)?[mK]/, \"\", \$i); len[NR,i] = l = length(\$i); if (l > max[i]) max[i] = l; } } END { for (row = 1; row <= NR; row++) { for (col = 1; col < nf[row]; col++) printf \"%s%*s%s\", cell[row,col], max[col]-len[row,col], \"\", OFS; print cell[row,nf[row]]; } }'"
alias 1='cd -'
