#!/usr/bin/env bash


NVIM_DIR="$HOME/dotfiles/nvim.d"
LOCAL_CONFIG_DIR="$HOME/.config"

echo Creating Symlink: ln -sf "$NVIM_DIR" "$LOCAL_CONFIG_DIR/nvim"
ln -sf "$NVIM_DIR" "$LOCAL_CONFIG_DIR/nvim"
