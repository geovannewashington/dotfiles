#!/bin/bash

# Cron jobs run in a headless, minimal environment, so we need to manually set a few environment variables so they can access the graphical session and audio server.

# Load enviroment variables from session
source ~/.session_env

SOUND="/home/tpose/media/audios/sfx/simple-notif.wav"

TITLE="$1"
MESSAGE="$2"
ICON="/home/tpose/media/images/script-icons/$3"

# --expire-time=600000ms = 10 minutes
notify-send --icon="$ICON" --expire-time=600000 "$TITLE" "$MESSAGE"
paplay "$SOUND"
