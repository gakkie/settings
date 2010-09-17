" ----------------------------
" color settings
" ----------------------------
syntax on
highlight LineNr ctermfg=darkyellow
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey
highlight SpecialKey ctermfg=grey
highlight Comment ctermfg=Cyan
" for ZENKAKU Space
highlight ZenkakuSpace cterm=underline ctermbg=white guibg=white
match ZenkakuSpace /　/

" ----------------------------
"  Japanese Language
" ----------------------------
"set encoding=japan
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
" for utf-8
set termencoding=utf-8
" for euc-jp
"set termencoding=euc-jp

" ----------------------------
"  Search settings
" ----------------------------
set ignorecase
set smartcase
set hlsearch
set incsearch

" ----------------------------
"  misc settings
" ----------------------------
set ts=4 sw=4
set softtabstop=4
set expandtab
set nu
set title
set showmatch
set list
"set listchars=tab:\ \ ,extends:<,trail:\
set listchars=tab:\ \ ,extends:<
set laststatus=2
set scrolloff=5
set autowrite
"set wildmode=full:list
set wildmode=longest,list,full
set statusline=[%L]\ %f\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L
"set backupdir=$HOME/.backup
"set whichwrap=b,s,h,l,<,>,[,]
set backspace=2
set browsedir=current
set nrformats=alpha
set ruler
set showcmd
set nobackup
set smartindent

set path^=**


" ----------------------------
"  map settings
" ----------------------------
autocmd! BufNewFile,BufRead * nnoremap <buffer> <silent> L :set hlsearch!<Enter>

" ----------------------------
"  file type settings
" ----------------------------
"au FileType perl call PerlType()
filetype plugin indent on
autocmd! BufRead,BufNewFile *.inc set filetype=php
autocmd! BufRead,BufNewFile *.cgi set filetype=perl
autocmd! BufRead,BufNewFile *.pl set filetype=perl
autocmd! BufRead,BufNewFile *.pass setlocal nobackup
autocmd! BufNewFile,BufRead *.as set filetype=actionscript
autocmd! BufNewFile,BufRead *.mxml set filetype=mxml
autocmd! BufNewFile,BufRead *.ctp set filetype=php
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

" ----------------------------
"  plugins
" ----------------------------
" bufferedlist.vim
:map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
hi BufferNormal term=NONE ctermfg=black cterm=NONE 

set clipboard=unnamed

" project.vim
let g:proj_window_width=30

" ----------------------------
"  lang settings - php
" ----------------------------
let php_folding = 1
let php_htmlInSgrints = 1
