#!/usr/bin/env bash

# Script generates symlinks for cheat config folder and the cheatfile root directory for all my version controlled cheatsheets

DOTFILES_HOME="$HOME/dotfiles"
CONFIGD_CHEAT_DIR="$DOTFILES_HOME/config.d/cheat"
SYML_TARG="$HOME/.config/cheat"


# archive existing symlink, but dont if its a directory
if [[ -h "$SYML_TARG" ]]; then
	# archive old pointer before overwriting
	mv  "$SYML_TARG" "$SYML_TARG.prev"
fi

# create symlink if missing
if [[ ! -d "$SYML_TARG" ]]; then
	ln -s "$CONFIGD_CHEAT_DIR" "$SYML_TARG"
	echo "Created symlink:  $CONFIGD_CHEAT_DIR  >>  $SYML_TARG"
else
	echo "\"$SYML_TARG\" directory already exists and will not be overwritten"
fi

# remove nested symlink
if [[ -e "$CONFIGD_CHEAT_DIR/cheat" ]]; then
	rm -v "$CONFIGD_CHEAT_DIR/cheat" 
fi
