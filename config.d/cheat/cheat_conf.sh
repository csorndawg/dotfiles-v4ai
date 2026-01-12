# Shell-Related Configurations for CHEAT CLI tool

# use fzf for selecting cheatfiles
export CHEAT_USE_FZF=true

# source autocompletion script for current shell
export CHEAT_CONFIG_DIR="$HOME/.config/cheat"
export isZshShell="$(echo $0 | egrep "\-zsh" -c)"
if (($isZshShell > 0)); then
	source "$CHEAT_CONFIG_DIR/cheat.zsh"
else
	source "$CHEAT_CONFIG_DIR/cheat.bash"
fi

