
#  _____ ___ ____  _   _    ____ ___  _   _ _____ ___ ____ 
# |  ___|_ _/ ___|| | | |  / ___/ _ \| \ | |  ___|_ _/ ___|
# | |_   | |\___ \| |_| | | |  | | | |  \| | |_   | | |  _ 
# |  _|  | | ___) |  _  | | |__| |_| | |\  |  _|  | | |_| |
# |_|   |___|____/|_| |_|  \____\___/|_| \_|_|   |___\____|
#
                                                         

# function to install fisher if it is not installed
# if not functions -q omf
#     set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
# end

set XDG_CACHE_HOME "$HOME/.cache";
set XDG_CONFIG_HOME "$HOME/.config";
set XDG_DATA_HOME "$HOME/.local/share";
set XDG_BIN_HOME "$HOME/.local/bin";
set RUSTUP_HOME "$XDG_DATA_HOME/rustup";
set CARGO_HOME "$XDG_DATA_HOME/cargo";
set NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config";
set NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm";
set NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm";
set NPM_CONFIG_PREFIX "$XDG_CACHE_HOME/npm";
set NODE_REPL_HISTORY "$XDG_CACHE_HOME/node/repl_history";
set TERMINAL "alacritty";
set ALTERNATIVE_EDITOR "emacsclient -t";

source ~/.config/fish/aliases.fish
source ~/.config/fish/abbreviations.fish
source ~/.config/fish/functions.fish

# setting language paths
set GOPATH ~/go
# set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set ARDUINO_PATH /usr/local/arduino
set RUSTUP_HOME $XDG_DATA_HOME/rustup
set CARGO_HOME $XDG_DATA_HOME/cargo
set SCRIPTS ~/scripts
# set PATH  ~/.nav_scripts ~/.node_modules/bin ~/app_images "~/scripts/"$HOST"_settings" (ruby -e 'print Gem.user_dir')/bin ~/chromeDriver/phantomjs-2.1.1-linux-x86_64/ "~/orgConversion" "~/.config" "~/.cargo/bin" $GOPATH/bin $PATH "~/.rvm/bin" $SCRIPTS "~/.yarn/bin:~/.config/yarn/global/node_modules/.bin" $PATH

# allows vi bindings in the shell
fish_vi_key_bindings

set FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set FZF_DEFAULT_OPTS "--preview '(highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500' --height 40% --reverse"
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set FZF_ALT_C_COMMAND "fd -t d . $HOME"


set SKIM_DEFAULT_OPTIONS "--height "40%" --reverse --ansi --regex"
set SKIM_DEFAULT_COMMAND "fd . --hidden"

set PATH "$HOME/.cargo/bin:$PATH" $PATH

# add direnv to fish
direnv hook fish | source
starship init fish | source

