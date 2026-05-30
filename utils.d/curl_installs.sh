

# CLI Tools/Dependencies that are installed locally using CURL

TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"
WORK_DIR="$HOME/tmp/.$(TIMESTAMP)/zcurls"

ORIG_DIR="$(pwd -P)"
mkdir -pv "$WORK_DIR"
cd  "$WORK_DIR"

echo -e "\nCWD:\t \"$WORK_DIR\""



# uv 
curl -LsSf https://astral.sh/uv/install.sh | sh
## uv windows install
##powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"


#

# switch back to starting dir
cd "$ORIG_DIR"
echo -e "\nCWD:\t \"$(pwd -P)\""
