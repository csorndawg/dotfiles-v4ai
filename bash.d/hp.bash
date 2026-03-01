###########################################
# LOCAL HP/WSL BASHRC CONFIGURATIONS 
###########################################


## HP/WSL ALIASES ##
alias fx="explorer.exe"


## HP/WSL EXPORTS ##

export HP_USER_HOME="/mnt/c/Users/zaccs"
export WSL_DESKTOP_HOME="/mnt/c/Users/zaccs/Desktop"
export DESKTOP_HOME="/mnt/c/Users/zaccs/Desktop"
export HP_LINKFARM_DIR="/mnt/c/Users/zaccs/Desktop/_LinkFarm"
export DESKTOP_LINKFARM_DIR="/mnt/c/Users/zaccs/Desktop/_LinkFarm"
# Alacritty config file path
export WSL_TERMINAL_CONFIG="/mnt/c/Users/zaccs/AppData/Roaming/alacritty/alacritty.toml"
export WSL_ALACRITTY_CONFIG="/mnt/c/Users/zaccs/AppData/Roaming/alacritty/alacritty.toml"


## HP/WSL FUNCTIONS ##

# WSL file explorer helper
function wfx() {
    if [[ -z "$1" ]]; then
        echo "No filepath provided. Using CWD as path argument."
        explorer.exe
    else
        prev_cwd="$(pwd)"
        cd "$1"
        explorer.exe .
        cd -
    fi
}


## HP/WSL OTHER ##

# fd/fdfind binary symlink
if ! which fd; then
  echo "No 'fd' command exists. A symlink to the 'fdfind' binary will be generated."
  ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

export HP_DWNLDS_DIR="/mnt/c/Users/zaccs/Favorites/Downloads"
export WSL_DWNLDS_DIR="/mnt/c/Users/zaccs/Favorites/Downloads"
