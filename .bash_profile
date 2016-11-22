
# enable case-insensitive autocompletion
bind "set completion-ignore-case on"
# enable single-TAB expansion in case of multiple results
# bind "set show-all-if-ambiguous on"

# command aliases
alias ls="ls -G"
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

# shell prompt line
export PS1="\[\033[0;36m\][\u:\w] \$ \[\033[0m\]"

