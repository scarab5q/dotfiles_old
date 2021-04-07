# significant portion of this is stoolen from https://ithub.com/numToStr/dotfiles/blob/master/zinit/.zshrc.symlink  
# bunch of stuff taken from here https://github.com/crivotz/dot_files/blob/master/linux/zplugin/zshrc

# 

export PATH=$HOME/bin:/usr/local/bin:$PATH

## {{{Zinit installer chunk
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
### }}}


## ZINIT Config taken from https://github.com/crivotz/dot_files/blob/master/linux/zplugin/zshrc {{{{ 

#####################
# PLUGINS           #
#####################
zinit wait lucid light-mode for \
        atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
        atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions #

# SSH-AGENT
        zinit light bobsoppe/zsh-ssh-agent
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100
# zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
# zinit light zsh-users/zsh-autosuggestions
# ENHANCD
        zinit ice wait"0b" lucid
        zinit light b4b4r07/enhancd
        export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
        setopt vi
        zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
        zinit light zsh-users/zsh-history-substring-search
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
        bindkey -M vicmd 'k' history-substring-search-up
        bindkey -M vicmd 'j' history-substring-search-down``
# TAB COMPLETIONS

        local extract="
# trim input(what you select)
        local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
        local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
        local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
        realpath=\${(Qe)~realpath}
        "
        zinit ice wait"0b" lucid blockf
        zinit light zsh-users/zsh-completions

        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
        zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
        zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
        zstyle ':fzf-tab:complete:chezmoi:argument-edit' fd $(chezmoi source-path) -t f
        zstyle ":completion:*:git-checkout:*" sort false
        zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# FZF
        zinit ice lucid wait'0b' from"gh-r" as"program"
        zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
        zinit ice lucid wait'0c' as"command" pick"bin/fzf-tmux"
        zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
        zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
        zinit light junegunn/fzf
# FZF-TAB
        zinit ice wait"1" lucid
# zinit light Aloxaf/fzf-tab
# SYNTAX HIGHLIGHTING
        zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
# zinit light zdharma/fast-syntax-highlighting
# NVM
        export NVM_AUTO_USE=true
        zinit ice wait"1" lucid
        zinit light lukechilds/zsh-nvm
# EXA
        zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
        zinit light ogham/exa
        zinit ice wait blockf atpull'zinit creinstall -q .'
# BAT
        zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
        zinit light sharkdp/bat
# BAT-EXTRAS
        zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
        zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
        zinit light eth-p/bat-extras
# alias rg=batgrep.sh
# alias bd=batdiff.sh
# alias man=batman.sh
# RIPGREP
        zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
        zinit light BurntSushi/ripgrep
# NEOVIM
# FORGIT
        zinit ice wait lucid
        zinit load 'wfxr/forgit'
# LAZYGIT
        zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
        zinit light 'jesseduffield/lazygit'
# LAZYDOCKER
# zinit ice lucid wait"0" as"program" from"gh-r" mv"lazydocker* -> lazydocker" atload"alias lg='lazydocker'"
        zinit light 'jesseduffield/lazydocker'
# RANGER
        zinit ice depth'1' as"program" pick"ranger.py"
        zinit light ranger/ranger
# FD
        zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
        zinit light sharkdp/fd
# GH-CLI
        zinit ice lucid wait"0" as"program" from"gh-r" pick"usr/bin/gh"
        zinit light "cli/cli"

# BIT
        zinit ice lucid wait"0" as"program" from"gh-r" pick"bit"
        zinit light "chriswalz/bit"

# ZSH DIFF SO FANCY
# zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
# zinit light zdharma/zsh-diff-so-fancy
# GIT-FLOW
# zinit light petervanderdoes/git-flow-completion
# RCLONE
# zinit ice lucid wait"0" as"program" from"gh-r" bpick='*-linux-amd64.deb' pick"usr/bin/rclone"
# zinit light 'rclone/rclone'
# WHATSAPP CLI
# zinit ice lucid wait"0" as"program" from"gh-r" pick"whatscli"
# zinit light "normen/whatscli"
#####################
# HISTORY           #
#####################
        [ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
        HISTSIZE=290000
        SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
        setopt extended_history       # record timestamp of command in HISTFILE
        setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
        setopt hist_ignore_all_dups   # ignore duplicated commands history list
        setopt hist_ignore_space      # ignore commands that start with space
        setopt hist_verify            # show command with history expansion to user before running it
        setopt inc_append_history     # add commands to HISTFILE in order of execution
        setopt share_history          # share command history data
        setopt always_to_end          # cursor moved to the end in full completion
        setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
        setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
        setopt complete_in_word       # allow completion from within a word/phrase
        setopt nocorrect                # spelling correction for commands
        setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
        setopt nolisttypes
        setopt listpacked
        setopt automenu
        unsetopt BEEP
        setopt vi

        chpwd() exa --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale
#####################
# ENV VARIABLES     #
#####################
        export EDITOR='nvim'
        export VISUAL=$EDITOR
        export PAGER='less'
        export SHELL='zsh'
        export LANG="en_GB.UTF-8"
        export LC_ALL="en_GB.UTF-8"
        export BAT_THEME="gruvbox"
        export TERM="screen-256color"

#####################
# COLORING          #
#####################
        autoload colors && colors

#####################
# ALIASES           #
#####################

#####################
# FANCY-CTRL-Z      #
#####################
        function fg-fzf() {
          job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
        }
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER=" fg-fzf"
      zle accept-line -w
  else
    zle push-input -w
      zle clear-screen -w
      fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#####################
# RVM VARIABLE      #
#####################
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export ZSH_MISC="/home/jack/.zsh"
export FZF_BASE=/usr/bin/fzf 

#}}}


eval "$(starship init zsh)"

# [ -z "$TMUX"  ] && $(tmux ls | grep -v attached && tmux attach || tmux)
export TERMINFO=/usr/lib/terminfo
# export KEYID=C17F5B76FF29CD285E6290BC7CEFC28B55057214
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

export TERM="xterm-256color"
export LANG="en_GB.UTF-8"

export HISTFILE=~/.zhistory
export SAVEHIST=10000
export MANPAGER="nvim -c 'set ft=man' -"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERMINFO=/usr/lib/terminfo
export TASKDDATA=/var/lib/taskd
export VCSH_REPO_D=~/.config/vcsh/repo.d/

# }}




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

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line



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

  eval "$(direnv hook zsh)"


export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"

export DENO_INSTALL=/home/jack/.local
export PATH="/home/jack/.local/bin:$PATH"
# export PATH="/home/jack/.local/bin:$PATH"
export PATH=$PATH:~/.npm-global:~/.npm_modules/bin
export ZSH_CACHE_DIR="~/.cache/zsh"


# eval "$(fasd --init auto)"
fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
  eval $(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install) >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# opam configuration
test -r /home/jack/.opam/opam-init/init.zsh && . /home/jack/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


