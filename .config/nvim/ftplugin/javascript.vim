setlocal autoread
au CursorHold * checktime  

let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

