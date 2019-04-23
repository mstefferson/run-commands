# Bash profile just sources bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# mac color schemes
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#export Tree_Bot=/Users/mike/Insight/Projects/Tree_Bot
#export PYTHONPATH=Tree_Bot/src:Insight_Test/src:

# Setting PATH 
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
