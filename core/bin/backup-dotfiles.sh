#!/bin/sh
set -eu

HOME=/home/tpose
DST=/home/tpose/utils/backups/dotfiles
LOG_DIR=/home/tpose/utils/logs
LOG_FILE=$LOG_DIR/backup-dotfiles.log
RSYNC_DELETE_OPTS="--delete --exclude=README.md --exclude=README --exclude=.git --exclude=*.md"

# Ensure directories exist
mkdir -p "$DST/packages" "$LOG_DIR"

log() {
    echo "[$(date +'%F %T')] $*" >>"$LOG_FILE"
}

log "==== Backup started ===="

# Package lists
pacman -Qqe >"$DST/packages/pacman.txt"
pacman -Qqm >"$DST/packages/aur.txt"
log "Package lists updated"

# Functions to sync directories and files
sync_dir() {
    src="$1"
    dst="$2"
    mkdir -p "$DST/$dst"
    rsync -a $RSYNC_DELETE_OPTS "$HOME/$src/" "$DST/$dst/"

    log "Synced directory $src -> $dst"
}

sync_file() {
    src="$1"
    dst="$2"
    mkdir -p "$(dirname "$DST/$dst")"
    if [ "${src#/}" != "$src" ]; then
        # absolute path
        rsync -a "$src" "$DST/$dst"
    else
        rsync -a "$HOME/$src" "$DST/$dst"
    fi
    log "Synced file $src -> $dst"
}

# Dotfiles
sync_dir ".config/alacritty" "alacritty"
sync_dir ".config/sway" "sway"
sync_dir ".config/rofi" "rofi"
sync_dir ".config/dunst" "dunst"
sync_dir ".config/nvim" "nvim"
sync_dir "core/bin" "core/bin"
sync_dir ".config/tmux" "tmux"
sync_dir ".config/i3blocks" "i3blocks"
sync_dir ".config/zathura" "zathura"
sync_dir ".themes" "gtk/themes"
sync_dir ".config/gtk-3.0" "gtk/gtk-3.0"
sync_dir ".config/xdg-desktop-portal" "xdg-desktop-portal"

PROFILE=$(find "$HOME/.mozilla/firefox" -maxdepth 1 -type d -name '*.default-release' | head -n1)
[ -f "$PROFILE/user.js" ] && sync_file "$PROFILE/user.js" "firefox/user.js"

sync_dir ".config/spicetify" "spicetify/config/spicetify"
sync_dir ".spicetify" "spicetify/spicetify"

sync_dir "core/env" "zsh/env"
sync_file ".zshrc" "zsh/zshrc"
sync_file ".zprofile" "zsh/zprofile"
sync_file ".session_env" "zsh/session.env"

# Keyd system config
# sudo rsync -a --delete /etc/keyd/ "$DST/keyd/"
# log "Synced /etc/keyd -> keyd"

# Cron jobs
mkdir -p "$DST/cronie"
crontab -l >"$DST/cronie/user-crontab.txt" || log "No user crontab"

# Commit changes to git
cd "$DST"
git add .
git commit -m "backup $(date +%F)" || log "No changes to commit"
git push origin main || log "Git push failed"

log "==== Backup finished ===="
echo >>"$LOG_FILE"
