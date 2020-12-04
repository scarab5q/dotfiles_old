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

augroup END

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
