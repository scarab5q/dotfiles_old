if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

if empty(glob("~/.config/nvim/autoload/initmd.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/initmd.vim --create-dirs https://raw.githubusercontent.com/initmd/init.md/master/initmd.vim'
endif

if empty(glob("~/.config/nvim/autoload/map.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/map.vim --create-dirs https://raw.githubusercontent.com/cometsong/vimfiles/7170444d682a7a8ef9dc9986d5374090e7122375/vim/autoload/map.vim'
    echo "installed mapping script"
endif

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
runtime! ~/.config/nvim/plugin/*
source ~/.config/nvim/plugins.vim
lua require 'nvim_utils'

" call initmd#init(fnamemodify($MYVIMRC, ":p:h") . "/init.md")
" call initmd#init(fnamemodify($MYVIMRC, ":p:h") . "/plugins.md")
source ~/.config/nvim/settings.vim

source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/plugin/plugin_settings.vim
source ~/.config/nvim/plugin/functions.vim

source ~/.config/nvim/plugin/keymaps.vim
source ~/.config/nvim/after/veonim_config.vim


" source ~/.config/nvim/statusline.vim
source ~/.config/nvim/after/theme.vim

au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif
