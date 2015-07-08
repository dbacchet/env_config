
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# enable case-insensitive autocompletion
bind "set completion-ignore-case on"
# enable single-TAB expansion in case of multiple results
# bind "set show-all-if-ambiguous on"

# command aliases
alias ls="ls -G"

# shell prompt line
export PS1="\[\033[0;36m\][\u:\w] \$ \[\033[0m\]"
