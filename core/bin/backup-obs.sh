#!/usr/bin/env bash
set -e

SRC="$HOME/.var/app/com.obsproject.Studio/config/obs-studio"
DST="$HOME/utils/backups/obs"

mkdir -p "$DST"

# Sanity check
[ -d "$SRC" ] || { echo "OBS Flatpak config not found"; exit 1; }

# Copy core config
rsync -av \
    --exclude 'logs/' \
    --exclude 'profiler_data/' \
    --exclude 'safe_mode/' \
    "$SRC/basic/" "$DST/basic/"

# Global files (may not all exist)
for f in global.ini user.ini; do
    [ -f "$SRC/$f" ] && cp "$SRC/$f" "$DST/"
done

# Plugins
[ -d "$SRC/plugin_config" ] && rsync -av "$SRC/plugin_config/" "$DST/plugin_config/"
[ -d "$SRC/plugins" ] && rsync -av "$SRC/plugins/" "$DST/plugins/"

# Git commit & push
cd "$DST"
git add .
git commit -m "OBS backup: $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main
