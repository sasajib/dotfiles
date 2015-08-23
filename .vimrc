"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/sergiu/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/sergiu/.vim/bundle'))

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

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set encoding=utf-8

scriptencoding utf-8
syntax on
" au BufNewFile,BufRead *.rs set filetype=rust

set nu
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
highlight Cursorline cterm=bold term=bold
set list listchars=tab:>-,trail:Â¤

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

map <buffer> <F8> :exec '!clear && python' shellescape(@%, 1)<cr>
map <buffer> <F9> :w <CR> :!clear && g++ -std=c++11 -o %< % && echo STDOUT: && ./%< && echo FILE: && if [ -f %<.out ]; then cat %<.out; else echo NULL; fi <CR>

map <buffer> <F10> :w <CR> :!clear && g++ -std=c++11 -o %< % && cat input \| ./%< <CR>

:iabbrev </ </<C-X><C-O>

" html tags macros
let @h = '€khi<h2>€@7</h2>€kd'
let @p = '€khi<p>€@7</p>€kd'
let @l = '€khi<li>€@7</li>€kd'

