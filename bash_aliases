# .bash_aliases

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# python 
alias pip=pip3
alias python=python3

# git
alias glog='git log --pretty=format:"%C(yellow)%h %Cred%an %Cblue%ad %Cgreen%d %Creset%s" --date=relative --graph'
alias git-rm-local='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
