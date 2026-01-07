#!/usr/bin/env bash

# check if zsh present
cat /etc/shells | egrep zsh

# install zsh if not present
sudo apt update -y
sudo apt upgrade -y
sudo apt install zsh -y

# update USERNAME shell to zsh
USERNAME="zsh1"		# update as needed
sudo chsh -s $(which zsh) $USERNAME
