
#  _____ ___ ____  _   _    ____ ___  _   _ _____ ___ ____ 
# |  ___|_ _/ ___|| | | |  / ___/ _ \| \ | |  ___|_ _/ ___|
# | |_   | |\___ \| |_| | | |  | | | |  \| | |_   | | |  _ 
# |  _|  | | ___) |  _  | | |__| |_| | |\  |  _|  | | |_| |
# |_|   |___|____/|_| |_|  \____\___/|_| \_|_|   |___\____|
#
                                                         

# function to install fisher if it is not installed
if not functions -q omf
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
end


set EDITOR 'nvr -s'
# setting language paths
set GOPATH ~/go
set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set ARDUINO_PATH /usr/local/arduino

set SCRIPTS ~/scripts

set PATH  ~/.nav_scripts ~/.node_modules/bin ~/app_images "~/scripts/"$HOST"_settings" (ruby -e 'print Gem.user_dir')/bin ~/chromeDriver/phantomjs-2.1.1-linux-x86_64/ "~/orgConversion" "~/.config" "~/.cargo/bin" $GOPATH/bin $PATH "~/.rvm/bin" $SCRIPTS "~/.yarn/bin:~/.config/yarn/global/node_modules/.bin" $PATH

source ~/.config/fish/fish_aliases
source ~/.config/fish/fish_functions



# allows vi bindings in the shell
fish_vi_key_bindings

set FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set FZF_DEFAULT_OPTS "--preview '(highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500' --height 40% --reverse"
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set FZF_ALT_C_COMMAND "fd -t d . $HOME"

set SKIM_DEFAULT_OPTIONS "--height "40%" --reverse --ansi --regex"
set SKIM_DEFAULT_COMMAND "fd . --hidden"
