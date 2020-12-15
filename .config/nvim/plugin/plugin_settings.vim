

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

let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }


let g:vimspector_enable_mappings = 'HUMAN'

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

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

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

"*********
" coc.nvim
"*********

" set shell=/bin/sh
set hidden
set nobackup
set cmdwinheight=2
set signcolumn=yes

" imap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



"******************
" vim-wiki settings
"******************

let g:vimwiki_map_prefix = '<leader>W'
let g:vimwiki_list = [{'path': '~/my_notes/notes/',
                      \ 'path_html': '~/my_notes/html',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


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

" set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.node_modules,public[[dir]]
" let g:NERDTreeIgnore = ['^build$']
" let g:NERDTreeIgnore = ['^node_modules$']

 
"*************
" ALE Settings
"*************
let g:ale_open_list = 1


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


