local g = vim.g
local set = vim.o
local options = setmetatable({}, {__index = { global_local = {}, window_local = {} } })
local home = os.getenv('HOME')

g.mapleader = " "



function options:load_options()
	vim.api.nvim_command([[filetype indent on]]) 
	vim.api.nvim_command([[set smartindent]])
	vim.api.nvim_command([[set title titlestring=]])
	vim.api.nvim_command([[set inccommand=split]])
	vim.api.nvim_command([[set number              "show current line number]])

        vim.api.nvim_command([[set signcolumn=yes]])
	vim.api.nvim_command([[set relativenumber          "show relative line numbers]])
	vim.api.nvim_command([[set ignorecase]])
	vim.api.nvim_command([[set smartcase]])
	vim.api.nvim_command([[set hls]])
	vim.api.nvim_command([[set incsearch]])
	vim.api.nvim_command([[set showmatch]])
	vim.api.nvim_command([[set ic]])
	vim.api.nvim_command([[set hidden]])
	vim.api.nvim_command([[set showmatch]])
	vim.api.nvim_command([[set ai]])
	vim.api.nvim_command([[set winaltkeys=no]])
	vim.api.nvim_command([[set encoding=UTF-8]])
	vim.api.nvim_command([[set modeline "modeline"]])


	-- sets tab settings
	vim.api.nvim_command([[set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab]])

	-- set wildmenu
	vim.api.nvim_command([[set wildmode=list:longest,full]])

	vim.api.nvim_command([[set mouse=nv]])

	vim.api.nvim_command([[set nocompatible]])
	vim.api.nvim_command([[set splitbelow]])

	vim.api.nvim_command([[set fdm=marker]])

	vim.g.netrw_liststyle = 3;
	vim.g.netrw_browse_split = 4;
	vim.g.netrw_altv = 1;
	vim.g.netrw_winsize = 20;
	vim.g.netrw_banner = 0;



	vim.g.rustfmt_autosave = 1;

	-- let g:airline_theme='one';
	-- vim.g.airline.extensions.tabline.enabled = 1;
	-- vim.g.airline.extensions.tabline.fnamemod = ':t';
	vim.g.fzf_layout = { left = '~30%' };
	vim.g.fzf_layout = { down = '~40%' };

	-- let $FZF_DEFAULT_COMMAND =  "find - -path '-/\.-' -prune -o -path 'node_modules/--' -prune -o -path 'target/--' -prune -o -path 'dist/--' -prune -o  -type f -print -o -type l -print 2> /dev/null"
	-- let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
	vim.g.fzf_layout = { window = 'call FloatingFZF()' };


	vim.g.vimspector_enable_mappings = 'HUMAN';

	vim.g.tex_flavor  = 'latex';
	vim.g.tex_conceal = '';
	vim.g.vimtex_fold_manual = 1;
	vim.g.vimtex_latexmk_continuous = 1;
	vim.g.vimtex_compiler_progname = 'nvr';
	vim.g.vimtex_view_method = 'zathura';

	vim.g.vim_markdown_folding_disabled = 1;

	-- vim.g.pencil.wrapModeDefault = 'soft'   -- default is 'hard';

	vim.g.closetag_filenames = ".html,-.xhtml,-.phtml,-.php,-.jsx,-.js,-.ejs,-.vue";



	-------------------
	-- vim-wiki settings
	-------------------

	vim.g.vimwiki_map_prefix = '<leader>W';
	vim.g.vimwiki_list = {path= '~/my_notes/notes/',  path_html = '~/my_notes/html', syntax = 'markdown',  ext = '.md'}


	-------------------
	-- NERDTree Settings
	-------------------

	-- autocmd BufEnter NerdTree_- resize 20
	-- autocmd BufEnter - if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	-- autocmd FileType json syntax match Comment +\/\/.\+$+
	-- augroup ProjectDrawer
	--     autocmd!
	--     autocmd VimEnter - :NERDTree
	-- augroup END
	-- autocmd BufEnter NERD_tree_- nmap  d<CR> <CR> :NERDTreeToggle <CR>
	-- autocmd BufLeave NERD_tree_- unmap d<CR>

	-- set wildignore+=-.pyc,-.o,-.obj,-.svn,-.swp,-.class,-.hg,-.DS_Store,-.min.-,-.node_modules,public[[dir]]
	-- let g:NERDTreeIgnore = ['^build$'];
	-- let g:NERDTreeIgnore = ['^node_modules$'];


	--------------
	-- ALE Settings
	--------------
	vim.g.ale_open_list = 1;




	--------------
	-- nnn settings
	--------------

	-- vim.g.nnn.layout = { left = '~20%' } -- or right, up, down;
	-- vim.g.nnn.set_default_mappings = 0;
	-- vim.g.nnn.replace_netrw=1;





end

options:load_options()

return options

