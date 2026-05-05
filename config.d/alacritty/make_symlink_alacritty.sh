# Symlink from your dotfiles into the Windows AppData path

WIN_USER="zaccs"
ALACRITTY_DOTFILES="$HOME/dotfiles/config.d/alacritty/alacritty.toml"
ALACRITTY_SYML_TARG="/mnt/c/Users/$WIN_USER/AppData/Roaming/alacritty/alacritty.toml"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ALACRITTY_BACKUP_PATH="$ALACRITTY_SYML_TARG.bk.$TIMESTAMP"

echo -e "\nAlacritty Dotfiles:\t$ALACRITTY_DOTFILES"
echo -e "Alacritty Symlink Target:\t$ALACRITTY_SYML_TARG"
echo -e "Alacritty Symlink Backup:\t$ALACRITTY_BACKUP_PATH"

if [ -L $ALACRITTY_SYML_TARG ]; then
	echo -e "Backing up current $ALACRITTY_DOTFILES file...\n"
  cat "$ALACRITTY_SYML_TARG" | tee "$ALACRITTY_BACKUP_PATH"
fi

# ln -sf "$ALACRITTY_DOTFILES" "$ALACRITTY_SYML_TARG"
echo -e "Dotfile Sync Command:\t cat \"$ALACRITTY_DOTFILES\" | tee \"$ALACRITTY_SYML_TARG\""
cat "$ALACRITTY_DOTFILES" | sudo tee "$ALACRITTY_SYML_TARG" 1> /dev/null
