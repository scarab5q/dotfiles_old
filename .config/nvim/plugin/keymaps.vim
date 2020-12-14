

"  __  __                   _
" |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
" | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
" | |  | | (_| | |_) | |_) | | | | | (_| \__ \
" |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"              |_|   |_|            |___/

"**************
"  REMAP ; to :
"**************
nnoremap ; :
nnoremap : ;


"*************
" swap ' and `
"*************

nnoremap ' `
nnoremap ` '

"**********************************
" Allow Terminal to use the Alt-key
"**********************************
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

set timeout ttimeoutlen=100



"****************
" Leader to space
"****************


nnoremap <SPACE> <Nop>

let mapleader = "\<Space>"


nnoremap <leader><leader> <leader>

"************
" choose win
"************
nmap -- <Plug>(choosewin)
let g:choosewin_overlay_enable = 1


"**************
"  Kakoune Undo
"**************
nnoremap U <C-r>


"******************
" Kakoune use Macro
"******************
nnoremap Q @q



"********************************* 
" File system bindings (Space + F)
"********************************* 

nmap <leader>fs ;w<CR>
nmap <leader>ff ;CtrlSpace O<CR>

"*******************************
" Vimspector (Debugger) bindings
"*******************************

nmap <leader>vs ;call vimspector#Launch()<CR>``


"*********************
" File Editor Bindings
"*********************
nnoremap <leader>fed :tabedit<CR>: tcd ~/.config/nvim/<CR>: e ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>fes :source ~/.config/nvim/init.vim<CR>



"***************
" Tab Management
"***************
nnoremap <leader>tN :tabedit<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tw :tcd %:h<CR>
nnoremap <leader>tN :tabedit<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>


"*************************************
" Plugin management bindings (space + F)
"*************************************


map <leader>pi ;PlugInstall<CR>
map <leader>pU ;UpdateRemotePlugins<CR>
map <leader>pu ;PlugUpdate<CR>
map <leader>pc ;PlugClean<CR>



"*********************
" clipboard management
"*********************
nmap <leader>cy "+
nmap <leader>cp "*


"**********
" Searching
"**********

nnoremap / /\v

"******************
" terminal bindings
"******************

" create terminal
nnoremap <leader>! :Te<CR>

" escape from terminal mode
tnoremap kj <C-\><C-n>


map <Leader>bt ;TagbarToggle<CR>
                \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).

"*************
" FZF Bindings
"*************

nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fr :Rg<CR>
nnoremap <silent> <Leader>ft :Tags<CR>
nnoremap <silent> <Leader>fw :Windows<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <leader>fg :Gi
nnoremap <silent> <Leader>fm :Marks<CR>


" nnoremap <silent> <Leader>fb :call fzf#run({
nnoremap <leader>fF :FzfFasdFile<CR>
nnoremap <leader>fF :FzfFasdDir<CR>

"*********************
" FZF.vim key bindings
"*********************

nnoremap <leader> s

"*********************
" Easy Motion Bindings
"*********************

noremap \f f
map -f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
" map ,L <Plug>(easymotion-d-jk)
map \h <Plug>(easymotion-backward)
map \l <Plug>(easymotion-lineforward)
noremap \k <Plug>(easymotion-k) 
" nnoremap \j j
" nmap jlk <Plug>(easymotion-overwin-line)
nmap -j <Plug>(easymotion-j)
nmap \L <Plug>(easymotion-overwin-line)
nmap \w <Plug>(easymotion-overwin-w)zz

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion let g:EasyMotion_smartcase = 1
let g:hardtime_allow_different_key = 1
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``


"*****************************
" Old Language Client Bindings
"*****************************
"*****************************

"   nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"   nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"   nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"   nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"   nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"   nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" inoremap <silent><expr> <TAB>
"       \ deoplete#mappings#manual_complete()





"******************
" NERDTree_Bindings
"******************

" map <leader>0 :NnnPicker '%:p:h'<CR> 
" nnoremap <leader>0 :NERDTreeToggle %:p:h<CR>
nnoremap <leader>y :NERDTreeToggle %:p:h<CR>




"********************************
" reading in an external command 
"********************************
nnoremap <A-1> :read ! 
nnoremap <C-!> !



"******************************
" Rebinds of $ and ^ to L and H
"******************************
noremap H ^
noremap L g$

" A Whole bunch of Heressey


"************************
" Center Cursor on screen
"************************


" nnoremap j jzz
" nnoremap k kzz

"****************
" Buffer Bingings
"****************

nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>bh :Bn<CR>
nnoremap <silent> <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
" nnoremap <silent> <Leader>bh BB<CR>
nnoremap <silent> <Leader>bl :BF<CR>
nnoremap <silent> <leader>qq :wqall<CR>
nnoremap <silent> <leader>qQ :qall!<CR>
" nnoremap <C-f> <C-b>
" nnoremap <C-b> <C-f>


"***************
" Escape with jk
"***************

inoremap jk <Esc>
inoremap kj <Esc>



"*****************
" Asterix Bindings
"*****************

map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
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
map gz# <Plug>(asterisk-gz#)



"*****************
" window commands 
"*****************

nnoremap <leader>w; :split<cr>
nnoremap <leader>w: :vsplit<cr>
" nnoremap <silent> <leader>wh :call MoveLeftOrNerdTree()<cr>
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>

nnoremap <silent> <leader>wh :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>wj :TmuxNavigateDown<cr>
nnoremap <silent> <leader>wk :TmuxNavigateUp<cr>
nnoremap <silent> <leader>wl :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" nnoremap <silent> <leader>wh <c-w>h
" nnoremap <silent> <leader>wl <c-w>l
" nnoremap <silent> <leader>wj <c-w>j
" nnoremap <silent> <leader>wk <c-w>k
nnoremap <silent> <leader>wd :close<cr>
" nnoremap <silent> <leader>wx :BD<CR>:close<cr>



"****************
" buffer commands
"****************

map <Leader>bt ;TagbarToggle<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>bh :bn<CR>
nnoremap <silent> <Leader>bl :bp<CR>
" nnoremap <silent> <leader>bd :BD<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
" nnoremap <silent> <Leader>bh :BB<CR>

"*************
" nnn mappings
"*************

nnoremap <leader>n :NnnPicker '%:p:h'<CR>

"*****************
" Modeline Mapping
"*****************

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
