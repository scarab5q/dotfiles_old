export PATH=~/.npm-global:$PATH
export PATH=~/scripts:$PATH
export PATH=~/.nav_scripts:$PATH
export PATH=~/.npm_modules/bin:$PATH
export PATH=~/.tmux/scripts:$PATH

NPM_CONFIG_PREFIX=~/.npm-global
NPM_CONFIG_PREFIX=~/.npm-global
export NODE_PATH=`npm root -g`
export BROWSER="firefox"

export TERMINAL="kitty"
export XDG_CONFIG_HOME="/home/jack/.config"

# if [ -d ~/scripts/fasd ]; then
#     source ~/scripts/fasd/fasd
# else
#     mkdir -p ~/scripts
#     git clone https://github.com/clvv/fasd ~/scripts/fasd
#     source ~/scripts/fasd/fasd
# fi 

#
# setup ssh-agent
#


# set environment variables if user's agent already exists
[ -z "$SSH_AUTH_SOCK" ] && SSH_AUTH_SOCK=$(ls -l /tmp/ssh-*/agent.* 2> /dev/null | grep $(whoami) | awk '{print $9}')
[ -z "$SSH_AGENT_PID" -a -z `echo $SSH_AUTH_SOCK | cut -d. -f2` ] && SSH_AGENT_PID=$((`echo $SSH_AUTH_SOCK | cut -d. -f2` + 1))
[ -n "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK
[ -n "$SSH_AGENT_PID" ] && export SSH_AGENT_PID

# start agent if necessary
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
fi

# setup addition of keys when needed
if [ -z "$SSH_TTY" ] ; then                     # if not using ssh
  ssh-add -l > /dev/null                        # check for keys
  if [ $? -ne 0 ] ; then
    alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh ; ssh'
    if [ -f "/usr/lib/ssh/x11-ssh-askpass" ] ; then
      SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass" ; export SSH_ASKPASS
    fi
  fi
fi

if [ -f ~/scripts/fasd/fasd ]; then
    if ! type fasd > /dev/null; then
        source ~/scripts/fasd/fasd
    fi 
else
    mkdir -p ~/scripts
    git clone https://github.com/clvv/fasd ~/scripts/fasd
    source ~/scripts/fasd/fasd
fi 

export PATH="$HOME/.cargo/bin:$PATH"
