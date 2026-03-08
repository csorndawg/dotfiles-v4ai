# BASHRC submodule 
#
# Contains configuration for user installed software, scripts, jobs, etc. 
#
# Things with lots of configuration code (e.g. FZF) will be moved into their own 
# submodule and sourced through this script (which will be sourced by main BASHRC module). 
# This will avoid bloat, and make the code easy to maintain.
#


#################################
# Dependencies 
#################################

DOTFILES_DIR="$HOME/dotfiles"
CONFIGD_DIR="$DOTFILES_DIR/config.d"
#BASHD_DIR="$DOTFILES_DIR/bash.d"
#TMUX_DIR="$DOTFILES_DIR/tmux.d"


#################################
# Generic 
################################


## FZF 

# FZF config
source "$CONFIGD_DIR/fzf/fzf.main" 1> /dev/null



## CHEAT 

# creates dotfile symlinks for CHEAT expected files and folders 
bash "$CONFIGD_DIR/cheat/make_xdgconfig_cheat_symlink.sh" 1> /dev/null
bash "$CONFIGD_DIR/cheat/make_cheat_repo_symlink.sh" 1> /dev/null

# generate conf.yml with users $HOME populated in cheatfile paths
CHEAT_CONF="$HOME/.config/cheat/conf.yml"
CHEAT_CONF_TEMPLATE="$CHEAT_CONF.tmpl"
envsubst < "$CHEAT_CONF_TEMPLATE" > "$CHEAT_CONF"


################################
# Overrides/Patches 
#################################

