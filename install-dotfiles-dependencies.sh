#!/usr/bin bash

# Runner script to install (resolve) all dotfile dependencies, in the required sequence.

# --------------------------------------------------------
# Vartiables
# --------------------------------------------------------

NERD_FONTS_INSTALL_SCRIPT="/$HOME/git/dotfiles-v4/utils.d/nerdfont_fonts_installer.sh"
GO_GOLANG_INSTALL_SCRIPT="/$HOME/git/zzlib/scripts/updatego.sh"
# GO_INSTALL_DEPENDS_SCRIPT=/will/do/this/later
# CARGO_INSTALL_DEPENDS_SCRIPT=/will/do/this/later

# 
PIP_REQUIREMENTS_PATH="$HOME/dotfiles/nvim.d/dependencies/venv_nvimd.requirements.txt"
# PYTHON_INSTALL_DEPENDS_SCRIPT=/will/do/this/later
#

# NVIM + NVIM PLUGINS
NVIM_BINARY_DEPENDS_INSTALL_SCRIPT="/$HOME/bin/install-nvim-latest-stable.sh"
# NPM_INSTALL_DEPENDS_SCRIPT=/will/do/this/later
# NVIM_PLUGINS_DEPENDS_INSTALL_SCRIPT=/will/do/this/later
# MISC_INSTALL_DEPENDS_SCRIPT=/will/do/this/later	## placeholder not sure if any other depends exist


# ubuntu/apt installs (always run this first)
APT_PACKAGES=("acl" "make" "gcc" "ripgrep" "fd-find" "tree-sitter-cli" "unzip" "git" "xclip" "python3-full" "python-is-python3" "pkg-config" "bat" "libpq-dev" "python3-dev" "build-essential" "libx11-dev" " libxext-dev" "libxres-dev" "python3-pip" "python3-pil" "python3-setuptools"  "cmake" "zoxide" "zip" "build-essential" "curl")
sudo apt update -y
sudo apt upgrade -y

# --------------------------------------------------------
# Helpers
# --------------------------------------------------------
function resolve_python_dependencies(){
	mkdir -pv "$HOME/.config/venvs" 2> /dev/null

	# create venv (add filters to only do this if it doesnt exist
	python -m venv "$HOME/.config/venvs/venv_nvimd"

	# activate newly created venv nvimd and install requirements
	source "$HOME/.config/venvs/venv_nvimd/bin/activate"
	pip install -r "$PIP_REQUIREMENTS_PATH"

	echo -e "\nPython dependencies resolved"
}

function resolve_rust_depends(){
	# cargo install
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source "$HOME/.cargo/env"
	rustc --version
	cargo --version

	# cargo test 
	cargo install just
}

# --------------------------------------------------------
# Main
# --------------------------------------------------------

LOCAL_BIN_DIR="$HOME/.local/bin"
LOCAL_CONFIG_DIR="$HOME/.config"
mkdir -pv "$LOCAL_CONFIG_DIR" 2> /dev/null
mkdir -pv "$LOCAL_BIN_DIR" 2> /dev/null
mkdir -pv "$HOME/.local/"{data,share,tmp,var,junk,docxs,lib,work}
mkdir "$HOME/data/{app,usr}"

# $LOCAL data symlinks
ln -sr "$HOME/.local/work" "$HOME/work"
ln -sr "$HOME/.local/junk" "$HOME/.junk"
ln -sr "$HOME/.local/junk" "$HOME/data/junk"
ln -sr "$HOME/.local/data" "$HOME/data/app/appdata"
ln -sr "$HOME/.local/share" "$HOME/data/app/"
ln -sr "$HOME/.local/var" "$HOME/data/var"
ln -sr "$HOME/.local/bin" "$HOME/bin"
ln -sr "$HOME/.local/lib" "$HOME/bin/ZZLIB"

# install apt depends
for pack in "${APT_PACKAGES[@]}"; do
	echo "Installing package:  $pack"
	sudo apt install $pack -y
done

# handle bat install namespace clash
sudo ln -s /usr/bin/batcat "$HOME/.local/bin/bat"

# resolve python shit
resolve_python_dependencies 



# GO INSTALLs
sudo bash "$GO_GOLANG_INSTALL_SCRIPT"
# <GO>
# <FZF>
# <CHEAT>
# <LAZYGIT??>

# RUSTUP
resolve_rust_depends
sudo bash "$HOME/dotfiles/utils.d/rust.rc"
# <RIPGREP>
# <FDFIND>
# <JUST>
# <BATCAT>
# <PROCS>
# <ZI>




# NVIM BINARY DEPENDS. INSTALLS
sudo mkdir -pv "/opt/local" 2> /dev/null
sudo bash "$HOME/git/zzlib/lib/bash/make_acl775.sh"
sudo bash "$NVIM_INSTALL_DEPENDS_SCRIPT"


# NVIM PLUGIN DEPENDS. INSTALLS

## nerdfonts dependencies
echo -e "\nResolving Nerd Font dependency"
bash "$NERD_FONTS_INSTALL_SCRIPT"

# NODE/NPM DEPENDS
#sudo apt install nodejs npm -y

# setup nvm (node version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source $HOME/.bashrc
nvim install node
nvim install npm

# conform dependencies
sudo bash "$HOME/dotfiles/nvim.d/dependencies/conform_formatters_installs.sh"


# RUST 


# <WILL CONT. REST OF CODE/LOGIC HERE LATER>
# <AND HERE>
# <HERE TOO>
