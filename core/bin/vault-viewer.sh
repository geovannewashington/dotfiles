#!/usr/bin/env bash
# vault-viewer: mount -> open minimal GUI file manager -> unmount on exit
set -euo pipefail

CRYPT_DIR="$HOME/archive/life/.encrypted-vault/"
MOUNT_POINT="$HOME/archive/life/.vault/"

mkdir -p "$CRYPT_DIR" "$MOUNT_POINT"

# mount (asks for passphrase)
gocryptfs "$CRYPT_DIR" "$MOUNT_POINT"

thunar "$MOUNT_POINT"

# unmount after closing the file manager
fusermount -u "$MOUNT_POINT" || umount "$MOUNT_POINT"
