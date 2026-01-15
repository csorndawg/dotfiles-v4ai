# Script sources all "utils.d" runtime config submodules from my dotfiles repo

DOTFILE_ROOT="$HOME/dotfiles"
UTILSD_RGX="\.rc$"

# ignore patterns for any file in utils.d to ignore (after UTILSD_RGX filter)
UTILSD_IGNR='ignore(me)?|test|experiment|\.sw(ap)'

# .rc files that need to be sourced after all other RC modules are loaded
RC_SRC_LAST_RGX="utils.d\/*(override|hotfix).+\.rc"

# source runtime modules (unordered/non-determisitic sourcing)
rcModules=$(find "$DOTFILE_ROOT/utils.d" -type f | egrep "$UTILSD_RGX" \
	| egrep -v "$UTILSD_IGNR" \
	| egrep -v "$RC_SRC_LAST_RGX")	# filter out any rc files that need to be loaded at the end

echo ""
echo "Sourcing Generic Runtime Modules:"
for runtimeModule in ${rcModules[@]}; do
	echo "runtimeModule: $runtimeModule"
	source "$runtimeModule"  || echo "Error occurred while sourcing \"$runtimeModule\""
done

# source runtime modules that MUST be SOURCED LAST (after all other rc modules)
rcOverrides=$(find "$DOTFILE_ROOT/utils.d" -type f \
	| egrep "$RC_SRC_LAST_RGX" \
	| egrep -v "$UTILSD_IGNR")

echo ""
echo "Sourcing Runtime Overrides:"
for overrideModule in ${rcOverrides[@]}; do
	echo "overrideModule: $overrideModule"
	source "$overrideModule"  || echo "Error occurred while sourcing \"$overrideModule\""
done


echo ""
echo "Done sourcing all runtime files"
