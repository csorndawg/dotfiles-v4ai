#!/usr/bin/env bash

# Generates symlink from dotfiles config.d folder to its 
# expected location (as per IPython docs)

DOTFILES_HOME="$HOME/dotfiles"
CONFIGD_DIR="$DOTFILES_HOME/config.d/ipython"
SYML_TARG="$HOME/.ipython"

# archive existing symlink if its a file
# skip archiving if its a directory
if [[ -h "$SYML_TARG" ]]; then
	# archive old pointer before overwriting
	mv  "$SYML_TARG" "$SYML_TARG.prev"
fi

# create symlink from dotfiles config.d to local expected location
if [[ ! -d "$SYML_TARG" ]]; then
	ln -s "$CONFIGD_DIR" "$SYML_TARG"
	echo -e "\nCreated symlink:\t \"$CONFIGD_DIR\"  >>  \"$SYML_TARG\""
else
	echo -e "\n\"$SYML_TARG\" directory already exists and will not be overwritten"
fi

# remove nested symlink
if [[ -e "$CONFIGD_DIR/ipython" ]]; then
	rm -v "$CONFIGD_DIR/ipython" 
fi
