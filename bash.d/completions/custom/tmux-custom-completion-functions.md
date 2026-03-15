---
id: tmux-custom-completion-functions
aliases:
  - tmux-custom-completion-functions
tags: [bash, tmux, shell, tab-completion, dotfiles, productivity]
---

# tmux-custom-completion-functions


## Tmux Format Strings 
Commonly Used Tmux Format Strings:
#S: Session name.
#W: Window name.
#T: Pane title.
#P: Pane index.
#I: Window index.
#F: Flag indicating if the session is active.


*Example: Using `#S` format string to get a list of sessions for `tmux attach-session` alias (`tmas`) completion

```
_tmas_complete() {
    local cur prev options
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # If the current option is -t, suggest available Tmux sessions
    if [[ "$prev" == "-t" ]]; then
        options=$(tmux list-sessions -F '#S')  # List all session names
        COMPREPLY=( $(compgen -W "$options" -- "$cur") )
    else
        # Otherwise, suggest flags for the tmux attach-session command
        COMPREPLY=( $(compgen -W "-t" -- "$cur") )
    fi
}

# Attach the completion function to the alias
complete -F _tmas_complete tmas

```
