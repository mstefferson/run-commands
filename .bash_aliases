# .bash_aliases

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# python 
alias pip=pip3
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias python_todo='grep -R --include *.py "TODO" .'

# docker
alias rdockerml="sudo docker run --rm -ti -v ${PWD}:/app/ -p 8989:8989 --hostname localhost --ipc=host mstefferson/ml_bot:latest bash"
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker_kill_ps='docker kill $(docker ps -q)'

## ssh and scp
# divirod
alias divirod_iot="cd ~/Divirod; ssh -i ~/Divirod/.mikes_key.pem mstefferson@iot.divirod.com"

# bolt: ec2
alias mikebolt="cd ~/Divirod; ssh -i ~/Divirod/.mikes_key.pem mstefferson@18.237.39.242"
getmikebolt()
{
  scp -i ~/Divirod/.mikes_key.pem mstefferson@18.237.39.242:$1 $2
}
pushmikebolt()
{
  scp -i ~/Divirod/.mikes_key.pem $1 mstefferson@18.237.39.242:$2
}
pushmikebolt()
{
  scp -r -i ~/Divirod/.mikes_key.pem $1 mstefferson@18.237.39.242:$2
}

# bolt: divirod
alias bolt="ssh mstefferson@10.0.1.9"
getbolt()
{
  rsync -au mstefferson@10.0.1.9:$1 $2
}
pushbolt()
{
  scp $1 mstefferson@10.0.1.9:$2
}
pushbolt()
{
  scp -r $1 mstefferson@10.0.1.9:$2
}
# vieques: biofrontier cluster
alias vieques="ssh -l mist7261 vieques.colorado.edu"
getvieques()
{
  rsync -au mist7261@vieques.colorado.edu:$1 $2
}
pushvieques()
{
  scp $1 mist7261@vieques.colorado.edu:$2
}
pushvieques()
{
  scp -r $1 mist7261@vieques.colorado.edu:$2
}
# fiji: biofrontier cluster
alias fiji="ssh -l mist7261 fiji.colorado.edu"
getfiji()
{
  rsync -au mist7261@fiji.colorado.edu:$1 $2
}
pushfiji()
{
  scp $1 mist7261@fiji.colorado.edu:$2
}
pushfiji()
{
  scp -r $1 mist7261@fiji.colorado.edu:$2
}
# nofx: my desktop at cu
alias nofx="ssh -l mws nofx.colorado.edu"
getnofx()
{
  rsync -au mws@nofx.colorado.edu:$1 $2
}

pushnofx()
{
  scp $1 mws@nofx.colorado.edu:$2
}
pushnofx()
{
  scp -r $1 mws@nofx.colorado.edu:$2
}
# rumor: groups cluster
alias rumor="ssh -l mstefferson rumor.colorado.edu"
getrumor()
{
  rsync -au mstefferson@rumor.colorado.edu:$1 $2
}
pushrumor()
{
  scp $1 mstefferson@rumor.colorado.edu:$2
}
pushrumor()
{
  scp -r $1 mstefferson@rumor.colorado.edu:$2
}
# pando: biofrontier cluster
alias pando="ssh -l mist7261 pando.colorado.edu"
getpando()
{
  rsync -au mist7261@pando.colorado.edu:$1 $2
}
pushpando()
{
  scp $1 mist7261@pando.colorado.edu:$2
}
pushpando()
{
  scp -r $1 mist7261@pando.colorado.edu:$2
}
# summit: cu supercomputer
alias summit="ssh -l mist7261 login.rc.colorado.edu"
getsummit()
{
  rsync -au mist7261@login.rc.colorado.edu:$1 $2
}
pushsummit()
{
  scp $1 mist7261@login.rc.colorado.edu:$2
}
pushsummit()
{
  scp -r $1 mist7261@login.rc.colorado.edu:$2
}

# spot: physics webpage host server
alias spot="ssh -l mist7261 spot.colorado.edu"
getspot()
{
  scp mist7261@spot.colorado.edu:$1 $2
}
getspot()
{
  scp -r mist7261@spot.colorado.edu:$1 $2
}
pushspot()
{
  scp $1 mist7261@spot.colorado.edu:$2
}
pushspot()
{
  scp -r $1 mist7261@spot.colorado.edu:$2
}
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# git
alias glog='git log --pretty=format:"%C(yellow)%h %Cred%an %Cblue%ad %Cgreen%d %Creset%s" --date=relative --graph'

