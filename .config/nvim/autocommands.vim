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

