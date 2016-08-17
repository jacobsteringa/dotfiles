" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" Vundle {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'lumiliet/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-php/tagbar-phpctags.vim'

" SnipMate
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" PHP Documentor for Vim
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

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

set statusline=%3*%{fugitive#statusline()}%*
set statusline+=\ %f
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

noremap [b :bprev<cr>
noremap ]b :bnext<cr>
noremap <leader>a  :b#<cr>

nnoremap <leader>b :NERDTreeToggle<cr>

nnoremap <c-b> :CtrlPBuffer<cr>

nnoremap <leader>r :TagbarOpenAutoClose<cr>
nnoremap <leader>t :TagbarToggle<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>se :Errors<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

augroup filetype_php
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>d :call pdv#DocumentCurrentLine()<cr>
augroup END

" }}}

" CtrlP {{{
let g:ctrlp_by_filename = 1
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

let g:syntastic_php_phpmd_args = 'text unusedcode'

" }}}

" Tagbar {{{
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_phpctags_bin = '/usr/local/bin/phpctags'

" }}}

" Other plugins {{{
let g:tmux_navigator_save_on_switch = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:snipMate = {}
let g:snipMate.snippet_version = 1
let g:pdv_template_dir = $HOME .'/.vim/pdv_templates'

" }}}
