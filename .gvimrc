if has('gui_macvim')
    set transparency=10
    set imdisable
    colorscheme evening
    "set macatsui
    set antialias
    autocmd! BufNewFile,BufRead * highlight ZenkakuSpace guibg=white
endif
winpos 200 0
winsize 150 50
set columns=180
set lines=50
"nmap j gj
"nmap k gk
