#!/usr/bin/env bash

DOTFILE_STEM="$HOME/dotfiles"
LOCAL_CONFIG="$HOME/.config"
DOTFILE_DIRPATHS=$(find ~+ -maxdepth 1 -type d | egrep "\.d$" | egrep -v "ansibl|conf")
for d in ${DOTFILE_DIRPATHS[@]}; do 

	dirname=$(basename $d | cut -f 1 -d '.')
	#echo $d
	#echo $dirname 
	#echo ln -s "$d" "$LOCAL_CONFIG/$dirname"
	ln -s "$d" "$LOCAL_CONFIG/$dirname" 2>/dev/null || echo "Error occurred when trying to create \"$d\" symlink" && echo ""
	#echo "Created symlink: \"$d\""
done

# show changes
echo "XDG_CONFIG directory after creating new batch of symlinks:"
echo ""
ls -la "$LOCAL_CONFIG" | grep '^l' | awk '{print $9, $10, $11}'
