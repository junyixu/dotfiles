# Setup fzf
# ---------
if [[ ! "$PATH" == */home/junyi/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/junyi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/junyi/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/junyi/.fzf/shell/key-bindings.zsh"
