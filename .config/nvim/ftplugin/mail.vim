set spell
" ftplugin/mail.vim
" movement changes
map j gj
map k gk

" formatting text
setlocal formatoptions=1
setlocal noexpandtab
setlocal wrap
setlocal linebreak

" spelling and thesaurus
setlocal spell spelllang=en_gb
set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt

" complete+=s makes autocompletion search the thesaurus
set complete+=s

function IsReply()
    if line('$') > 1
        :g/^>\s\=--\s\=$/,$ delete
        :%!par w72q
        :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
        :%s/^>*\zs\s\+$//e
        :1
        :put! =\"\n\n\"
        :1
    endif
endfunction

augroup mail_filetype
    autocmd!
    autocmd VimEnter /tmp/mutt* :call IsReply()
    autocmd VimEnter /tmp/mutt* :exe 'startinsert'
augroup END

setl tw=72
setl fo=aw
