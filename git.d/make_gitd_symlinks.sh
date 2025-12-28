#!/usr/bin/env bash

DOTFILES_HOME="$HOME/dotfiles"
GITFILES=$(find  "$DOTFILES_HOME/git.d" -maxdepth 1 -type f | egrep -v "git.d\/[a-z]+\.")
for f in ${GITFILES[@]}; do
	fname="$(basename $f)"
	echo ""
       	#echo ln -s $f "$HOME/.$fname"
       	ln -fs $f "$HOME/.$fname"
	echo "Created symlink:  $f  -->  \"$HOME/.$fname\""
done
