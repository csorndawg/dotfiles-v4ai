#!/usr/bin/bash

# Symlink handler for cheat dotfiles config and cheatfiles repo.
# Currently cheat.conf requires a "cheatfiles" symlink in "config.d/cheat" dotfiles folder
# Script clones cheatfile repo to ~/.local/docxs repo if it doesn't exist


# create cheat repo source path
CHEAT_REPO_SRC_DIR="$HOME/.local/docxs"
CHEAT_REPO_NAME="my-cheatfiles"
CHEAT_REPO_SRC_PATH="$CHEAT_REPO_SRC_DIR/$CHEAT_REPO_NAME"


# create cheat repo expected path
DOTFILES_HOME="$HOME/dotfiles"
CONFIGD_CHEAT_DIR="$DOTFILES_HOME/config.d/cheat"
EXPECTED_CHEAT_REPO_NAME="cheatsheets"
EXPECTED_CHEAT_REPO_PATH="$CONFIGD_CHEAT_DIR/$EXPECTED_CHEAT_REPO_NAME"
#echo "Expected cheat repo symlink path:  $EXPECTED_CHEAT_REPO_PATH"

# LOCAL GIT symlink path
LOCAL_GIT_SYML_TARG="$HOME/git/cheatfiles"

# make parent dir for cheat repo clone if it doesnt exist
mkdir -p "$CHEAT_REPO_SRC_DIR" 2> /dev/null
cd "$CHEAT_REPO_SRC_DIR"

# check if cheat repo exists 
if [[ ! -d "$CHEAT_REPO_SRC_PATH" ]]; then
echo "Cheat repo does not exist at the expected location:  $EXPECTED_CHEAT_REPO_PATH"
	echo "Cloning cheat repo"
	gh repo clone "$CHEAT_REPO_NAME"
	echo "Repo cloned successfully"
fi


# check for config.d/cheat --> cheat repo symlink
if [[ ! -d "$EXPECTED_CHEAT_REPO_PATH" ]]; then

	ln -sf "$CHEAT_REPO_SRC_PATH" "$EXPECTED_CHEAT_REPO_PATH" 
	echo -e "Created symlink:\t \"$EXPECTED_CHEAT_REPO_PATH\""

else
	echo "Valid $EXPECTED_CHEAT_REPO_PATH exists"
fi


# check for config.d/cheat --> cheat repo symlink
if [[ ! -d "$LOCAL_GIT_SYML_TARG" ]]; then

	ln -sf "$CHEAT_REPO_SRC_PATH" "$LOCAL_GIT_SYML_TARG" 
	echo -e "Created symlink:\t\"$LOCAL_GIT_SYML_TARG\""
fi

echo -e "\nAll expected cheat symlinks exists in their expected locations"
