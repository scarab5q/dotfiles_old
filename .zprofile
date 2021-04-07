# Local Variables:
# eval (shell-script-mode)

export NPM_CONFIG_PREFIX=~/.npm-global
export PATH="$HOME/.cargo/bin:$PATH"
export CSP=$(chezmoi source-path)
source ~/.profile
export TERM="xterm-256color"
export LANG="en_GB.UTF-8"

source $ZSH_MISC/zsh_aliases
source $ZSH_MISC/zsh_functions
source $ZSH_MISC/zsh_bindings
source $ZSH_MISC/zsh_styles
source $ZSH_MISC/zsh_path
source $ZSH_MISC/zsh_nnn
source $ZSH_MISC/completions/*
