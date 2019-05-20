

" autocmd VimEnter * UpdateRemotePlugins
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0


let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

let g:rustfmt_autosave = 1

" let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:fzf_layout = { 'left': '~30%' }
let g:fzf_layout = { 'down': '~40%' }
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1 " Smart case
" let g:deoplete#auto_complete_start_length = 1 " Stop bothering me
" let g:deoplete#sources = {}
" let g:deoplete#enable_refresh_always = 0 " Stop the weird sorting redraw
" 
 let g:deoplete#max_abbr_width = 0 " Allow for wide menu
" let g:deoplete#max_menu_width = 0 " Allow for tall menu
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

let g:vim_markdown_folding_disabled = 1

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }

hi link CtrlSpaceSearch IncSearch
let g:maplocalleader = ','
nnoremap <silent> <Space>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" nnoremap <silent> <C-space> :<c-u>WhichKey  '<C-Space>'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler

" \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
if executable("ag")
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1  " enable arrow keys in lists
call map#Keys('n', 'cwn', ':CtrlSpaceNewWorkspace<CR>') " keymap for new workspace with name (don't kill all buffers/tabs!)
call map#Keys('n', 'cws', ':CtrlSpaceSaveWorkspace<CR>') " keymap for saving workspace
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"



let g:CtrlSpaceUseTabline = 1
function! CWDTabline()
let tabline=''
let tabline.='%#TabLineFill#'
let tabline.='%=|'      "left/right separator
let tabline.='%#identifier#'
let tabline.='%.30(%{fnamemodify(getcwd(), ":~")}%)'
let tabline.='%*'
return tabline
endfunction


let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ejs,*.vue"


"*************
" vim-hardtime
"*************

let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = ["*CtrlSpace.*", "Nerd.*"]
let g:list_of_insert_keys = [""]
let g:list_of_normal_keys = ["h", "j", "k", "l",  "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<Backspace>","<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 3


"******************
" vim-wiki settings
"******************

let g:vimwiki_map_prefix = '<leader>W'


"******************
" NERDTree Settings
"******************

" autocmd BufEnter NerdTree_* resize 20
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd FileType json syntax match Comment +\/\/.\+$+
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :NERDTree
" augroup END
" autocmd BufEnter NERD_tree_* nmap  d<CR> <CR> :NERDTreeToggle <CR>
" autocmd BufLeave NERD_tree_* unmap d<CR>


"*******************
" winchoose settings
"*******************

let g:choosewin_label = 'HNEIOARSTDLUYQWFPGJZXCVBKM'
let g:choosewin_overlay_enable = 1

"*************
" nnn settings
"*************

let g:nnn#layout = { 'left': '~20%' } " or right, up, down
let g:nnn#set_default_mappings = 0
let g:nnn#replace_netrw=1


"**********************
" Golden View Settings 
"**********************


