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
set number relativenumber numberwidth=4
set cursorline
set ruler
set showcmd
set showmatch
set laststatus=2
set scrolloff=8
set visualbell
set wildmenu

set statusline=%f
set statusline+=\ %1*
set statusline+=%h%w%m%r
set statusline+=%*%=%2*
set statusline+=%{SyntasticStatuslineFlag()}
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

noremap H :bprev<cr>
noremap L :bnext<cr>
noremap <leader>a  :b#<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

nnoremap <leader>b :NERDTreeToggle<cr>

nnoremap <leader>r :TagbarOpenAutoClose<cr>
nnoremap <leader>t :TagbarToggle<cr>

nnoremap <leader>gs :GitGutterStageHunk<cr>
nnoremap <leader>gu :GitGutterUndoHunk<cr>

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
