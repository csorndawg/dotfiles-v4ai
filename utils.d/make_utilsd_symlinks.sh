#!/usr/bin/env bash

# VARIABLES
DOTFILE_STEM="$HOME/dotfiles"
UTILSD_RGX="\.rc"
UTILSD_IGNR='ignore(me)?|test|experiment|\.sw[ap]$'
SYML_TARG="$HOME/.local/bin"


# List of files to make LOCAL_BIN symlinks
rcModules=$(find "$DOTFILE_STEM/utils.d" -maxdepth 1 -type f | egrep "$UTILSD_RGX" | egrep -v "$UTILSD_IGNR")

# iterate over list of files and make symlink unless its an ignored file
for rcmod in ${rcModules[@]}; do 

	name="$(basename "$rcmod")"

	ignoreMe="$(echo "$name" | egrep -c "$UTILSD_IGNR")"
	if (($ignoreMe < 0)); then
		continue
	fi

	# remove comment below for debugging 
	ln -s "$rcmod" "$SYML_TARG/$name" >> /dev/null 2>&1 #|| echo "Error occurred when trying to create \"$name\" symlink" && echo ""
done

# show symlinks in terminal for confirmation
echo "XDG_BIN directory after creating runtime config symlinks:"
echo "" 
ls -la "$SYML_TARG" | grep '^l' | awk '{print $9, $10, $11}'
