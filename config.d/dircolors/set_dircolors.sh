
# Creates symlink from selected dircolors theme to ~/.dircolors

DIRCOLORS_CONFD="$HOME/dotfiles/config.d/dircolors"
SET_THEME="nord"
THEME_FILE="dircolors_$SET_THEME"

find $DIRCOLORS_CONFD  -maxdepth 1 -mindepth 0 -type f -name "$THEME_FILE" | \
	xargs -I "{}" ln -sf "{}" "$HOME/.dircolors"
	#xargs -I "{}" echo ln -sf "{}" "$HOME/.dircolors"


echo -e "\nDircolors symlink updated to reference:\t$THEME_FILE"
