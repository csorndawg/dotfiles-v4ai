#!/usr/bin/env bash

DOTFILE_STEM="$HOME/dotfiles"
LOCAL_CONFIG="$HOME/.config"
DOTFILE_DIRPATHS=$(find ~+ -maxdepth 1 -type d | egrep "\.d$" | egrep -v "ansibl|conf")
for d in ${DOTFILE_DIRPATHS[@]}; do 

	dirname=$(basename $d | cut -f 1 -d '.')
	echo "" 
	#echo $d
	#echo $dirname 
	#echo ln -s "$d" "$LOCAL_CONFIG/$dirname"
	ln -s "$d" "$LOCAL_CONFIG/$dirname"
	echo "Created symlink: $d  -->  \"$LOCAL_CONFIG/$dirname\""
done
echo "Local config directory after creating symlinks"
ls -la ~/.config/
