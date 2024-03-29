# If you come from bash you might have to change your $PATH.

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH_MISC="/home/jack/.zsh"
export FZF_BASE=/usr/bin/fzf 


[ -z "$TMUX"  ] && $(tmux ls | grep -v attached && tmux attach || tmux)
export TERMINFO=/usr/lib/terminfo
export KEYID=C16F5B76FF29CD285E6290BC7CEFC28B55057214
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# source ~/.zprofile

# [ -z "$TMUX"  ] && {
#     tmux_sessions=`tmux list-sessions`

#     for i in 
# }

export TERM="xterm-256color"
export LANG="en_GB.UTF-8"



 # zplug "Aloxaf/fzf-tab"
 # zplug "zdharma/history-search-multi-word"
 # zplug "junegunn/fzf-bin"
 # zsh-users/zsh-autosuggestions
 # robbyrussell/oh-my-zsh path:plugins/vi-mode

# zdharma/fast-syntax-highlighting
# caarlos0/git-add-remote kind:path
# caarlos0/zsh-git-fetch-merge kind:path
# caarlos0/zsh-git-sync kind:path
# mafredri/zsh-async
# zplug "changyuheng/zsh-interactive-cd"
# rupa/z
# Tarrasch/zsh-bd
# # wbinglee/zsh-wakatime

# # aperezdc/zsh-fzy
# zsh-users/zsh-completions
# zsh-users/zaw
# RobSis/zsh-completion-generator
# # zsh-users/autosugestions

# # these should be at last!
# sindresorhus/pure
# zsh-users/zsh-syntax-highlighting
# zsh-users/zsh-history-substring-search
# # banter
# Let zplug manage itself
# zplug "zplug/zplug"

# zplug "zsh-users/zsh-history-substring-search"


# zplug "MichaelAquilina/zsh-you-should-use"
# zplug "zsh-users/zsh-completions", as:plugin, use:"src"
# zplug "rupa/z", use:z.sh

# zplug "zsh-users/zsh-autosuggestions", defer:3
# export ZSH_AUTOSUGGEST_USE_ASYNC=true
# bindkey '^ ' autosuggest-accept

# pure prompt
# zplug "mafredri/zsh-async", from:github
# zplug "denysdovhan/spaceship-prompt", use:"spaceship.zsh", from:github, as:theme


# defer:3 needed to load after compinit
# zplug "zsh-users/zsh-syntax-highlighting", defer:3

# zplug "Aloxaf/fzf-tab", defer:2

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
# printf "Install? [y/N]: "
# if read -q; then
# echo; zplug install
# fi
# fi

# zplug load

setopt correctall
setopt autocd
setopt extendedglob
setopt autopushd

# Allow comments in the command line
setopt interactivecomments

# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt notify

# Automatically list choices on an ambiguous completion.
setopt auto_list

# confirm execution of command from history
setopt hist_verify

# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list	'' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
fpath=(/usr/local/share/zsh-completions $fpath)

# zstyle ':zplug:tag' depth 1
bindkey '^[[Z' reverse-menu-complete

bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion




source $ZSH_MISC/zsh_aliases
source $ZSH_MISC/zsh_functions
source $ZSH_MISC/zsh_bindings
source $ZSH_MISC/zsh_styles
source $ZSH_MISC/zsh_path
# source $ZSH/completion.zsh
source $ZSH_MISC/zsh_nnn


# for file in $(fd . -H -t f $ZSH); do source $file; done


NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export HISTFILE=~/.zhistory
export SAVEHIST=10000
export MANPAGER="nvim -c 'set ft=man' -"



# plugins=(
#   vi-mode
#   auto-suggestions
#   git
#   fzf
#   git-extras
#   gitfast
#   archlinux
#   # python
#   github
#   # sudo
#   # go
#   rust
# )

# eval $(thefuck --alias)

# User configuration
# (wal -r &)
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.

# (cat ~/.cache/wal/sequences &)

