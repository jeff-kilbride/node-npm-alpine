# Be careful copying, moving, removing files
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Better listing commands
alias less='less -MNE~'
alias more=less
alias ll='ls -lFah --color=auto'

# Recognize "more" typos
alias mroe=more
alias moer=more
alias mreo=more

# Always list directory contents upon 'cd'
cd() { builtin cd "$@"; ll; }

# Quick directory movement
alias ..='cd ../'
alias ...='cd ../../'

# Better mkdir
alias mkdir='mkdir -pv'

# Color grep
alias grep='grep --color=auto -in'

# Use vi keybindings
set -o vi
