#!/usr/bin/bash

# Install commands for Conform formatters system depedencies
# Assumes user has rust/cargo, pip, and npm installed

source "$HOME/.config/venvs/venv_nvimd/bin/activate"

## python
pip install ruff

# c/c++
sudo apt install clang-format -y

# bash
sudo apt install shfmt -y

# toml (assumes rust/cargo already installed locally)
cargo install taplo-cli

# powershell (review after all formatters installed + working)
#Install-Module -Name PSScriptAnalyzer -Scope CurrentUser
 
# yaml/json
sudo npm install -g prettier

# lua
cargo install stylua

# sql
pip install sqlfmt
go install github.com/google/yamlfmt/cmd/yamlfmt@latest  # yamlfmt prereq
