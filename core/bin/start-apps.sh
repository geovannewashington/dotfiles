#!/bin/bash

# Let Sway fully load
sleep 2

# Open Firefox
swaymsg workspace 1
swaymsg exec "firefox https://pomofocus.io/ &"
sleep 5

# Open Alacritty and start mux session
swaymsg workspace 2
swaymsg exec "alacritty -e zsh -c '$HOME/core/bin/tmux-dev.sh' &"
sleep 2

# Open Anki (flatpak)
swaymsg workspace 4
swaymsg exec "flatpak run net.ankiweb.Anki &"
sleep 5

# Open Discord
swaymsg workspace 5
swaymsg exec "discord &"
