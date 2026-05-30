#!/usr/bin/env bash

# SYMLINK VARIABLES
DOTFILE_STEM="$HOME/dotfiles"

# path to version controlled dotfiles bashrc file
#BASHRC_INIT_RELPATH="utils.d/init.bashrc"
BASHRC_SRC_RELPATH="bash.d/bashrc"
SYML_SRC="$DOTFILE_STEM/$BASHRC_SRC_RELPATH"
SYML_TARG="$HOME/.bashrc"


# Make backup for current file before overwriting
# @TODO: Logic that renames current bashrc file with a ".bk" extension before making the symlink
# <logic here>
if [[ -f "$SYML_TARG" ]]; then
	TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"
	cp -v "$SYML_TARG" "$SYML_TARG.$TIMESTAMP.bk"
	# most recent backup will take the form "<filename>.bk"
	mv -v "$SYML_TARG" "$SYML_TARG.bk"
fi

# make forceful symlink to bashrc from dotfiles
ln -s "$SYML_SRC" "$SYML_TARG" 2> /dev/null

# show created symlink in terminal
echo -e "\nCreated symlink:"
ls -la "$SYML_TARG" | grep '^l' | awk '{print $9, $10, $11}'
