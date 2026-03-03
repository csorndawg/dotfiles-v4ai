#!/usr/bin/env bash

# Script configures CONFIG.D symlinks to XDG_LOCAL_CONFIG dir

# add config.d subfolder pattern here to ignore/skip symlin
IGNORE_RGX='venv|alacritty'
CONFIGD_DIR="$HOME/dotfiles/config.d"
SYMLINK_SOURCES=$(find $CONFIGD_DIR -maxdepth 1 -mindepth 1 -type d | egrep -v "$IGNORE_RGX")

for src in ${SYMLINK_SOURCES[@]}; do 

	dirname=$(basename $src | cut -f 1 -d '.')
	TARGET_PATH="$HOME/.config/$dirname"
	ln -s "$src" "$TARGET_PATH" #2>/dev/null || echo "Error unable to create \"$d\" symlink"
done

echo "Local config ($HOME/.config) after symlinks:"
ls -la "$HOME/.config" | grep '^l' | awk '{print $9, $10, $11}'

