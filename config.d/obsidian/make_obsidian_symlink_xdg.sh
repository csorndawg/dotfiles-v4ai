#!/usr/bin/env bash

# Generates symlink from dotfiles config.d folder to its 
# expected location. Still unsure if this is even needed here
# or if it should be in the obsiddy directory itself.

OBSIDIAN_REPO_PATH="$HOME/git/obsiddy"
OBSIDIAN_CONFD="$OBSIDIAN_REPO_PATH/.obsidian"

# symlink source and target
CONFIGD_DIR="$OBSIDIAN_CONFD"
SYML_TARG="$HOME/.config/obsidian"

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

# # remove nested symlink
# if [[ -e "$CONFIGD_DIR/obsidian" ]]; then
# 	rm -v "$CONFIGD_DIR/obsidian" 
# fi
