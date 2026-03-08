#!/usr/bin/bash

CHEATFILES_ROOTDIR="$HOME/.config/cheat/cheatsheets"
CHEAT_COMMUNITY__REPO="https://github.com/cheat/cheatsheets"

# for clean git clone
CURRENT_TIMESTAMP="$(date "+%Y%m%d_%H%M%S")"
TMP_DIRPATH="$CHEATFILES_ROOTDIR/.tmp.$(date "+%Y%m%d_%H%M%S")"
echo "Temp dir: $TMP_DIRPATH"

# if errors during CD run make_cheat_repo script to fix symlink
mkdir -pv "TMP_DIRPATH"

# clone repo with latest updates 
git clone $CHEAT_COMMUNITY__REPO "$TMP_DIRPATH/community"

# repo root only has 1 item - a "cheatsheets" directory with community cheatfiles
if [[ -d "$CHEATFILES_ROOTDIR/community" ]]; then 
	ARCHIVE_PATH="$CHEATFILES_ROOTDIR/community.$CURRENT_TIMESTAMP"
	mv -v "$CHEATFILES_ROOTDIR/community" "$ARCHIVE_PATH"
	ls -d "$CHEATFILES_ROOTDIR"
	
	# clean up tmp dir
	rm -rfv "$TMP_DIRPATH"
fi

# moving latest clone from tmp dir to perm. spot
mv -v "$TMP_DIRPATH/community"  "$CHEATFILES_ROOTDIR/community"

# validate update
CHEATSHEET_COUNT=$(find "$CHEATFILES_ROOTDIR/community" -type f  | wc -l)
echo -e "\nUpdated $CHEATSHEET_COUNT cheatsheets"


