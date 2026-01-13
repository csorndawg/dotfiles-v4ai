
# Sourcing script for all runtime config submodules

DOTFILE_ROOT="$HOME/dotfiles"

# silently source all ".rc" files and echoes filename for any ofailed source when error occurrs
# silently source all ".rc" submodules and echoes out filename if an error occurrs when sourcing
find "$DOTFILE_ROOT/utils.d" -type f | egrep "\.rc$" \
	| xargs -I "{}"  echo source {} #1>/dev/null

