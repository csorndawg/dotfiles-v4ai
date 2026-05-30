

# Cargo-Installed CLI Tools/Dependencies - Bootstrap Script



# ---------------------------------------------------------------------------
# install rust/cargo/rustup 
# ---------------------------------------------------------------------------


# configure rust toolchain for local user (add to PATH, etc.)


# ---------------------------------------------------------------------------
# CARGO INSTALLS
# ---------------------------------------------------------------------------

# RUST TOOLS INSTALLED w/ CARGO
# 
# @TODO: 
#  Determine if tools will be installed dynamically from a list or if 
#  each tool will have its own "install + configure" subsection.

RUST_TOOLS=(
"fd-find"
"ripgrep"
"zoxide"
#"delta"
"xsv"
#"qsv"		# XSV is unmaintained, use this as alternate
#"bottom"
#"navi"
"eza"		# EZA is FORK of unmaintained EXA
#"--git https://github.com/googleworkspace/cli --locked"	# google master CLI tool (covers drive, gmail, calendar, sheets, and more)
#
"--locked tree-sitter-cli"	# treesitter for nvim
#"sd"
"tealdeer"		# rust source TLDR pages (much faster than other TLDR source options)
"just"
#"procs"
#"du-dust"
)

# @TODO:
# Add logic to automatically make config.d/ subfolder for certain 
# tools (no config file for now, just the folder itself)
for tool in "${RUST_TOOLS[@]}"; do 
	echo -e "\nInstalling:  $tool"
	cargo install "$tool"
done

# ---------------------------------------------------------------------------
# POST INSTALL CONFIGURATIONS
# ---------------------------------------------------------------------------

## TEALDEER bash comp. ##
CRATES_DIR="$HOME/.cargo/registry/src"
TEALDEER_BASH_COMP_SRC_PATH="$(find  "$CRATES_DIR" -type f | egrep "(teal|tldr).+comp.+bash")"
TEALDEER_BASH_COMP_TARG_PATH="$HOME/dotfiles/bash.d/completions/tldr.bash"
#cp "$TEALDEER_BASH_COMP_SRC_PATH" /usr/share/bash-completion/completions/tldr
cp -v "$TEALDEER_BASH_COMP_SRC_PATH" "$TEALDEER_BASH_COMP_TARG_PATH"
