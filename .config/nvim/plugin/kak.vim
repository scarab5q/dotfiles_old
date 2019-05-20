
" "  _  __    _    _  _____  _   _ _   _ _____ 
" " | |/ /   / \  | |/ / _ \| | | | \ | | ____|
" " | ' /   / _ \ | ' / | | | | | |  \| |  _|  
" " | . \  / ___ \| . \ |_| | |_| | |\  | |___ 
" " |_|\_\/_/   \_\_|\_\___/ \___/|_| \_|_____|
                                           

" let g:kak_style = 0

" " autocmd BufEnter * :call KakMode()
" let g:a_user_bind = maparg('a', 'n') 
" let g:b_user_bind = maparg('b', 'n')
" let g:c_user_bind = maparg('c', 'n')
" let g:d_user_bind = maparg('d', 'n')
" let g:e_user_bind = maparg('e', 'n')
" let g:f_user_bind = maparg('f', 'n')
" let g:g_user_bind = maparg('g', 'n')
" let g:h_user_bind = maparg('h', 'n')
" let g:i_user_bind = maparg('i', 'n')
" let g:j_user_bind = maparg('j', 'n')
" let g:k_user_bind = maparg('k', 'n')
" let g:l_user_bind = maparg('l', 'n')
" let g:m_user_bind = maparg('m', 'n')
" let g:n_user_bind = maparg('n', 'n')
" let g:o_user_bind = maparg('o', 'n')
" let g:p_user_bind = maparg('p', 'n')
" let g:q_user_bind = maparg('q', 'n')
" let g:r_user_bind = maparg('r', 'n')
" let g:s_user_bind = maparg('s', 'n')
" let g:t_user_bind = maparg('t', 'n')
" let g:u_user_bind = maparg('u', 'n')
" let g:v_user_bind = maparg('v', 'n')
" let g:w_user_bind = maparg('w', 'n')
" let g:x_user_bind = maparg('x', 'n')
" let g:y_user_bind = maparg('y', 'n')
" let g:z_user_bind = maparg('z', 'n')
" let g:exclamationmark_user_bind = maparg('!', 'n')
" let g:doublequote_user_bind = maparg('"', 'n')
" let g:dollar_user_bind = maparg('$', 'n')
" let g:ampersand_user_bind = maparg('&', 'n')
" let g:opening_bracket_user_bind = maparg('(', 'n')
" let g:closing_bracket_user_bind = maparg(')', 'n')
" let g:asterisk_user_bind = maparg('*', 'n')
" let g:caret_user_bind = maparg('^', 'n')
" let g:underscore_user_bind = maparg('_', 'n')
" let g:minus_user_bind = maparg('-', 'n')
" let g:plus_user_bind = maparg('+', 'n')
" let g:equals_user_bind = maparg('=', 'n')
" let g:pipe_user_bind = maparg('|', 'n')
" let g:backslash_user_bind = maparg('\', 'n')
" let g:less_than_user_bind = maparg('<', 'n')
" let g:greaterthan_user_bind = maparg('>', 'n')
" let g:comma_user_bind = maparg(',', 'n')
" let g:dot_user_bind = maparg('.', 'n')
" let g:questionmark_user_bind = maparg('?', 'n')
" let g:forwardslash_user_bind = maparg('/', 'n')
" let g:at_user_bind = maparg('@', 'n')
" let g:tilde_user_bind = maparg('~', 'n')
" let g:hashtag_user_bind = maparg('#', 'n')
" let g:closing_curly_bracket_user_bind = maparg('{', 'n')
" let g:closing_curly_bracket_user_bind = maparg('}', 'n')
" let g:opening_square_bracket_user_bind = maparg('[', 'n')
" let g:closing_square_bracket_user_bind = maparg(']', 'n')
" let g:weird_apostrophe_user_bind = maparg('`', 'n')
" let g:semicolon_user_bind = maparg(';', 'n')

" if !exists("g:kak_blacklist")
"     let g:kak_blacklist = ""
" endif


