#!/usr/bin/env bash

# SYMLINK VARIABLES
DOTFILE_STEM="$HOME/dotfiles"
# path to minimal bashrc version control file
BASHRC_INIT_RELPATH="utils.d/init.bashrc"
SYML_SRC="$DOTFILE_STEM/$BASHRC_INIT_RELPATH"
SYML_TARG="$HOME/.bashrc"


# Make backup for current file before overwriting
# @TODO: Logic that renames current bashrc file with a ".bk" extension before making the symlink
# <logic here>

# make forceful symlink to bashrc from dotfiles
ln -sf "$SYML_SRC" "$SYML_TARG" 2> /dev/null

# show created symlink in terminal
echo "Created symlink:"
echo ""
ls -la "$SYML_TARG" | grep '^l' | awk '{print $9, $10, $11}'
