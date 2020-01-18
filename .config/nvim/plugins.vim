" ____  _             _           
"|  _ \| |_   _  __ _(_)_ __  ___ 
"| |_) | | | | |/ _` | | '_ \/ __|
"|  __/| | |_| | (_| | | | | \__ \
"|_|   |_|\__,_|\__, |_|_| |_|___/
"               |___/             

"you need to Specify a directory for plugins

"-   For Neovim: ~/.local/share/nvim/plugged
"-   Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

if has('nvim')
    Plug 'Shougo/defx.nvim'
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'coc-sources'Plugin 'pest-parser/pest.vim'

Plug 'pest-parser/pest.vim'
Plug 'norcalli/nvim_utils'
Plug 'https://github.com/ConradIrwin/vim-bracketed-paste'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/kshenoy/vim-signature'
Plug 'zxqfl/tabnine-vim'
" Plug 'neoclide/coc-tabnine'
Plug 'tpope/vim-repeat'
Plug 't9md/vim-choosewin'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'vimwiki/vimwiki'
Plug 'kassio/neoterm'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mcchrish/nnn.vim'
Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
" Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco'
Plug 'dylanaraps/wal.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'Chiel92/vim-autoformat'
Plug 'rogual/neovim-dot-app'
Plug 'lucc/nvimpager'
Plug 'alvan/vim-closetag'
Plug 'szymonmaszke/vimpyter', {'on': 'IPythonNotebook'}
Plug 'Shougo/denite.nvim'
Plug 'freitass/todo.txt-vim'
Plug 'gioele/vim-autoswap'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/is.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-easy-align'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'zhaocai/GoldenView.Vim'
Plug 'itchyny/lightline.vim'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'takac/vim-hardtime'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/calendar.vim'
Plug 'majutsushi/tagbar'
Plug 'farseer90718/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'godlygeek/tabular'
" Plug 'https://github.com/masukomi/vim-markdown-folding'
Plug 'plasticboy/vim-markdown'
Plug 'pbrisbin/vim-mkdir'
Plug 'qpkorr/vim-bufkill'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'tpope/vim-endwise', {'for': ['sh', 'bash', 'zsh', 'vim', 'markdown']}
" Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()
