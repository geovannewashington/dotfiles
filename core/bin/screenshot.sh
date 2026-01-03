#!/usr/bin/env bash

# Directories
CROPPED_DIR="$HOME/media/images/screenshots/cropped"
FULL_DIR="$HOME/media/images/screenshots/full"

# Prompt via Rofi
CHOICE=$(echo -e "Selection\nFull\nClipboard (Selection)\nClipboard (Full)" | rofi -no-config -dmenu -p "Screenshot type:")
if [ -z "$CHOICE" ]; then
    notify-send "Choice not selected" "Program closed"
    exit 0
fi

# Optional delay input via rofi
DELAY=$(rofi -no-config -dmenu -p "Delay in seconds (0 for none):")
if [ -z "$DELAY" ]; then
    notify-send "Delay not selected" "Program closed"
    exit 0
fi

# Ask for filename
NAME=$(rofi -no-config -dmenu -p "Filename (leave blank for timestamp):")

# Fallback to timestamp if no name
if [[ "$CHOICE" != *Clipboard* ]]; then
    if [ -n "$NAME" ]; then
        case "$NAME" in
        *.png) ;;
        *) NAME="${NAME}.png" ;;
        esac
    else
        NAME="screenshot$(date '+%Y-%m-%d_%H-%M-%S').png"
    fi
fi

# Delay function
if [ "$DELAY" -gt 0 ]; then
    sleep "$DELAY"
fi

# Take screenshot based on selection
case "$CHOICE" in
"Selection")
    slurp_area=$(slurp)
    grim -g "$slurp_area" "$CROPPED_DIR/$NAME"
    notify-send "Screenshot saved (Selection)" "$CROPPED_DIR/$NAME"
    ;;
"Full")
    grim "$FULL_DIR/$NAME"
    notify-send "Screenshot saved (Full)" "$FULL_DIR/$NAME"
    ;;
"Clipboard (Selection)")
    slurp_area=$(slurp)
    grim -g "$slurp_area" - | wl-copy
    notify-send "Screenshot copied to clipboard (Selection)"
    ;;
"Clipboard (Full)")
    grim - | wl-copy
    notify-send "Screenshot copied to clipboard (Full)"
    ;;
*)
    notify-send "Screenshot cancelled"
    exit 1
    ;;
esac
