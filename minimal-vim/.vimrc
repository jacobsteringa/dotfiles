" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

filetype plugin indent on

" Colors {{{

set background=dark
syntax off

hi LineNr ctermfg=07 ctermbg=00
hi CursorLine ctermbg=18 cterm=none
hi CursorLineNr ctermfg=07 ctermbg=18

" }}}

" Misc {{{

set autoread
set autowrite
set noswapfile
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set updatetime=350

set encoding=utf-8

set path=.,**

set tags=tags,.git/tags

" }}}

" Formatting {{{

set fo+=tcqro
set comments="s1:/**,mb:*,ex:*/,b://"

" }}}

" Tabs & spaces {{{

set autoindent
set smartindent
set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

" }}}

" UI {{{

set number
set relativenumber
set numberwidth=4
set cursorline
set ruler
set showcmd
set showmatch
set scrolloff=8
set visualbell

set list
set listchars=tab:\ \ ,trail:\.

" }}}

" Wildmenu {{{

set wildmenu
set wildmode=full
set wildignore=.git,*.pyc
set wildignore=*.jpg,*.jpeg,*.png,*.gif

" }}}

" Statusline {{{

set laststatus=2
set statusline=%<%f\ %h%w%m%r
set statusline+=%=%{&ff}\ \|\ %{(&fenc!=''?&fenc:&enc)}\ \|\ %{&ft}\ \|
set statusline+=\ %4p%%\ \|\ %4l:%-3c

" }}}

" Searching {{{

set incsearch
set hlsearch
set ignorecase
set smartcase

nnoremap <leader>c :nohlsearch<cr>

" }}}

" Mappings {{{

nnoremap <leader>w :update<cr>
nnoremap <leader>x :x<cr>
nnoremap <C-b> :ls<cr>:b<space>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

nnoremap <leader>f :Explore<cr>
nnoremap <leader>vf :Vexplore<cr>

" }}}
