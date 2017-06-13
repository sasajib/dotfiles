" vim-plug configuration
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree'
Plug 'mikelue/vim-maven-plugin'
Plug 'tfnico/vim-gradle'
Plug 'easymotion/vim-easymotion'
Plug 'nightsense/seabird' " 4 colorschemes
Plug 'Valloric/YouCompleteMe'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim' " syntax higlighting
Plug 'morhetz/gruvbox' " colorscheme
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

" vim-autoformat
let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=ansi -pcHs4"'
let g:formatters_cs = ['my_custom_cs']
au BufWrite * :Autoformat " autoformat at save


" Colors
" colorscheme deepblue
" colorscheme molokai
colorscheme gruvbox
" colorscheme aqua
set background=dark

syntax enable           " enable syntax processing
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2
set expandtab           " tabs are spaces

set nu                  " show line numbers
set showcmd             " show command (pressed keys) in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set ignorecase          " case insensitive search
set hlsearch            " highlight matches
" turn off search highlight (backslash + space)
nnoremap <leader><space> :nohlsearch<CR>

" use the system clipboard for copying and pasting outside vim
set clipboard=unnamedplus


set foldenable
set foldnestmax=10      " 10 nested fold max
set foldlevelstart=10   " open most folds by default
set foldmethod=syntax   " fold based on indent level
" space open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" always show at least one line above/below cursor
set scrolloff=1

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" highlight last inserted text (does it work?)
nnoremap gV `[v`]

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" set encoding
set encoding=utf-8
setglobal fileencoding=utf-8

" save session; open with vim -S
" nnoremap <leader>s :mksession<CR>

" CtrlP opens files in a new buffer
let g:ctrlp_switch_buffer = 0

" CtrlP respects changing the working directory
let g:ctrlp_working_path_mode = 0

" CtrlP uses Silver Searcher (ag) for faster search.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP ignore certain files
set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|o|so|dll)$',
  \ }


filetype indent on      " load filetype-specific indent files

" show tabs
set list
"set listchars=tab:>-     " > is shown at the beginning, - throughout
set listchars=tab:>-,trail:~,extends:>,precedes:<

" remove trailing whitespace before each file save
" https://github.com/ntpeters/vim-better-whitespace
autocmd BufWritePre * StripWhitespace


" recommended syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim Commentary for custom file types
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType html setlocal commentstring=\<b\>\<samp\>%s\<\/samp\>\<\/b\>

" NERDTree fold on ctrl+n
map <C-n> :NERDTreeToggle<CR>

" <F9> runs :make build
nnoremap <F9> :!clear<CR>:make build<CR>

" Stop YCM from asking whether or not to load config file every time
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


" YCM Rust semantic completion
" In this example, the rust source code zip has been extracted to
" /usr/local/rust/rustc-1.17.0
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.17.0/src'
