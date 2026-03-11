
# Creates symlink from selected dircolors theme to ~/.dircolors

DIRCOLORS_CONFD="$HOME/dotfiles/config.d/dircolors"
SET_THEME="nord"
THEME_FILE="dir_colors.$SET_THEME"

find $DIRCOLORS_CONFD  -maxdepth 1 -mindepth 0 -type f -name "$THEME_FILE" | \
	xargs -I "{}" ln -sfr "{}" "$HOME/.dir_colors"
	#xargs -I "{}" echo ln -sf "{}" "$HOME/.dir_colors"


echo -e "\nDircolors symlink updated to reference:\t$THEME_FILE"
