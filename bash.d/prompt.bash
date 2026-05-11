
# BASHRC PROMPT CONFIGURATION
#   - splits path into 2 parts
#   - upper part: [venv]<user>@<host>
#   - lower part: [git branch]/path/to/current/dir$

# prevent virtualenv from modifying PS1 itself — we'll handle it
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Nord colors
_nord15='\[\e[38;5;5m\]'   # muted purple   - venv
_nord7='\[\e[38;5;14m\]'   # frost cyan     - user@host
_nord9='\[\e[38;5;12m\]'   # frost blue     - branch
_nord13='\[\e[38;5;11m\]'  # aurora yellow  - path
_reset='\[\e[0m\]'

build_prompt() {
  local venv_prefix=""
  local branch_line=""

  # venv prompt component
  if [ -n "$VIRTUAL_ENV" ]; then
    venv_prefix="${_nord15}($(basename "$VIRTUAL_ENV"))${_reset} "
  fi

  # Git branch + path line (only inside a repo)
  if git rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
    local branch
    branch=$(git branch 2>/dev/null | grep '^\*' | sed 's/\* //')
    branch_line="\n${_nord9}(${branch})${_reset} ${_nord13}\w${_reset}"
  fi

  PS1="${venv_prefix}${_nord7}\u@\h${_reset}${branch_line}\n\$ "
}

PROMPT_COMMAND=build_prompt
