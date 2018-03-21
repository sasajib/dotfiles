" vim-plug configuration
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
" Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'mikelue/vim-maven-plugin'
Plug 'tfnico/vim-gradle'
Plug 'easymotion/vim-easymotion'
Plug 'nightsense/seabird' " 4 colorschemes
Plug 'Valloric/YouCompleteMe'
Plug 'rust-lang/rust.vim'
Plug 'syml/rust-codefmt'
Plug 'leafgarland/typescript-vim' " syntax higlighting
Plug 'cespare/vim-toml' " toml syntax
Plug 'morhetz/gruvbox' " colorscheme
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'SirVer/ultisnips'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'
Plug 'Lokaltog/powerline'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'bazelbuild/vim-bazel'
Plug 'artur-shaik/vim-javacomplete2' " java autocomplete
Plug 'jvirtanen/vim-octave'
Plug 'itchyny/lightline.vim'
Plug 'danro/rename.vim'
Plug 'vim-syntastic/syntastic'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags.
Plug 'google/vim-glaive'

" Initialize plugin system
call plug#end()

call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /usr/share/java/google-java-format/core/target/google-java-format-1.6-SNAPSHOT-all-deps.jar"


" google/vim-codefmt configs
Glaive codefmt clang_format_style='Google'
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }


let g:ycm_show_diagnostics_ui = 0

set laststatus=2 " Always show statusline
set t_Co=256  " Use 256 colours (Use this setting only if your terminal supports 256 colours)

" vim-autoformat configuration
let g:formatdef_google_style_cpp = '"clang-format --style=Google"'
let g:formatters_cpp = ['google_style_cpp']
let g:autoformat_verbosemode = 1
" au BufWrite * :Autoformat

" remove trailing whitespace before each file save
" https://github.com/ntpeters/vim-better-whitespace
" autocmd BufWritePre * StripWhitespace
nnoremap <leader>bb :Bazel build ...:all<CR>
nnoremap <leader>bt :Bazel test ...:all<CR>
nnoremap <leader>f :FormatCode<CR>
noremap <F3> :FormatCode<CR>
noremap <F4> :YcmCompleter FixIt<CR>
noremap <F5> :YcmCompleter GetType<CR>

" Colors
" colorscheme deepblue
" colorscheme molokai
colorscheme gruvbox
" colorscheme slate
" colorscheme primary
" colorscheme aqua
set background=dark

syntax enable           " enable syntax processing
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2
set expandtab           " tabs are spaces

set nu                  " show line numbers
set showcmd             " show command (pressed keys) in bottom bar
set cursorline          " highlight current line (highlight usually means underline, which is ugly)
hi CursorLine term=bold cterm=bold guibg=Grey40
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set ignorecase          " case insensitive search
set hlsearch            " highlight matches

" turn off search highlight (backslash + space)
nnoremap <leader><space> :nohlsearch<CR>

" http://vim.wikia.com/wiki/Resize_splits_more_quickly
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" use the system clipboard for copying and pasting outside vim
set clipboard=unnamedplus

set foldenable
set foldnestmax=10      " 10 nested fold max
set foldlevelstart=10   " open most folds by default
set foldmethod=syntax   " fold based on indent level
" space open/closes folds
nnoremap <space> za

" make scrolling work
set mouse=a

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" jk is escape
" inoremap jk <esc>

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

" blaze build and run in the right tmux pane
nnoremap <Leader>] :execute 'silent !tmux send-keys -t right C-c " clear && bazel build :main && time ./bazel-bin/main" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>[ :execute 'silent !tmux send-keys -t right C-c " clear && bazel run :main" C-m'<Bar>redraw!<C-M>

" octave run
nnoremap <Leader>o :execute 'silent !tmux send-keys -t right C-c " clear && octave-cli %" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>O :execute 'silent !tmux send-keys -t right C-c " clear && QT_SCALE_FACTOR=1 octave --persist %" C-m'<Bar>redraw!<C-M>


" repeat last command
nnoremap <Leader>r :execute 'silent !tmux send-keys -t right C-c " \!\!" C-m'<Bar>redraw!<C-M>


" cargo build && cargo run
nnoremap <Leader>cb :execute 'silent !tmux send-keys -t right C-c " clear && cargo build" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>cr :execute 'silent !tmux send-keys -t right C-c " clear && cargo run" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>ct :execute 'silent !tmux send-keys -t right C-c " clear && cargo test" C-m'<Bar>redraw!<C-M>


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
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Always use the same cache for CtrlP
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

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


" recommended syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options="--std=c++17"

let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ }

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
let g:ycm_global_ycm_extra_conf = '/home/sergiu/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'


" YCM Rust semantic completion
" In this example, the rust source code zip has been extracted to
" /usr/local/rust/rustc-1.17.0
" let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.17.0/src'
