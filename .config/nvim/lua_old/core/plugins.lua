---- ____  _             _           
----|  _ \| |_   _  __ _(_)_ __  ___ 
----| |_) | | | | |/ _` | | '_ \/ __|
----|  __/| | |_| | (_| | | | | \__ \
----|_|   |_|\__,_|\__, |_|_| |_|___/
----               |___/             

--local execute = vim.api.nvim_command
--local fn = vim.fn
--local empty = fn.empty
--local glob = fn.glob

--local packer = nil
--local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

--if empty(glob(install_path)) > 0 then
--  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
--  execute 'packadd! packer.nvim'
--end

---- vim.cmd [[packadd! packer.nvim]]
---- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged

--local  plugins = {}
--vim.cmd [[ autocmd BufWritePost packer.lua PackerCompile ]]

--return require('packer').startup({function()
--  print("hello people!!")

--  -- {{{ packer.nvim
--  use {'wbthomason/packer.nvim', opt = true}
--  -- }}}
--  -- {{{ telescope
--  use {
--    'nvim-telescope/telescope.nvim',
--    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
--  }
--  -- }}}


--  use {
--    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
--    'nvim-treesitter/nvim-treesitter-textobjects'
--  }
--  -- use 'neovim/nvim-lspconfig'
--  use 'Shougo/defx.nvim'
--  use 'roxma/nvim-yarp'
--  use 'roxma/vim-hug-neovim-rpc'
--  use {'vlime/vlime', rtp = 'vim/'}

--  use 'justinmk/vim-dirvish'
--  use {'neoclide/coc.nvim', branch = 'release'}
--  use 'https://github.com/kshenoy/vim-signature'
--  --use 'zxqfl/tabnine-vim'
--  use 'tpope/vim-repeat'
--  use 'reedes/vim-pencil' -- Super-powered writing things
--  -- use 'tpope/vim-abolish' -- Fancy abbreviation replacements
--  use 'junegunn/limelight.vim' -- Highlights only active paragraph
--  use 'junegunn/goyo.vim' -- Full screen writing mode
--  use 'reedes/vim-lexical' -- Better spellcheck mappings
--  use 'reedes/vim-litecorrect' -- Better autocorrections
--  use 'reedes/vim-textobj-sentence' -- Treat sentences as text objects
--  -- use 'reedes/vim-wordy' -- Weasel words and passive voice


--  -- use { 'challenger-deep-theme/vim',  as = 'challenger-deep' }
--  -- use 'vimwiki/vimwiki'
--  use 'christoomey/vim-tmux-navigator'
--  -- use 'fmcchrish/nnn.vim'
--  -- use 'mhinz/vim-startify'
--  -- use 'puremourning/vimspector'
--  -- use 'Shougo/neco-vim'
--  -- use 'neoclide/coc-neco'
--  -- use 'dylanaraps/wal.vim'
--  -- use 'MattesGroeger/vim-bookmarks'
--  -- use 'rust-lang/rust.vim'

--  -- JavaScript {{{
--  use 'jparise/vim-graphql'
--  -- }}}

--  -- TypeScript {{{
--  use { 'gko/yats.vim', ft = 'typescript' }
--  -- }}}

--  -- JSX {{{
--  use { 'MaxMEllon/vim-jsx-pretty', ft = { 'javascript', 'typescript', 'typescriptreact' } }
--  -- }}}

--  -- Markdown
--  use { 'jkramer/vim-checkbox', ft = 'markdown' }
--  use { 'plasticboy/vim-markdown', ft = 'markdown' }
--  use 'editorconfig/editorconfig-vim'

--  -- use 'norcalli/nvim_utils'
--  use 'ryanoasis/vim-devicons'
--  use 'tpope/vim-fugitive'
--  use 'terryma/vim-multiple-cursors'
--  use 'Chiel92/vim-autoformat'
--  use 'lucc/nvimpager'
--  use 'alvan/vim-closetag'
--  -- use 'tpope/vim-vinegar'
--  use 'Shougo/denite.nvim'
--  use 'gioele/vim-autoswap'
--  use 'osyo-manga/vim-anzu'
--  use 'haya14busa/is.vim'
--  use 'junegunn/vim-easy-align'
--  use 'mcchrish/nnn.vim'
--  use 'jiangmiao/auto-pairs'
--  use 'airblade/vim-gitgutter'
--  use 'majutsushi/tagbar'
--  use 'roman/golden-ratio'
--  use 'itchyny/lightline.vim'
--  use 'scrooloose/nerdtree'
--  use 'tpope/vim-surround'
--  use 'junegunn/fzf'  
--  use 'junegunn/fzf.vim'
--  -- use 'Xuyuanp/nerdtree-git-plugin'
--  use 'takac/vim-hardtime'
--  use 'haya14busa/incsearch.vim'
--  use 'powerman/vim-plugin-AnsiEsc'
--  use 'haya14busa/vim-asterisk'
--  use 'tpope/vim-sensible'
--  use 'junegunn/seoul256.vim'
--  use 'tpope/vim-commentary'
--  use 'neomake/neomake'
--  use 'lervag/vimtex'
--  use 'Konfekt/FastFold'
--  use 'godlygeek/tabular'
--  use 'rafi/awesome-vim-colorschemes'
--  use {'tpope/vim-endwise', ft = { 'sh', 'bash', 'zsh', 'vim', 'markdown' }}

--  -- Fennel {{{
--  use{ 'Olical/aniseed'}
--  use 'bakpakin/fennel.vim' 
--  -- }}}

--  -- clojure
--  use 'tpope/vim-fireplace'
--  use 'tpope/vim-salve'
--  -- use 'bhurlow/vim-parinfer'
--  use 'guns/vim-sexp'
--  -- use 'tpope/vim-sexp-mappings-for-regular-people'

--  use 'Olical/conjure'

--  use 'vim-syntastic/syntastic'

--end,
--config = {
--  display = {
--    open_fn = require"packer.util".float
--  }
--}

--})


