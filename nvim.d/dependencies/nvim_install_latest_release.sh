##!/bin/bash

# Exit on error
set -e


# Configuration
INSTALL_DIR="/opt/local/lib/neovim"
BIN_DIR="/opt/local/bin"
LOCALBIN_DIR="$HOME/.local/bin"

# Updated URL with the new naming convention (x86_64)
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
TEMP_FILE="/tmp/nvim-download.tar.gz"

echo -e "\n### Starting Neovim Installation ###"

# 1. Prepare directories
sudo mkdir -p "$INSTALL_DIR"
sudo mkdir -p "$BIN_DIR"
sudo mkdir -p "$LOCALBIN_DIR"
sudo rm -f "$TEMP_FILE"



# 2. Download with strict error checking
echo "Downloading Neovim from: $DOWNLOAD_URL"

# -f: fail silently on server errors
# -s: silent (cleaner output)
# -L: follow redirects
# -S: show error if it fails
sudo curl -fsSL "$DOWNLOAD_URL" -o "$TEMP_FILE"


# 3. Verify the file isn't empty or a tiny error message
FILE_SIZE=$(stat -c%s "$TEMP_FILE")

if [ "$FILE_SIZE" -lt 10000 ]; then
    echo "Error: Downloaded file is too small ($FILE_SIZE bytes)."
    echo "GitHub likely returned a 'Not Found' message. Check the URL."
    sudo rm -f "$TEMP_FILE"
    exit 1
fi

# 4. Extract to the library directory
echo "Extracting files to $INSTALL_DIR..."
# Ensure the directory is clean before extracting
sudo rm -rf "${INSTALL_DIR:?}"/*
sudo tar -xzf "$TEMP_FILE" -C "$INSTALL_DIR" --strip-components=1

# confirmation install + unzip worked
if [[ -f "$INSTALL_DIR/bin/nvim"  ]]; then
	echo "Success! Neovim installed to $INSTALL_DIR"
fi

# 5. Create the symlink to your PATH
echo -e "Creating symlink at $BIN_DIR/nvim..."
echo -e "Creating symlink:\t $LOCALBIN_DIR/nvim..."
sudo ln -sf "$INSTALL_DIR/bin/nvim" "$BIN_DIR/nvim"
sudo ln -sf "$INSTALL_DIR/bin/nvim" "$LOCALBIN_DIR/nvim"
sudo ln -sf "$INSTALL_DIR/bin/nvim" "$LOCALBIN_DIR/nv"


# 6. Cleanup
sudo rm -f "$TEMP_FILE"


# 7. Verification
echo -e "--------------------------------------\n"



# shared/machine level install
if [ -x "$BIN_DIR/nvim" ]; then
    echo -e "Binary linked at:\t $BIN_DIR/nvim"
    echo -e "Version Installed:\t $("$BIN_DIR/nvim" --version | head -n 1)"

else
    echo -e "Installation failed:\t Binary not found at $BIN_DIR/nvim"
    exit 1
fi



# local user install
if [ -x "$LOCALBIN_DIR/nvim" ]; then
    echo -e "Binary linked at:\t $LOCALBIN_DIR/nvim"
    echo -e "Version Installed:\t $("$LOCALBIN_DIR/nvim" --version | head -n 1)"

else
    echo -e "Installation failed:\t Binary not found at $LOCALBIN_DIR/nvim"
    exit 1
fi