# source ~/.cache/wal/colors.sh

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="nvim"                  # $EDITOR opens in terminal
# export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export ALTERNATIVE_EDITOR=""
# export EDITOR="nvim"                  # $EDITOR opens in terminal
# export EDITOR="nvr -s"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c"
# export VISUAL="nyaovim"
# export VISUAL="veonim"         # $VISUAL opens in GUI mode
# export VISUAL="oni"




export npm_config_prefix=~/.node_modules


export SCRIPTS="/home/jack/scripts"
# expac --timefmt='%Y-%m-%d %T' '%l\t%n'| sort | awk '{print $NF}' > ~/installed_packages_$HOST.txt

# yay -Qqn > sorted_installed_packages.txt


#package_files_array =$(ls -1 ~ |grep -oP '^installed\_packages\_[a-z]+\.txt')
# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# plugins, and themes. Aliases can be placed here, though oh-my-zsh


# export RUST_SRC_PATH="${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export GOPATH=$HOME/go

# export GOPATH="$GOPATH:$HOME/google_drive/Side_Projects/go"


# if which ruby >/dev/null && which gem >/dev/null; then
#     PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
# fi
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

export TERMINFO=/usr/lib/terminfo
# source $HOME/.cargo/env




# so that 'clear' works



## source $HOME/.cargo/env
export TASKDDATA=/var/lib/taskd


getPrint () {
  ag -r "print\(\w+\)" $1
}


# export NPM_CONFIG_PREFIX=~/.npm-global

setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

alias git=hub
export VCSH_REPO_D=~/.config/vcsh/repo.d/


# export PAGER=nvimpager
# source /home/jack/todoist/todoist_functions.sh
# export PAGER=nvimpager
# source /home/jack/todoist/todoist_functions.sh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/jack/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/jack/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh
[[ -s "/home/jack/.gvm/scripts/gvm" ]] && source "/home/jack/.gvm/scripts/gvm"


# required for marker
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

#
# Much of what is below was taken from https://github.com/pockata/dotfiles/blob/master/zsh/.zshrc
#

