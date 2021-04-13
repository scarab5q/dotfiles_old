
return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- completion program
  use 'hrsh7th/nvim-compe'

  -- vim surround
  use 'tpope/vim-surround'


  -- commenting plugin in lua
  use 'b3nj5m1n/kommentary'

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'


  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- my statusline
    -- config = function() require'my_statusline' end,
    -- some optional icons

    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- used for language server protocol
  use {'neovim/nvim-lspconfig'}


  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- nvim-tree
  use { 'kyazdani42/nvim-tree.lua' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'camspiers/lens.vim'
    --[[ , requires = {
    'camspiers/animate.vim'
    } ]]
  }
  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

end)
