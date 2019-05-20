" MIT License
"
" Copyright (c) 2019 initmd
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" https://github.com/initmd/init.md

function! s:findBlockStart() abort
  let s:blockStart = index(s:vimrc, "```vim", s:currentPosition, 1)

  return s:blockStart
endfunction

function! s:removeNonCode() abort
  let s:currentPosition = 0

  while s:findBlockStart() != -1
    call remove(s:vimrc, s:currentPosition, s:blockStart)

    let s:currentPosition = index(s:vimrc, "```")
  endwhile

  call remove(s:vimrc, s:currentPosition, -1)
endfunction

" initmd#init({path} [, {forceUpdate}])
function! initmd#init(path, ...) abort
  let l:initfile = fnamemodify(a:path, ":p:h") . "/." . 
                 \ fnamemodify(a:path, ":p:t") . "_initmd.vim"

  if filereadable(l:initfile)
      call delete(l:initfile)
  endif
  if get(a:, 1, 0) || !filereadable(l:initfile)
    let s:vimrc = readfile(a:path)

    call s:removeNonCode()
    call writefile(s:vimrc, l:initfile)
  endif

  if !exists("$MDVIMRC")
    let $MDVIMRC = a:path
  endif

  execute "source " . l:initfile
endfunction