repo() {
  # Validate that this folder is a git folder
  if ! command git branch 2>/dev/null 1>&2 ; then
    echo "Not a git repo!"
    exit $?
  fi

    # Figure out github repo base URL
    local base_url

    base_url=$(command git config --get remote.origin.url)
    base_url=${base_url%\.git} # remove .git from end of string

    # Fix git@github.com: URLs
    base_url=${base_url//git@github\.com:/https:\/\/github\.com\/}

    # Fix git://github.com URLS
    base_url=${base_url//git:\/\/github\.com/https:\/\/github\.com\/}

    # Fix git@bitbucket.org: URLs
    base_url=${base_url//git@bitbucket.org:/https:\/\/bitbucket\.org\/}

    # Fix git@gitlab.com: URLs
    base_url=${base_url//git@gitlab\.com:/https:\/\/gitlab\.com\/}

    # Find current directory relative to .git parent
    full_path=$(pwd)
    git_base_path=$(cd "./$(command git rev-parse --show-cdup)" || exit 1; pwd)
    relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

    # If filename argument is present, append it
    if [ "$1" ]; then
      relative_path="$relative_path/$1"
    fi

    # Figure out current git branch
    # git_where=$(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
    git_where=$(command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null

    # Remove cruft from branchname
    branch=${git_where#refs\/heads\/}

    [[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
    url="$base_url/$tree/$branch$relative_path"


    echo "Calling $(type open) for $url"

    open "$url" &> /dev/null || (echo "Using $(type open) to open URL failed." && exit 1);
  }

# Interactive process killing with FZF:
fkill() {
  pid=$(ps -ux | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# widget-helper() {
# local ret=$?
# zle redisplay
# typeset -f zle-line-init >/dev/null && zle zle-line-init
# return $ret
# }

git-branches-widget() {
LBUFFER="${LBUFFER}$(gb)"
widget-helper
}

git-changedfiles-widget() {
LBUFFER="${LBUFFER}$(gf)"
widget-helper
}

git-prevCommit-widget() {
LBUFFER="${LBUFFER}$(gp)"
widget-helper
}

git-commitfinder-widget() {
LBUFFER="${LBUFFER}$(cselect)"
widget-helper
}

listdirectories-widget() {
LBUFFER="${LBUFFER}$(listdirectories)"
widget-helper
}

project-switcher-widget() {
project-switcher
widget-helper
zle accept-line
}

autoload -U edit-command-line

zle -N edit-command-line
zle -N git-branches-widget
zle -N git-changedfiles-widget
zle -N git-prevCommit-widget
zle -N git-commitfinder-widget
zle -N listdirectories-widget
zle -N project-switcher-widget

bindkey -r '^G'
bindkey '^G^F' git-changedfiles-widget
bindkey '^G^P' git-prevCommit-widget
bindkey '^G^R' git-commitfinder-widget
bindkey '^G^B' git-branches-widget
bindkey '^X^E' edit-command-line
bindkey '^F' listdirectories-widget
bindkey -r '^E'
bindkey '^E^P' project-switcher-widget

# Vi mode indicator
# https://github.com/sindresorhus/pure/wiki
# VIM_PROMPT="❯"
# PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

# prompt_pure_update_vim_prompt() {
#     zle || {
#         print "error: pure_update_vim_prompt must be called when zle is active"
#             return 1
#         }
#     VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
#     zle .reset-prompt
# }

# function zle-line-init zle-keymap-select {
#     prompt_pure_update_vim_prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# Complete word from history with menu
# https://github.com/mika/zsh-pony
# zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey "^X^X" hist-complete


# Antinbody old plugin.txt file


# zdharma/history-search-multi-word
# junegunn/fzf-bin
# zsh-users/zsh-autosuggestions
# robbyrussell/oh-my-zsh path:plugins/vi-mode

# zdharma/fast-syntax-highlighting
# caarlos0/git-add-remote kind:path
# caarlos0/zsh-git-fetch-merge kind:path
# caarlos0/zsh-git-sync kind:path
# mafredri/zsh-async
# changyuheng/zsh-interactive-cd
# rupa/z
# Tarrasch/zsh-bd
# # wbinglee/zsh-wakatime

# # aperezdc/zsh-fzy
# zsh-users/zsh-completions
# zsh-users/zaw
# RobSis/zsh-completion-generator
# # zsh-users/autosugestions

# # these should be at last!
# sindresorhus/pure
# zsh-users/zsh-syntax-highlighting
# zsh-users/zsh-history-substring-search
# # banter

nn ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}



# ix io pastie
ix() {
  local opts
  local OPTIND
  [ -f "$HOME/var/.netrc" ] && opts='-n'
  while getopts ":hd:i:n:" x; do
    case $x in
      h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
      d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
      i) opts="$opts -X PUT"; local id="$OPTARG";;
      n) opts="$opts -F read:1=$OPTARG";;
    esac
  done
  shift $(($OPTIND - 1))
  [ -t 0 ] && {
    local filename="$1"
      shift
      [ "$filename" ] && {
        curl $opts -F f:1=@"$filename" $* ix.io/$id
              return
            }
          echo "^C to cancel, ^D to send."
        }
      curl $opts -F f:1='<-' $* ix.io/$id
    }

  eval "$(starship init zsh)"
  eval "$(direnv hook zsh)"

  setopt vi
  setopt autopushd
  setopt autocd

  export DOTBARE_DIR="$HOME/.cfg"
  export DOTBARE_TREE="$HOME"

  export DENO_INSTALL=/home/jack/.local
  export PATH="/home/jack/.local/bin:$PATH"
  # export PATH="/home/jack/.local/bin:$PATH"
  export PATH=$PATH:~/.npm-global:~/.npm_modules/bin


  # eval "$(fasd --init auto)"
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install \
      zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
  eval "$(fasd --init zsh-hook   )"

# opam configuration
test -r /home/jack/.opam/opam-init/init.zsh && . /home/jack/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"


autoload -Uz _zinit

 
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# zinit packages

zinit light Aloxaf/fzf-tab
zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh' 
