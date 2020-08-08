export PATH=~/.npm-global:$PATH

NPM_CONFIG_PREFIX=~/.npm-global
NPM_CONFIG_PREFIX=~/.npm-global
export NODE_PATH=`npm root -g`

if [ -d ~/scripts/fasd ]; then
    source ~/scripts/fasd/fasd
else
    mkdir -p ~/scripts
    git clone https://github.com/clvv/fasd ~/scripts/fasd
    source ~/scripts/fasd/fasd
fi 
