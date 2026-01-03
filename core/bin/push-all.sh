#!/usr/bin/env bash

# Add changes, commit, and push for each repo

# -- Notes
cd ~/knowledge/notes
git add .
git commit -m "Auto backup: $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main
