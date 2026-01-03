# -- aliases.zsh

# Open one or more files selected via fzf (with bat preview) in your default editor
alias ov='selected=$(fzf -m --preview="bat --color=always {}") && [ -n "$selected" ] && $EDITOR $selected'

# Play one or more selected audio files via fzf with ffprobe preview
alias play='files=($(find . -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.ogg" \) | fzf -m --preview="ffprobe -v error -show_entries format=duration:format_tags=title -of default=noprint_wrappers=1:nokey=1 {} 2>/dev/null")) && [ ${#files[@]} -gt 0 ] && mpv "${files[@]}"'

# changes default location of tmux's config file in order to avoid cluttering home directory
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

# Open one or more selected PDF files via fzf with a preview (using `pdftotext` for preview)
alias readpdf='files=($(find . -type f -iname "*.pdf" | fzf -m --preview="pdftotext {} - | head -n 30")) && [ ${#files[@]} -gt 0 ] && nohup zathura "${files[@]}" >/dev/null 2>&1 & disown'

alias f='fzf'
alias v='$EDITOR'
alias vim='$EDITOR'
alias c='clear'
alias path='printf "%s\n" ${(s.:.)PATH}'
