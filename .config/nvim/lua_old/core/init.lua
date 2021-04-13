local o = vim.o 
local fn = vim.fn
local g = vim.g

local global = require('core.global')

require('packer._treesitter')
require('packer._telescope')
require('packer._lsp_config')

vim.cmd('colo gruvbox')

local options = require('core.options')
local binds = require('core.binds')
options:load_options()



