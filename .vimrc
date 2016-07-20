" NeoBundle stuff ------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'enomsg/vim-haskellConcealPlus'
" set concealcursor=nciv

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on   " load filetype-specific indent files (i.e. ~/.vim/indent/python.vim)

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------------

syntax on
scriptencoding utf-8
set encoding=utf-8
set nu                  " show line numbers
set background=dark
set cursorline          " highlight current line
set autoread
au CursorHold * checktime

set ruler
set list listchars=tab:>-,trail:¤
highlight Cursorline cterm=bold term=bold

" Colorscheme
colorscheme molokai

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 4 spaces
set expandtab           " tabs are spaces
set shiftwidth=4
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces a TAB inserts

set wildmenu            " visual autocomplete for command menu

" Linebreak on 500 characters
" set lbr
" set tw=500

"set ai "Auto indent
"set si "Smart indent
" set wrap "Wrap lines

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase


set incsearch           " search as characters are entered
set hlsearch            " highlight search matches

nnoremap <leader><space> :nohlsearch<CR> 


" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" YouCompleteMe global configuration file. Also, don't ask for confirmation
let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Always show the status line
set laststatus=2

" Let powerline know that python is installed
let g:powerline_pycmd = 'py3'

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

" Auto indent python code
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

map <buffer> <F7> :exec '!clear && qmake -project && qmake "QT += core widgets" && make && echo "Compiled" && ./exam ' shellescape(@%, 1)<cr>
map <buffer> <F8> :exec '!clear && python' shellescape(@%, 1)<cr>
map <buffer> <F9> :w <CR> :!clear && g++ -std=c++11 -o %< % && echo STDOUT: && ./%< && echo FILE: && if [ -f %<.out ]; then cat %<.out; else echo NULL; fi <CR>
map <buffer> <F10> :w <CR> :!clear && make <CR>
