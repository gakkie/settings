function! AddDebugCodeC()
    let debug = "fprintf(stderr, \"%s %s:%d\\n\", __func__, __FILE__, __LINE__);"
    execute "normal O" . debug
endfunction

map <silent> <F5> :call AddDebugCodeC()<CR>
