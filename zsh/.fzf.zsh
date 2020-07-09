# Setup fzf
# ---------
if [[ ! "$PATH" == */home/junyi/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/junyi/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/junyi/.vim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/junyi/.vim/plugged/fzf/shell/key-bindings.zsh"
