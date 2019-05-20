
    call plug#begin('~/.vim/plugged')

    if has('nvim')
        Plug 'Shougo/defx.nvim'
    else
        Plug 'Shougo/defx.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

Plug 'mhinz/vim-startify'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'neoclide/coc.nvim', {'tag': '\*', 'do': { -> coc#util#install()}}
Plug 'Konfekt/FastFold'
Plug 'godlygeek/tabular'
Plug 'https://github.com/masukomi/vim-markdown-folding'
Plug 'plasticboy/vim-markdown'
Plug 'pbrisbin/vim-mkdir'
Plug 'qpkorr/vim-bufkill'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'tpope/vim-endwise', {'for': ['sh', 'bash', 'zsh', 'vim', 'markdown']}
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()
