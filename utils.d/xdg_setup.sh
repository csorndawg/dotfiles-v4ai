#!/usr/bin/env bash

export XDG_DATA_DIR="/usr/local/share/:/usr/share/:/opt/user/data:/srv/apps:/srv/var"
export XDG_DATA_HOME="$HOME/.local/data"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_RUNTIME_HOME="$HOME/.local/runtime"

mkdir -pv "$XDG_DATA_HOME"
mkdir -pv "$XDG_CONFIG_HOME"
mkdir -pv "$XDG_CACHE_HOME"
mkdir -pv "$XDG_BIN_HOME"
mkdir -pv "$XDG_RUNTIME_HOME"

# TODO: add loop that splits on ":" and mkdir for each item
