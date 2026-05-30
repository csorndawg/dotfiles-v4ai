
# CLI Tools/Dependencies that are downloaded locally using GO/GO INSTALL
#


# install GO itself


# configure GO for local user (add to PATH, etc.)



# GO TOOLS INSTALLED w/ GO
# 
# @TODO: 
#  Determine if tools will be installed dynamically from a list or if 
#  each tool will have its own subsection within "GO TOOLS INS.."
#

#GOTOOLS=("lazygit" "other" "tools will go here")

# GO TOOLS
#

# lazygit
go install github.com/jesseduffield/lazygit@latest


# duf
LAST_CWD="$(pwd -P)"
WORK_DIR="$HOME/data/usr/downloads/go"
mkdir -pv .temp/temp
git clone https://github.com/muesli/duf.git
cd duf
go build


