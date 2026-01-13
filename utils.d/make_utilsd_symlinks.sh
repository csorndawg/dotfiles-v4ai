#!/usr/bin/env bash

DOTFILE_STEM="$HOME/dotfiles"
UTILSD_RGX="\.rc"
UTILSD_IGNR='ignore(me)?|test|experiment'
SYML_TARG="$HOME/.local/bin"

echo find "$DOTFILE_STEM/utils.d" -maxdepth 1 -type f | egrep "$UTILSD_RGX" | egrep -v "$UTILSD_IGNR"
find "$DOTFILE_STEM/utils.d" -maxdepth 1 -type f | egrep "$UTILSD_RGX" | egrep -v "$UTILSD_IGNR"

rcModules=$(find "$DOTFILE_STEM/utils.d" -maxdepth 1 -type f | egrep "$UTILSD_RGX" | egrep -v "$UTILSD_IGNR")
echo $rcModules
for rcmod in ${rcModules[@]}; do 

	name="$(basename "$rcmod")"

	#echo $rcmod
	#echo $name 
	echo ln -sf "$rcmod" "$SYML_TARG/$name"
	ln -sf "$rcmod" "$SYML_TARG/$name" 1>/dev/null
	echo "Created symlink: $rcmod  -->  \"$SYML_TARG/$name\""
	echo ""
done
echo "Runtime config submodules symlinks have been created."
ls -la "$SYML_TARG" 

