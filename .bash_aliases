# .bash_aliases

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# python 
alias pip=pip3
alias python=python3
alias orb-python='docker run -it -v $PWD:/mnt manifoldai/orbyter-ml-dev:2.0 python'
alias ipython='docker run -it manifoldai/orbyter-ml-dev:2.0 ipython --TerminalInteractiveShell.editing_mode=vi'
alias jn='docker run -it -p 8888:8888 -v $PWD:/mnt manifoldai/orbyter-ml-dev:2.0 jupyter notebook --NotebookApp.token='' --ip=0.0.0.0 --allow-root && /bin/bash'

# docker
alias docker-clean-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker-kill-ps='docker kill $(docker ps -q)'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# git
alias glog='git log --pretty=format:"%C(yellow)%h %Cred%an %Cblue%ad %Cgreen%d %Creset%s" --date=relative --graph'

