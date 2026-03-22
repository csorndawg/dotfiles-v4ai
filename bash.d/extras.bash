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
BASHD_DIR="$DOTFILES_DIR/bash.d"
NVIMD_DIR="$DOTFILES_DIR/nvim.d"
VIMD_DIR="$DOTFILES_DIR/vim.d"
#TMUX_DIR="$DOTFILES_DIR/tmux.d"


#################################
# Generic 
################################

# ------------------------------
# GIT 
# ------------------------------

# ensure Git shell completion scipts are loaded (assumes Ubuntu)
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

# reenable default completion for custom git aliases

## checkout
__git_complete gco _git_checkout
## diff
__git_complete gd _git_diff
__git_complete gdo _git_diff
__git_complete gdm _git_diff
__git_complete gdst _git_diff
__git_complete gdsg _git_diff
## stash
alias gst='git stash'
__git_complete gst _git_stash
## add 
__git_complete ga _git_add
## restore
alias grs='git restore'
alias grss='git restore --staged'
__git_complete grs _git_restore
__git_complete grss _git_restore
## log 
alias glg='git log --graph --oneline --all'
__git_complete glg _git_log
## pull 
__git_complete gpl _git_pull
## merge 
__git_complete gm _git_merge
## rebase
__git_complete grb _git_rebase




# ------------------------------
# FZF 
# ------------------------------

# FZF config
source "$CONFIGD_DIR/fzf/fzf.main" 1> /dev/null



# ------------------------------
# CHEAT 
# ------------------------------

# creates dotfile symlinks for CHEAT expected files and folders 
bash "$CONFIGD_DIR/cheat/make_xdgconfig_cheat_symlink.sh" 1> /dev/null
bash "$CONFIGD_DIR/cheat/make_cheat_repo_symlink.sh" 1> /dev/null

# generate conf.yml with users $HOME populated in cheatfile paths
CHEAT_CONF="$HOME/.config/cheat/conf.yml"
CHEAT_CONF_TEMPLATE="$CHEAT_CONF.tmpl"
envsubst < "$CHEAT_CONF_TEMPLATE" > "$CHEAT_CONF"


# ------------------------------
# BAT
# ------------------------------

################################
# Overrides/Patches 
#################################

