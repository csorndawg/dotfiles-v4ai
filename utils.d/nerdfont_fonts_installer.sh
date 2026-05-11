#!/usr/bin/env bash

# Installs select Nerd fonts (Iosevka, FiraCode, UbuntuMono) to local share 

FONTS_LOCAL_DIR="$HOME/.local/share/fonts"
FONT_URLS=('https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/UbuntuMono.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip')

function _make_local_fonts_dir() {
  if [ ! -d "$FONTS_LOCAL_DIR" ]; then
    mkdir -p "$FONTS_LOCAL_DIR"
  fi
}

# downloads/sets up Nerd fonts on local
function download_fonts() {

  #  send STDERR to dev/null so we dont get DIR EXISTS noise
  _make_local_fonts_dir  2> /dev/null
  cd "$FONTS_LOCAL_DIR"
  echo -e "Current Dir:  $(pwd)"

  for font in ${FONT_URLS[@]}; do

    # generate font folder which will hold unzipped files
    FONT_NAME="$(echo $(basename $font) | cut -d '.' -f 1))"
    mkdir -v "$FONT_NAME"
    echo -e "\nInstalling:  $FONT_NAME"

    wget "$font"
    unzip "$font" -d "./$FONT_NAME"
  done
}

download_fonts
echo -e "Succesfully downloaded and set up Nerd Font fonts on local machine."
