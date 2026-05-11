#!/usr/bin/env bash

# Generates symlink from dotfiles config.d folder to its 
# expected location. Still unsure if this is even needed here
# or if it should be in the obsiddy directory itself.

OBSIDIAN_REPO_PATH="$HOME/git/obsiddy"
OBSIDIAN_CONFD="$OBSIDIAN_REPO_PATH/.obsidian"
OBSIDIAN_BINARY="/opt/Obsidian/obsidian"

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

# by default obsidian binary is installed in WSL2 `/opt/Obsidian`
# so we need to symlink `/opt/Obsidian/obsidian` to our local $USER bin
echo -e "\nSymlinking Obsidian WSL2 Binary:\t ln -srf \"$OBSIDIAN_BINARY\"  \"$HOME/.local/bin/\""
ln -srf "$OBSIDIAN_BINARY"  "$HOME/.local/bin/"

# and well also just create an alias while were at it
alias ob="obsidian"

# @NOTE: The obsidian binary launches the desktop application in an Ubunutu GUI on your Windows machine
