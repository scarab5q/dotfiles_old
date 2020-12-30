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

export NNN_OPENER=picker

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500' --height 40% --reverse"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_COMPLETION_TRIGGER=''

export SKIM_DEFAULT_OPTIONS="--height "40%" --reverse --ansi --regex"
export SKIM_DEFAULT_COMMAND="fd . --hidden"

alias todo=todo.sh

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

# taken from:
  # https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
  # http://mah.everybody.org/docs/ssh

# set environment variables if user's agent already exists

SSH_ENV="$HOME/.ssh/environment"

#function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/env ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/env ssh-add;
#}

## Source SSH settings, if applicable

#if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     #ps ${SSH_AGENT_PID} doesn't work under cywgin
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
#else
#     start_agent;
#fi


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
