" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

filetype plugin on
filetype indent on

" Colors {{{
set background=dark
syntax on
colorscheme base16-eighties

" }}}

" Misc {{{
set autowrite
set backspace=2
set noswapfile
set ttyfast
set lazyredraw
set updatetime=350

" }}}

" Formatting {{{
set fo+=tcqro

set comments="s1:/**,mb:*,ex:*/,b://"

" }}}

" Tabs & spaces {{{
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" }}}

" UI {{{
set number relativenumber numberwidth=4
set cursorline
set ruler
set showcmd
set showmatch
set laststatus=2
set scrolloff=8
set visualbell
set wildmenu

set statusline=%f\ %1*
set statusline+=%h%w%m%r
set statusline+=%*%=
set statusline+=%*
set statusline+=\ %y\ %4p%%\ %4l:%3v

" }}}

" Searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <leader>c :nohlsearch<cr>

" }}}

" Mappings {{{
nnoremap <leader>w :update<cr>
nnoremap <leader>x :bdel<cr>
nnoremap <leader>q ZZ
nnoremap <leader>Q :quit!<cr>

noremap [b :bprev<cr>
noremap ]b :bnext<cr>
noremap <leader>a  :b#<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" }}}
