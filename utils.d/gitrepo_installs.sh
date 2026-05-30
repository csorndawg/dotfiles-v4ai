

# CLI Tools/Dependencies that are downloaded locally using their git repo


TOOLS=('list items will be download url' 'or the git clone url')

LOCAL_APPS_HOMEDIR="$HOME/data/apps"

# ------------------------------------------------------------------------------------------------
# FZF - V0.48.0 > 
# ------------------------------------------------------------------------------------------------

# install target
FZF_TARG_PATH"$LOCAL_APPS_HOMEDIR/fzf/latest"
mkdir -pv "$(basename "$FZF_TARG_PATH")" 2> /dev/null
git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_TARG_PATH"
. $HOME/data/apps/fzf/latest/install

