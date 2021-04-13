

--  __  __                   _
-- |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
-- | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
-- | |  | | (_| | |_) | |_) | | | | | (_| \__ \
-- |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
--              |_|   |_|            |___/

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
-- mappings

map("n", "<Leader>tf", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], {silent = true})
map("n", "<Leader>tb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], {silent = true})
map("n", "<Leader>th", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], {silent = true})
map("n", "<Leader>to", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]],  {silent = true})

--**************
--  REMAP ; to :
--**************
map('n', ';', ':')
map('n', ':', ';')


--*************
-- swap ' and `
--*************

map('n', "'", t'`')
map('n', t'`', t"'")


--****************
-- Leader to space
--****************


map('n', t'<SPACE>', t'<Nop>')
map('n', t'<leader><leader>', t'<leader>')


--**************
--  Kakoune Undo
--**************
map('n', t'U', t'<C-r>')


--******************
-- Kakoune use Macro
--******************
--TODO make kakMacro function that behaves just like Kakoune
map('n', t'Q', t'@@')



--********************************* 
-- File system bindings (Space + F)
--********************************* 

map('n', t'<leader>ts', t':w<CR>')
map('n', t'<leader>tes', t':luafile ' .. vim.fn.stdpath('config') .. '/init.lua<CR>')


--*******************************
-- Vimspector (Debugger) bindings
--*******************************

map('n', t'<leader>vs ;call', t'vimspector#Launch()<CR>``')


--*********************
-- File Editor Bindings
--*********************
map('n', t'<leader>fed :tabedit<CR>: tcd ~/.config/nvim/<CR>: e', t'~/.config/nvim/plugins.vim<CR>')
map('n', t'<leader>fes :source', t'~/.config/nvim/init.vim<CR>')



--***************
-- Tab Management
--***************
map('n', t'<leader>tN', t':tabedit<CR>')
map('n', t'<leader>td', t':tabclose<CR>')
map('n', t'<leader>tw', t':tcd %:h<CR>')
map('n', t'<leader>tN', t':tabedit<CR>')
map('n', t'<leader>tn', t':tabnext<CR>')
map('n', t'<leader>tp', t':tabprev<CR>')



-- Plugin management bindings (space + t)


map('n', t'<leader>ps', t':PackerSync<CR>')
map('n', t'<leader>pS', t':PackerStatus<CR>')
map('n', t"<leader>pu", t":PackerUpdate<CR>" )
map('n', t"<leader>pc", t":PackerClean<CR>" )



--*********************
-- clipboard management
--*********************
map('n', t'<leader>cy', t'"+')
map('n', t'<leader>cp', t'"*')


--**********
-- Searching
--**********

map('n', t'/', [[/\v]])

--******************
-- terminal bindings
--******************

-- create terminal
map('n', t'<leader>!', t':Te<CR>')

-- escape from terminal mode
map('t', t'kj', t'<C-\\><C-n>')



--*************
-- FZF Bindings
--*************

map('n', t'<Leader>ff', t':Files<CR>', {silent = true })
map('n', t'<Leader>fr', t':Rg<CR>', {silent = true })
map('n', t'<Leader>ft', t':Tags<CR>', {silent = true })
map('n', t'<Leader>fw', t':Windows<CR>', {silent = true })
map('n', t'<Leader>fb', t':Buffers<CR>', {silent = true })
map('n', t'<leader>fg', t':Gi', {silent = true })
map('n', t'<Leader>fm', t':Marks<CR>', {silent = true })


-- map('n', t'<Leader>fb :call', t'fzf#run({', {silent = true })
map('n', t'<leader>fF', t':FzfFasdFile<CR>')
map('n', t'<leader>fF', t':FzfFasdDir<CR>')

--*********************
-- FZF.vim key bindings
--*********************

map('n', t'<leader>', t's')



map('c', '$t', "<CR>:t''<CR>" )
map('c', '$T', t"<CR>:T''<CR>")
map('c', "$m", "<CR>:m''<CR>")
map( 'c', '$M', "<CR>:M''<CR>")
map( 'c', '$d', "<CR>:d<CR>``")

--******************************
-- Rebinds of $ and ^ to L and H
--******************************
map('n', t'H', t'^')
map('n', t'L', t'g$')


--****************
-- Buffer Bindings
--****************

map( 'n',  t'<Leader>bb', t':Buffers<CR>', { silent=true} )
map( 'n', t'<Leader>bh',t':Bn<CR>' , { silent = true } )
map( 'n', t'<leader>bd',t':bp<bar>sp<bar>bn<bar>bd<CR>' , { silent = true } )
-- map('n', t'<Leader>bh', t'BB<CR>', {silent = true })
map( 'n', t'<Leader>bl' , t':BF<CR>', {silent = true} )
map( 'n', t'<leader>qq', t':wqall<CR>', {silent = true})
map( 'n', t'<leader>qQ', t':qall!<CR>', {silent = true})
-- map('n', t'<C-f>', t'<C-b>')
-- map('n', t'<C-b>', t'<C-f>')


--***************
-- Escape with jk
--***************

map( 'i', 'jk', '<Esc>' )
map( 'i', 'kj', '<Esc>' )


--*****************
-- Asterix Bindings
--*****************

--[[ map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#) ]]



--*****************
-- window commands 
--*****************

map('n', t'<leader>w;', t':split<cr>')
map('n', t'<leader>w:', t':vsplit<cr>')

map('n', t'<leadr>wh', t'<c-w>h', {silent = true })
map('n', t'<leader>wl', t'<c-w>l', {silent = true })
map('n', t'<leader>wj', t'<c-w>j', {silent = true })
map('n', t'<leader>wk', t'<c-w>k', {silent = true })
map('n', t'<leader>wd', t':close<cr>', {silent = true })
map('n', t'<leader>wc', t':close<cr>', {silent = true })
--bmap('n', t'<leader>wx', t':BD<CR>:close<cr>', {silent = true })



--****************
-- buffer commands
--****************

map('n', t'<leader>bd', t':bd<CR>' )
map('n', t'<Leader>bh', t':bn<CR>' )
map('n', t'<Leader>bn', t':bn<CR>' )
map('n', t'<Leader>bl', t':bp<CR>' )
map('n', t'<Leader>bp', t':bp<CR>' )


-- LSP mappings
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

--*****************
-- Modeline Mapping
--*****************

map('n', t'<Leader>ml :call', t'AppendModeline()<CR>', {silent = true })
