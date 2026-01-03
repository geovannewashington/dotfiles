## - exports.zsh

# XDG data directory
export XDG_DATA_HOME="${HOME}/.local/share"

# Zsh history location
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# bat theme
export BAT_THEME="Coldark-Dark"

# Default editor
export EDITOR="nvim"

# Neovim man pager
export MANPAGER="nvim +Man!"

# fzf vim-style keybinds
export FZF_DEFAULT_OPTS='--bind=ctrl-j:down,ctrl-k:up,ctrl-h:backward-char,ctrl-l:forward-char'

# Node.js REPL history
export NODE_REPL_HISTORY=~/.local/share/node_repl_history

# C compiler
export CC=clang

# GTK Theme
export GTK_THEME="Flat-Remix-GTK-Blue-Darkest-Solid"
