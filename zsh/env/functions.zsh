# -- functions.zsh

[[ -o interactive ]] || return

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
