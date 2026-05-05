#### 
#### FZF Fuzzy Completion Custom Configuration
#### 



# Copypasta example from docs
# Can configure this in more detail later

# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_TRIGGER=',,'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    # special git branch fuzzy comp
    gco|git-checkout|gdb)
      # 1. Generate the branch list
      # 2. Pipe it into fzf
      # 3. Use a git-specific preview
      git branch --all --format="%(refname:short)" | sed "s#^origin/##" | sort -u | \
      fzf --preview 'git log --oneline --graph --color=always {}' "$@" ;;
    cd)           fzf --preview 'tree -C {} | head -150'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
 }

# Customizing comp source for fuzzy comp path & directories completion 
# 
# Use fd as fuzzy comp path source
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "*ignore*" --exclude "*tmp" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude "*ignore*" --exclude "*tmp" . "$1"
}

# FZF Git Branches Completion
_fzf_complete_git() {
    local args=$@
    if [[ $args == 'git checkout'* ]] || [[ $args == 'git branch'* ]]; then
        _fzf_complete "--reverse --multi" "$@" < <(
            git branch --all --format="%(refname:short)" | sed 's#^origin/##' | sort -u
        )
    else
      # Fallback to default file completion for other git commands
      _fzf_path_completion "$@"
    fi
}

[ -n "$BASH_VERSION" ] && complete -F _fzf_complete_git -o default -o bashdefault git

# @FIXME: file isnt sourcing "completions.bash" which is needed for _fzf_setup_completion to work
# Register (enable) fuzzy comp for supported Bash cmds
#
# usage: _fzf_setup_completion path|dir|var|alias|host COMMANDS...

# enable fuzzy path comp for 'nvim' and nv (alias) cmds
_fzf_setup_completion path nvim 
_fzf_setup_completion path nv 

# enable fuzzy path comp for ripgrep and bat
_fzf_setup_completion path rg 
_fzf_setup_completion path bat 
_fzf_setup_completion path fd
_fzf_setup_completion path ln
_fzf_setup_completion path cp

# enable fuzzy dir comp for 'tree' cmd
_fzf_setup_completion dir tree

# git aliases (temp. soln until fzf-git.sh fully setup)
_fzf_setup_completion path gd 
_fzf_setup_completion path gdm
_fzf_setup_completion path gdom
_fzf_setup_completion path gdst
_fzf_setup_completion path gdsg
_fzf_setup_completion path ga
_fzf_setup_completion path grs
_fzf_setup_completion path grss

# git aliases w/ only branches as picker inputs
_fzf_setup_completion path gco
# _fzf_setup_completion path git-checkout     # @FIXME: Fuzzy comp doesnt work for "git checkout ,,<tab>"
# git diff branch
_fzf_setup_completion path gdb
