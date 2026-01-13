
# Sourcing script for all runtime config submodules

DOTFILE_ROOT="$HOME/dotfiles"
UTILSD_RGX="\.rc$"
UTILSD_IGNR='ignore(me)?|test|experiment|\.sw(ap)'

# sets list of ".rc" submodules that will be sourced
rcModules=$(find "$DOTFILE_ROOT/utils.d" -type f | egrep "$UTILSD_RGX" \
	| egrep -v "$UTILSD_IGNR")

echo ""
for rcmod in ${rcModules[@]}; do
	#echo "rcmod: $rcmod"
	source "$rcmod"  || echo "Error occurred while sourcing \"$rcmod\""
done
