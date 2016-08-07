" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" colors {{{
set background=dark
syntax on
colorscheme base16-eighties

" }}}

" misc {{{
set autowrite
set backspace=2
set noswapfile
set ttyfast
set updatetime=350

" }}}

" formatting {{{
set fo+=t
set fo+=c
set fo+=q
set fo+=r
set fo+=o

set comments="s1:/**,mb:*,ex:*/,b://"

" }}}

" tabs & spaces {{{
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype plugin on
filetype indent on

" }}}

" ui {{{
set number
set relativenumber
set numberwidth=4
set cursorline
set ruler
set showcmd
set showmatch
set laststatus=2
set scrolloff=8
set visualbell
set wildmenu

" }}}

" searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <leader>c :nohlsearch<cr>

" }}}

" leader mappings {{{
nnoremap <leader>s :update<cr>
map <leader>p :bprev<cr>
map <leader>n :bnext<cr>
map <leader>f :b#<cr>
nmap <leader>x :bdel<cr>
nmap <leader>v :source $MYVIMRC<cr>

" }}}
