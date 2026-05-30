#!/usr/bin/env bash

# Makes symlinks for <<FILL LATER>>
# 
#


# VARIABLES
DOTFILE_STEM="$HOME/dotfiles"
UTILSD_RGX="\.rc"
UTILSD_IGNR='ignore(me)?|test|experiment|\.sw[ap]$'
SYML_TARG="$HOME/.local/bin"

# echo info
echo -e "\nGenerating dotfiles 'utils.d' symlinks"  &&  echo "Symlink Target Directory:  $SYML_TARG"

# List of files to make LOCAL_BIN symlinks
rcModules=$(find "$DOTFILE_STEM/utils.d" -maxdepth 1 -type f | egrep "$UTILSD_RGX" | egrep -v "$UTILSD_IGNR")

# iterate over list of files and make symlink unless its an ignored file
for rcmod in ${rcModules[@]}; do 

	name="$(basename "$rcmod")"
	ignoreMe="$(echo "$name" | egrep -c "$UTILSD_IGNR")"
	if (($ignoreMe < 0)); then
		continue
	fi
	# remove below comment to debug
	ln -s "$rcmod" "$SYML_TARG/$name" >> /dev/null 2>&1 #|| echo "Error occurred when trying to create \"$name\" symlink" && echo ""
done

# create LOCAL_BIN symlink if it exists
[[ -d "$HOME/.local/bin" ]] && \
  ln -sf "$HOME/.local/bin" "$HOME/bin"

# show symlinks in terminal for confirmation
# show all symlinks pointers in the $SYML_TARG folder 
echo -e "\nTarget directory after creating symlinks:"
ls -la "$SYML_TARG" | grep '^l' | awk '{print $9, $10, $11}' | while read -r slink; do
    echo -e "\t$slink"
done
