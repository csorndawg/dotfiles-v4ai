#!/usr/bin/env bash

# Script creates a symlink folder "cheatsheets" from my version controlled cheatfiles ("cheatfiles-2026") folder. This is needed b/c the config.yml expects the cheatfiles to be stored in a folder named "cheatsheets" and it expects the folder to be in the "dotfiles/config.d/cheat/" directory.

DOTFILES_HOME="$HOME/dotfiles"
CONFIGD_CHEAT_DIR="$DOTFILES_HOME/config.d/cheat"
VC_CHEATFILES_DIR="$CONFIGD_CHEAT_DIR/cheatfiles-2026"
CONFIGD_CHEAT_SYML_TARG="$CONFIGD_CHEAT_DIR/cheatsheets"

# make symlink
ln -sf "$VC_CHEATFILES_DIR" "$CONFIGD_CHEAT_SYML_TARG"
echo "Created symlink:  $CONFIGD_CHEAT_SYML_TARG"
