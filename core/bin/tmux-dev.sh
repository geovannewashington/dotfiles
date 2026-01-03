#!/bin/bash

tmux new-session -s 'tpose' -n nvim 'cd ~/dev/playgrounds && nvim; zsh' \;\
     new-window -n home 'cd ~/ && zsh' \;\
     new-window -n mpv-song 'cd ~/media/streaming/assets/audio/bg-music && (mpv --loop=inf --volume=55 rainy-40s.wav || true); zsh' \;\
     new-window -n misc 'cd ~/knowledge/notes/ && zsh' \;\
     select-window -t 0
