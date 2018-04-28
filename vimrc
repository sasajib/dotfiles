" vim-plug configuration
call plug#begin('~/.vim/plugged')                           " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)

Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'artur-shaik/vim-javacomplete2'                        " java autocomplete
Plug 'bazelbuild/vim-bazel'                                 " :Bazel
Plug 'cespare/vim-toml'                                     " toml syntax
Plug 'danro/rename.vim'                                     " :Rename new_name
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'                               " colorscheme pack
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'jvirtanen/vim-octave'                                 " octave/matlab syntax
Plug 'kien/ctrlp.vim'                                       " file browsing (Ctrl+P)
Plug 'mattn/emmet-vim'                                      " html
Plug 'mikelue/vim-maven-plugin'
Plug 'morhetz/gruvbox'                                      " colorscheme
Plug 'nightsense/seabird'                                   " 4 colorschemes
Plug 'ntpeters/vim-better-whitespace'                       " :StripWhitespace
Plug 'racer-rust/vim-racer'                                 " mostly included in YCM
Plug 'roxma/vim-tmux-clipboard'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'                                  " Ctrl+N for left-pane file explorer
Plug 'tfnico/vim-gradle'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'                                 " gcc (or gc in visual) comments code
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'                              " syntactic check

Plug 'google/vim-maktaba'                                   " Add maktaba and codefmt to the runtimepath.
Plug 'google/vim-codefmt'                                   " (codefmt must be installed before it can be used.)
Plug 'google/vim-glaive'                                    " Also add Glaive, which is used to configure codefmt's maktaba flags.

" Initialize plugin system
call plug#end()

call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /usr/share/java/google-java-format/core/target/google-java-format-1.6-SNAPSHOT-all-deps.jar"

" google/vim-codefmt configs; make sure the formatters are installed
Glaive codefmt clang_format_style='Google'
augroup autoformat_settings
  autocmd FileType bzl           AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto   AutoFormatBuffer clang-format
  autocmd FileType dart          AutoFormatBuffer dartfmt
  autocmd FileType gn            AutoFormatBuffer gn
  autocmd FileType go            AutoFormatBuffer gofmt
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java          AutoFormatBuffer google-java-format
  autocmd FileType python        AutoFormatBuffer yapf      " alternative: autopep8
  autocmd FileType rust          AutoFormatBuffer rustfmt
augroup END

let g:lightline = { 'colorscheme': 'seoul256' }

let g:ycm_show_diagnostics_ui = 0

set laststatus=2      " Always show statusline
set t_Co=256          " Use 256 colours (Use this setting only if your terminal supports 256 colours)

" vim-autoformat configuration
let g:formatdef_google_style_cpp = '"clang-format --style=Google"'
let g:formatters_cpp = ['google_style_cpp']
let g:autoformat_verbosemode = 1

" remove trailing whitespace before each file save
" https://github.com/ntpeters/vim-better-whitespace
" autocmd BufWritePre * StripWhitespace

" Colors
colorscheme deepsea
" colorscheme molokai
" colorscheme gruvbox
set background=dark

syntax enable           " enable syntax processing
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2
set expandtab           " tabs are spaces
set smarttab            " be smart when using tabs
set nu                  " show line numbers
set showcmd             " show command (pressed keys) in bottom bar
set cursorline          " highlight current line (highlight usually means underline, which is ugly)
hi CursorLine term=bold cterm=bold guibg=Grey40
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " don't redraw while executing macros
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

" space opens/closes folds
nnoremap <space> za

" make scrolling work
set mouse=a

" for regular expressions turn magic on
set magic

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" jk is escape
" inoremap jk <esc>

" always show at least N lines above/below cursor
set scrolloff=7

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vs ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" blaze build and run in the right tmux pane
nnoremap <Leader>] :execute 'silent !tmux send-keys -t right C-c " clear && bazel build :main && time ./bazel-bin/main" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>[ :execute 'silent !tmux send-keys -t right C-c " clear && bazel run :main" C-m'<Bar>redraw!<C-M>

" octave[-cli] in right tmux pane
nnoremap <Leader>o :execute 'silent !tmux send-keys -t right C-c " clear && octave-cli %" C-m'<Bar>redraw!<C-M>
nnoremap <Leader>O :execute 'silent !tmux send-keys -t right C-c " clear && QT_SCALE_FACTOR=1 octave --persist %" C-m'<Bar>redraw!<C-M>

" repeat last command in right tmux pane
nnoremap <Leader>r :execute 'silent !tmux send-keys -t right C-c " \!\!" C-m'<Bar>redraw!<C-M>

" cargo {build|run|test} in right tmux pane
nnoremap <Leader>cb :!clear && cargo build<C-M>
nnoremap <Leader>cr :!clear && cargo run<C-M>
nnoremap <Leader>ct :execute 'silent !tmux send-keys -t right C-c " clear && cargo test" C-m'<Bar>redraw!<C-M>

" bazel {build|test} in the same window
nnoremap <Leader>bb :Bazel build ...:all<CR>
nnoremap <Leader>bt :Bazel test ...:all<CR>

" <F9> runs :make build
nnoremap <F9> :!clear<CR>:make build<CR>

nnoremap <Leader>f :FormatCode<CR>
nnoremap <Leader>s :SyntasticCheck<CR>

noremap <F4> :YcmCompleter FixIt<CR>
noremap <F5> :YcmCompleter GetType<CR>

" set encoding
set encoding=utf-8
setglobal fileencoding=utf-8

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

" load filetype-specific indent files
filetype indent on
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" recommended syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options="--std=c++17"
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_mode_map = { 'mode': 'passive' }
" let g:syntastic_rust_checkers = ['rustc']
" let g:syntastic_rust_rustc_exe = 'cargo check'
" let g:syntastic_rust_rustc_fname = ''
" let g:syntastic_rust_rustc_args = '--'

" Vim Commentary for custom file types
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType html setlocal commentstring=\<b\>\<samp\>%s\<\/samp\>\<\/b\>

" NERDTree fold on ctrl+n
map <C-n> :NERDTreeToggle<CR>


" Stop YCM from asking whether or not to load config file every time
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/sergiu/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" Racer
set hidden
let g:racer_cmd = "/home/sergiu/.cargo/bin/racer" " activate with C-x-C-o when in insert mode
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


" Sets how many lines of history VIM has to remember
set history=500

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn persistent undo on (you can undo even when you close a buffer/VIM)
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
