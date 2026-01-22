#!/usr/bin/env bash

# set env. variables
DOTFILES_HOME="$HOME/dotfiles"
SRC_FILE="tmux.d/tmux.conf"
SRC_PATH="$DOTFILES_HOME/$SRC_FILE"
SRC_DIR="$(dirname $SRC_PATH)"

echo "Source Path: $SRC_PATH"
echo "Source Path Dir: $SRC_DIR"
# now set downstream target for symlink
TARG_PATH="$HOME/.config/tmux"
TARG_DIR="$(dirname "$TARG_PATH")"

# make symlink dotfiles/tmux.d --> XDG_CONFIG symlink
echo ""
if [ -d  "$(dirname "$TARG_PATH")" ]; then
	#mv -vf "$TARG_PATH" "$TARG_PATH.ark"
	ln -sf "$TARG_PATH" "$TARG_PATH"
else
	echo "No "XDG_CONFIG/tmux" folder exists. Creating symlink from dotfiles to local config."
	ln -sf "$TARG_PATH" "$TARG_PATH"
echo "Creating symlink:    $SRC_PATH --> $TARG_PATH"
fi

# ceates symlink: dotfiles/tmux.d/tmux.conf TMUX.conf  >>  $HOME/.tmux.conf
SRC_PATH="$DOTFILES_HOME/tmux.d/tmux.conf"
TARG_PATH="$HOME/.tmux.conf"
if [ -f  "$TARG_PATH" ]; then
	mv -vf "$TARG_PATH" "$TARG_PATH.ark" 
	ln -sf "$SRC_PATH" "$TARG_PATH"
else
	echo "No '~/.tmux.conf' file exists. Creating symlink from 'dotfiles/tmux.d/tmux.conf' to $USER/.tmux.conf"
	ln -sf "$SRC_PATH" "$TARG_PATH"
echo "Created symlink:    $SRC_PATH --> $TARG_PATH"
fi

# after generating requried/necessary symlinks 
TMUX_DEPENDS_SCRIPT="$DOTFILES_HOME/tmux.d/tmux_conf_dependencies.sh"
echo Running: "bash \"$TMUX_DEPENDS_SCRIPT\""
bash "$TMUX_DEPENDS_SCRIPT"

# clean up extra symlink thats created on accident
SYML_PATH="$DOTFILES_HOME/tmux.d/tmux"
rm -v "$SYML_PATH"
echo "Removed extra, self-referencing symlink"
