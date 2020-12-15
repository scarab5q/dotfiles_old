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
Plug 'vlime/vlime', {'rtp': 'vim/'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/kshenoy/vim-signature'
"Plug 'zxqfl/tabnine-vim'
Plug 'tpope/vim-repeat'
Plug 't9md/vim-choosewin' 
Plug 'reedes/vim-pencil' " Super-powered writing things
Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
Plug 'junegunn/limelight.vim' " Highlights only active paragraph
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'reedes/vim-lexical' " Better spellcheck mappings
Plug 'reedes/vim-litecorrect' " Better autocorrections
Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plug 'reedes/vim-wordy' " Weasel words and passive voice


" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mcchrish/nnn.vim'
" Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
" Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco'
Plug 'dylanaraps/wal.vim'
Plug 'MattesGroeger/vim-bookmarks'
" Plug 'rust-lang/rust.vim'

" JavaScript {{{
    Plug 'jparise/vim-graphql'
" }}}

" TypeScript {{{
    Plug 'gko/yats.vim', { 'for': 'typescript' }
" }}}

" JSX {{{
    Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'typescript', 'typescriptreact'] }
" }}}

" Markdown
Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'editorconfig/editorconfig-vim'

Plug 'norcalli/nvim_utils'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'Chiel92/vim-autoformat'
Plug 'rogual/neovim-dot-app'
Plug 'lucc/nvimpager'
Plug 'alvan/vim-closetag'
Plug 'Shougo/denite.nvim'
Plug 'gioele/vim-autoswap'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/is.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'roman/golden-ratio'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'takac/vim-hardtime'
Plug 'haya14busa/incsearch.vim'
Plug 'majutsushi/tagbar'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'godlygeek/tabular'
" Plug 'https://github.com/masukomi/vim-markdown-folding'
Plug 'plasticboy/vim-markdown'
Plug 'roxma/nvim-yarp'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'reedes/vim-pencil'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-endwise', {'for': ['sh', 'bash', 'zsh', 'vim', 'markdown']}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'junegunn/goyo.vim'

" clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'bhurlow/vim-parinfer'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Plug 'Olical/conjure'

Plug 'vim-syntastic/syntastic'

call plug#end()

" Define Coc Extensions Here
let g:coc_global_extensions = ['coc-tsserver',
                              \'coc-diagnostic',
                              \'coc-json',
                              \'coc-css' ,
                              \'coc-python',
                              \'coc-pyright',
                              \'coc-yaml',
                              \'coc-vimlsp',
                              \'coc-highlight',
                              \'coc-emmet',
                              \'coc-rls',
                              \'coc-rust-analyzer',
                              \'coc-lists',
                              \'coc-texlab',
                              \'coc-git',
                              \'coc-yank',
                              \'coc-markdownlint',
                              \'coc-gitignore',
                              \'coc-pairs',
                              \'coc-sh',
                              \'coc-terminal',
                              \'coc-docker',
                              \'coc-github',
                              \'coc-snippets',
                              \'https://github.com/xabikos/vscode-javascript',
                              \]


" Auto loclist toggler
" re-uses existign syntastic vars to avoid var duplication
" function! s:AutoToggleLocList()
"   let lastwinnr = winnr()
"   if len(getloclist(winnr()))
"     if g:syntastic_auto_loc_list == 5
"       let loclength = len(getloclist(winnr()))
"       if loclength > g:syntastic_loc_list_height
"         let loclength = g:syntastic_loc_list_height
"       endif
"       exe 'lopen '.loclength

    

"       if lastwinnr != winnr() | exe lastwinnr.' wincmd w' | endif
"     endif
"   else
"     if g:syntastic_auto_loc_list > 0
"       lclose
"     endif
"   endif
" endfunction

