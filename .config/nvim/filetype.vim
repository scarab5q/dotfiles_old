augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail

  " NASM 
  autocmd BufREad,BufNewFile *.asm set filetype=nasm
augroup END
