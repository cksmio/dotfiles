# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vicc/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/vicc/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vicc/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/vicc/.fzf/shell/key-bindings.bash"
