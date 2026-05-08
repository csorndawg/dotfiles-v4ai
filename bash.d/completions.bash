
# Submodule that gets called by bashrc to source all the bash completion scripts in bash.d/completions

DOTFILES_DIR="$HOME/dotfiles"
BASHD_COMP_DIR="$DOTFILES_DIR/bash.d/completions"

# source all bash.d completion files except ones with ignored file type pattern
for f in $(find "$BASHD_COMP_DIR" -maxdepth 1 -type f); do 
  # echo -e "\nFile:\t $f"
  skipFlag=$(echo $f | egrep -c '\.(zig|ZIG|ignore|ignored|wip)$')
  if (( $skipFlag > 0 )); then
    # echo "Skipping file:  $file"
    continue
  else
    source "$f" 1> /dev/null
    # echo -e "\nSourced:  $f"
  fi
done

echo -e "\nSuccesfully sourced bash.d/completion scripts"
