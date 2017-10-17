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
colorscheme desert

" ----------------------------
"  Japanese Language
" ----------------------------
"set encoding=japan
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
"set fileencodings=cp932,utf-8,iso-2022-jp,euc-jp
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
set ts=2 sw=2
set softtabstop=2
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
"autocmd! BufRead,BufNewFile *.cgi set filetype=perl
autocmd! BufRead,BufNewFile *.pl set filetype=perl
autocmd! BufRead,BufNewFile *.pass setlocal nobackup
autocmd! BufNewFile,BufRead *.as set filetype=actionscript
autocmd! BufNewFile,BufRead *.mxml set filetype=mxml
autocmd! BufNewFile,BufRead *.rb set filetype=ruby
autocmd! BufNewFile,BufRead Gemfile set filetype=ruby
autocmd! BufNewFile,BufRead Guardfile set filetype=ruby
autocmd! BufNewFile,BufRead *.js set filetype=javascript
"autocmd! BufNewFile,BufRead *.scss set filetype=css
"autocmd! BufNewFile,BufRead *.ctp set filetype=php
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

" template settings
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.pl 0r $HOME/.vim/template/template.pl
autocmd BufNewFile *.c 0r $HOME/.vim/template/template.c
autocmd BufNewFile *.html 0r $HOME/.vim/template/template.html
autocmd BufNewFile *.rb 0r $HOME/.vim/template/template.rb
autocmd BufNewFile *.php 0r $HOME/.vim/template/template.php

" ----------------------------
"  plugins
" ----------------------------
" bufferedlist.vim
:map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
hi BufferNormal term=NONE ctermfg=white cterm=NONE 

set clipboard=unnamed

" project.vim
let g:proj_window_width=30

" ----------------------------
"  lang settings - php
" ----------------------------
let php_folding = 1
let php_htmlInSgrints = 1


noremap <Leader>W :silent !open %<CR>




"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/gakkie/.vim/bundle/repos/github.com/Shougo/dein.vim

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('/Users/gakkie/.vim/bundle')
" dein本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim'
    s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" deinの設定
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 設定ファイルを読み込む
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'

  " TOML設定ファイルを読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Required:
filetype plugin indent on
syntax enable


" indent-guidlineの設定
let g:indent_guides_enable_on_vim_startup = 1

" js/jsx
let g:jsx_ext_required = 0
