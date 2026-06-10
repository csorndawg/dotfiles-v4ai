###########################################
# LOCAL HP/WSL BASHRC CONFIGURATIONS 
###########################################


## HP/WSL ALIASES ##
alias fx="explorer.exe"


## HP/WSL EXPORTS ##

export WSL_CDRIVE_HOME="/mnt/c/Users/zaccs"
export WSL_DESKTOP_HOME="/mnt/c/Users/zaccs/Desktop"
export DESKTOP_HOME="/mnt/c/Users/zaccs/Desktop"
export WSL_TEMP_DIR="/mnt/c/Users/zaccs/Desktop/Temp"
export WSL_LINKFARM_DIR="/mnt/c/Users/zaccs/Desktop/_LinkFarm"
export DESKTOP_LINKFARM_DIR="/mnt/c/Users/zaccs/Desktop/_LinkFarm"
export DWNLOADS_WSL1="/mnt/c/Users/zaccs/Favorites/Downloads"
export DWNLOADS_WSL2="/mnt/c/Users/zaccs/Downloads"
export WSL_PLAYGROUND_HOME="/mnt/c/Users/zaccs/Desktop/playground/"
export WSL_DWNLDS_CHROME_HOME="/mnt/c/Users/zaccs/Downloads/Chrome"
export WSL_DWNLDS_CHROME_DEFAULT_DIR="/mnt/c/Users/zaccs/Downloads/Chrome/zaccsorny/downloads"
export WSL_DOTFILES="/home/zaccsorny/dotfiles"
export WSL_LINUX_HOME="/home/zaccsorny"

# Alacritty config file path
export WSL_TERMINAL_CONFIG="/mnt/c/Users/zaccs/AppData/Roaming/alacritty/alacritty.toml"
export WSL_ALACRITTY_CONFIG="/mnt/c/Users/zaccs/AppData/Roaming/alacritty/alacritty.toml"

# WSL Local Drive Mounts
export WSL_UBU24_DRIVE='Y:\'
export WSL_UBU26_DRIVE='Z:\'

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


function __unix_2_windows(){
	if [ -z $1 ]; then
		echo -e "\nError - no path argument was provided"
		return 1
	fi

	local UNIX_PATH="$1"
	local TRANSLATED_PATH="$(echo $UNIX_PATH | sed -E 's/\//\\/g' | sed -E 's/^.mnt.c/C:/g')"
	echo -e "\nTranslated \"$UNIX_PATH\" to \"$TRANSLATED_PATH\""  >&2
	echo "$TRANSLATED_PATH"
}

function __windows_2_unix(){
	if [ -z $1 ]; then
		echo -e "\nError - no path argument was provided"
		return 1
	fi

	local WINDOWS_PATH="$1"
  local TRANSLATED_PATH="$(echo $WINDOWS_PATH | sed -E 's/\\/\//g' | sed -E 's/^C:/\/mnt\/c/g')"
	echo -e "\nTranslated \"$WINDOWS_PATH\" to \"$TRANSLATED_PATH\""  >&2
	echo "$TRANSLATED_PATH"
}

## HP/WSL OTHER ##

# fd/fdfind binary symlink
if ! which fd; then
  echo "No 'fd' command exists. A symlink to the 'fdfind' binary will be generated."
  ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

# set obisidian env. var to .deb installed /opt/ path
export OBSIDIAN_WSL_DIR="/opt/Obsidian"
alias obby="obsidian"		# cli cmd to launch, similar to old Obisidian.exe on Windows

