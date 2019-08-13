" Functions

" Here are all of the functions I have written or found so far



" FZF Command Wrapper


function! FzyCommand(choice_command, vim_command)
    try
        let output = system(a:choice_command . " | fzy ")
    catch /Vim:Interrupt/
        " Swallow errors from ^C, allow redraw! below
    endtry
    redraw!
    if v:shell_error == 0 && !empty(output)
        exec a:vim_command . ' ' . output
    endif
endfunction


" the following was taken from :
" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
set scrolloff=10 " any startup value you like
if !exists('*VCenterCursor')
    augroup VCenterCursor
        au!
        au OptionSet *,*.*
                    \ if and( expand("<amatch>")=='scrolloff' ,
                    \         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
                    \   au! VCenterCursor WinEnter,WinNew,VimResized|
                    \ endif
    augroup END
    function VCenterCursor()
        if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
            let s:default_scrolloff=&scrolloff
            let &scrolloff=winheight(win_getid())/2
            au VCenterCursor WinEnter,WinNew,VimResized *,*.*
                        \ let &scrolloff=winheight(win_getid())/2
        else
            au! VCenterCursor WinEnter,WinNew,VimResized
            let &scrolloff=s:default_scrolloff
        endif
    endfunction
endif

nnoremap <leader>zz :call VCenterCursor()<CR>

" NERDTreeSync

function! NerdTree()
    if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
        echom "yes"
    else
        echom "no"
    endif
endfunction

nnoremap <leader>tl :call IsNerdTreeEnabled()<CR>

" FZF Buflist

function! s:buflist()
redir => ls
silent ls
redir END
return split(ls, '\n')
endfunction



" WordProcessor

func! WordProcessor()

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

endfu
com! WP call WordProcessor()

" ReloadVim

func! ReloadVim()
if has('nvim')
echom "sourcing init.vim"
source ~/.config/nvim/init.vim
else
source ~/.config/nvim/rc/vimrc_copy
endif
endfu

command! Reload call ReloadVim()

set splitbelow
tnoremap kj <C-\><C-n>
command! -nargs=* Te split | resize 20 | terminal <args>
command! -nargs=* VTe vsplit | resize 20 | terminal <args>


