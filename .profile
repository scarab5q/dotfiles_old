export PATH=~/.npm-global:$PATH
export PATH=~/scripts:$PATH
export PATH=~/.nav_scripts:$PATH
export PATH=~/.npm_modules/bin:$PATH
export PATH=~/.tmux/scripts:$PATH

NPM_CONFIG_PREFIX=~/.npm-global
NPM_CONFIG_PREFIX=~/.npm-global
export NODE_PATH=`npm root -g`
export BROWSER="brave"

# if [ -d ~/scripts/fasd ]; then
#     source ~/scripts/fasd/fasd
# else
#     mkdir -p ~/scripts
#     git clone https://github.com/clvv/fasd ~/scripts/fasd
#     source ~/scripts/fasd/fasd
# fi 
if [ -f ~/scripts/fasd/fasd ]; then
    source ~/scripts/fasd/fasd
else
    mkdir -p ~/scripts
    git clone https://github.com/clvv/fasd ~/scripts/fasd
    source ~/scripts/fasd/fasd
fi 

export PATH="$HOME/.cargo/bin:$PATH"
