
# Sourcing script for all runtime config submodules

DOTFILE_ROOT="$HOME/dotfiles"
UTILSD_RGX="\.rc$"
UTILSD_IGNR='ignore(me)?|test|experiment|\.sw(ap)'

# sets list of ".rc" submodules that will be sourced
rcModules=$(find "$DOTFILE_ROOT/utils.d" -type f | egrep "$UTILSD_RGX" \
	| egrep -v "$UTILSD_IGNR")
echo "Sourcing RC modules from \"$DOTFILE_ROOT/utils.d\""
for rcmod in ${rcModules[@]}; do
	#echo "rcmod: $rcmod"
	#source "$rcmod"  1>& /dev/null
	#echo bash "$rcmod"  1>& /dev/null
	source "$rcmod"  1>& /dev/null
done
echo "Done sourcing RC modues"

# now source experimental/overrides runtime configurations
RC_OVRD_RGX="experiment|override"
RC_OVRD_IGNR="\.sw(a)p\b"
rcModules=$(find "$DOTFILE_ROOT/utils.d" -type f | egrep "$UTILSD_RGX" \
	| egrep -v "$RC_OVRD_IGNR" \
	| egrep "$RC_OVRD_RGX")

echo ""
echo "Sourcing RC overrides"
for rcmod in ${rcModules[@]}; do
	#echo "override file: $rcmod"
	#echo "source command:  source \"$rcmod\""
	source "$rcmod" 1>& /dev/null
done
echo "Done sourcing RC overrides"
echo ""