" func! KakMode() 
"     let b:buffername = bufname('')
"     if g:kak_style==1 && b:buffername !~ 'NERD.*\|help'
"         echo "Kak mode is on and buffername is" + b:buffername
"         " nnoremap b:buffername w vw
"         " vnoremap b:buffername w <esc>vw
"         " nnoremap b:buffername W 
"         " nnoremap b:buffername j vj
"         " vnoremap b:buffername j <esc>vj
"         " nnoremap b:buffername k vk
"         " vnoremap b:buffername k <esc>vj
"         " nnoremap b:buffername h vh
"         " vnoremap b:buffername h <esc>vj
"         " nnoremap b:buffername l vl
"         " vnoremap b:buffername l <esc>vj
"         " nnoremap b:buffername w vw
"         " vnoremap b:buffername w <esc>vw
"         " nnoremap b:buffername W 
"         " nnoremap b:buffername j vj
"         " vnoremap b:buffername j <esc>vj
"         " nnoremap b:buffername J vj
"         " vnoremap b:buffername J j
"         " nnoremap b:buffername k vk
"         " vnoremap b:buffername k <esc>vj
"         " nnoremap b:buffername h vh
"         " vnoremap b:buffername h <esc>vj
"         " nnoremap b:buffername l vl
"         " vnoremap b:buffername l <esc>vj
        
        
"         map <A-j> J
"         nmap <A-i> vi 
"     else 
"         echo "Kak mode is on and buffername is b:buffername"
"         " nnoremap b:buffername a g:a_user_bind
"         " nnoremap b:buffername b g:b_user_bind
"         " nnoremap b:buffername c g:c_user_bind
"         " nnoremap b:buffername d g:d_user_bind
"         " nnoremap b:buffername e g:e_user_bind
"         " nnoremap b:buffername f g:f_user_bind
"         " nnoremap b:buffername g g:g_user_bind
"         " nnoremap b:buffername h g:h_user_bind
"         " nnoremap b:buffername i g:i_user_bind
"         " nnoremap b:buffername j g:j_user_bind
"         " nnoremap b:buffername k g:k_user_bind
"         " nnoremap b:buffername l g:l_user_bind
"         " nnoremap b:buffername m g:m_user_bind
"         " nnoremap b:buffername n g:n_user_bind
"         " nnoremap b:buffername o g:o_user_bind
"         " nnoremap b:buffername p g:p_user_bind
"         " nnoremap b:buffername q g:q_user_bind
"         " nnoremap b:buffername r g:r_user_bind
"         " nnoremap b:buffername s g:s_user_bind
"         " nnoremap b:buffername t g:t_user_bind
"         " nnoremap b:buffername u g:u_user_bind
"         " nnoremap b:buffername v g:v_user_bind
"         " nnoremap b:buffername w g:w_user_bind
"         " nnoremap b:buffername x g:x_user_bind
"         " nnoremap b:buffername y g:y_user_bind
"         " nnoremap b:buffername z g:z_user_bind
"         " nnoremap w
"     endif
" endfunc

" " let g:exclamationmark_user_bind = maparg('!', 'n')
" " let g:doublequote_user_bind = maparg('"', 'n')
" " let g:dollar_user_bind = maparg('$', 'n')
" " let g:ampersand_user_bind = maparg('&', 'n')
" " let g:opening_bracket_user_bind = maparg('(', 'n')
" " let g:closing_bracket_user_bind = maparg(')', 'n')
" " let g:asterisk_user_bind = maparg('*', 'n')
" " let g:caret_user_bind = maparg('^', 'n')
" " let g:underscore_user_bind = maparg('_', 'n')
" " let g:minus_user_bind = maparg('-', 'n')
" " let g:plus_user_bind = maparg('+', 'n')
" " let g:equals_user_bind = maparg('=', 'n')
" " let g:pipe_user_bind = maparg('|', 'n')
" " let g:backslash_user_bind = maparg('\', 'n')
" " let g:less_than_user_bind = maparg('<', 'n')
" " let g:greaterthan_user_bind = maparg('>', 'n')
" " let g:comma_user_bind = maparg(',', 'n')
" " let g:dot_user_bind = maparg('.', 'n')
" " let g:questionmark_user_bind = maparg('?', 'n')
" " let g:forwardslash_user_bind = maparg('/', 'n')
" " let g:at_user_bind = maparg('@', 'n')
" " let g:tilde_user_bind = maparg('~', 'n')
" " let g:hashtag_user_bind = maparg('#', 'n')
" " let g:closing_curly_bracket_user_bind = maparg('{', 'n')
" " let g:closing_curly_bracket_user_bind = maparg('}', 'n')
" " let g:opening_square_bracket_user_bind = maparg('[', 'n')
" " let g:closing_square_bracket_user_bind = maparg(']', 'n')
" " let g:weird_apostrophe_user_bind = maparg('`', 'n')
" " let g:semicolon_user_bind = maparg(';', 'n')
" "     let g:kak_blacklist = ""
