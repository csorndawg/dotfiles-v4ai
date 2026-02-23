
# Submodule that gets called by bashrc to source all the bash completion scripts in bash.d/completions

DOTFILES_DIR="$HOME/dotfiles"
BASHD_COMP_DIR="$DOTFILES_DIR/bash.d/completions"

for f in $(find "$BASHD_COMP_DIR" -maxdepth 1 -type f); do
	source "$f" 1> /dev/null
done
echo "Finished sourcing bash.d/completion scripts"
echo ""
