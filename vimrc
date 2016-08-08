" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" Vundle {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'lumiliet/vim-twig'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-php/tagbar-phpctags.vim'

call vundle#end()
filetype plugin on
filetype indent on

" }}}

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
set updatetime=350

" }}}

" Formatting {{{
set fo+=t
set fo+=c
set fo+=q
set fo+=r
set fo+=o

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

" Searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <leader>c :nohlsearch<cr>

" }}}

" Leader mappings {{{
nnoremap <leader>s :update<cr>
map <leader>p :bprev<cr>
map <leader>n :bnext<cr>
map <leader>f :b#<cr>
nmap <leader>x :bdel<cr>
nmap <leader>v :source $MYVIMRC<cr>
nmap <leader>b :NERDTreeToggle<cr>
nmap <leader>r :TagbarOpenAutoClose<cr>
nmap <leader>t :TagbarToggle<cr>

" }}}

" CtrlP {{{
let g:ctrlp_lazy_update = 350
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['/vendor/', '/Tests/']

let g:syntastic_js_checkers = ['jshint', 'jscs']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

if findfile('phpcs', 'vendor/bin') != ''
    let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
endif

" }}}

" Other plugins {{{
let g:tmux_navigator_save_on_switch = 1
let g:gitgutter_sign_column_always = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" }}}
