" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END

autocmd BufEnter NERD* vertical resize 25

function! s:fasd_update() abort
  if empty(&buftype) || &filetype ==# 'dirvish'
    call jobstart(['fasd', '-A', expand('%:p')])
  endif
endfunction

augroup fasd
  autocmd!
  autocmd BufWinEnter,BufFilePost * call s:fasd_update()

  Plug 'reedes/vim-pencil' " Super-powered writing things
  Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
  Plug 'junegunn/limelight.vim' " Highlights only active paragraph
  Plug 'junegunn/goyo.vim' " Full screen writing mode
  Plug 'reedes/vim-lexical' " Better spellcheck mappings
  Plug 'reedes/vim-litecorrect' " Better autocorrections
  Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
  Plug 'reedes/vim-wordy' " Weasel words and passive voice

  augroup pencil
   autocmd!
   autocmd filetype markdown,mkd call pencil#init()
       \ | call lexical#init()
       \ | call litecorrect#init()
       \ | setl spell spl=en_us fdl=4 noru nonu nornu
       \ | setl fdo+=search
  augroup END

 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'hard'
   let g:pencil#textwidth = 80
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}
augroup ENDau BufRead,BufNewFile *.md setlocal textwidth=80

set nocompatible
filetype plugin on       " may already be in your .vimrc

augroup pencil
  autocmd!
  autocmd FileType vimwiki,markdown,mkd,latex,tex,text call pencil#init({ 'wrap': 'soft' })
augroup END

" Universal auto location list popup
" Cursor considered held depending on updatetime
" autocmd CursorHold * call s:AutoToggleLocList()
" autocmd QuitPre * if empty(&bt) | lclose | endif

autocmd BufRead,BufWritePre *sh normal gg=G
