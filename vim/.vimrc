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
Plugin 'joonty/vdebug'

" SnipMate
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" PHP Documentor for Vim
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

" Frontend development
Plugin 'leafgarland/typescript-vim'

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

set autoread
set autowrite
set backspace=2
set noswapfile
set ttyfast
set lazyredraw
set updatetime=350

set encoding=utf-8

set tags=src.tags,vendor.tags

" }}}

" Formatting {{{

set fo+=tcqro

set comments="s1:/**,mb:*,ex:*/,b://"

" }}}

" Tabs & spaces {{{

set smartindent
set autoindent
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
set wildmenu

set list
set listchars=tab:\ \ ,trail:-,eol:¬

" }}}

" Statusline {{{

" Copied from and inspired by: https://gabri.me/blog/diy-vim-statusline

let g:modeMap = {
    \ 'n'  : 'Normal',
    \ 'no' : 'N Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'Visual-Line',
    \ '' : 'Visual-Block',
    \ 's'  : 'Select',
    \ 'S'  : 'Select-Line',
    \ '^S' : 'Select-Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'Visual-Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \ }

function! ChangeStatuslineColor()
    if (buffer_exists('ControlP') && bufloaded('ControlP'))
        exe 'hi! StatusLine ctermfg=12 ctermbg=11'
        exe 'hi! WildMenu ctermfg=01 ctermbg=00'

        return ''
    endif

    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=00 ctermbg=02'
        exe 'hi! WildMenu ctermfg=02 ctermbg=00'
    elseif (mode() =~# '\v(v|V)' || g:modeMap[mode()] ==# 'Visual-Block' || get(g:modeMap, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=00 ctermbg=03'
        exe 'hi! WildMenu ctermfg=03 ctermbg=00'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=00 ctermbg=05'
        exe 'hi! WildMenu ctermfg=05 ctermbg=00'
    else
        exe 'hi! StatusLine ctermfg=00 ctermbg=04'
        exe 'hi! WildMenu ctermfg=04 ctermbg=00'
    endif

    return ''
endfunction

function! GitInfo()
    let git = fugitive#head()
    if git != ''
        return ' BRANCH: '.git.' '
    else
        return ''
endfunction

set laststatus=2

set statusline=
set statusline+=%{ChangeStatuslineColor()}              " change statusline color according to mode
set statusline+=\ %{toupper(g:modeMap[mode()])}\        " mode
set statusline+=%2*%{GitInfo()}                         " current branch, if any
set statusline+=%1*\ %<%f                               " filename
set statusline+=\ %h%w%m%r                              " some flags
set statusline+=%3*%#warningmsg#
set statusline+=%3*%{SyntasticStatuslineFlag()}         " syntastic errors
set statusline+=%1*%=                                   " reset color to normal
set statusline+=\ %y\ %{(&fenc!=''?&fenc:&enc)}[%{&ff}] " filetype, encoding and file format
set statusline+=\ %0*%4p%%\ %10(%l:%L%)%4c              " cursor position

" statusline neutral colors
hi User1 ctermfg=12 ctermbg=11
" statusline git colors
hi User2 ctermfg=00 ctermbg=06
" statusline error colors
hi User3 ctermfg=00 ctermbg=01

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
nnoremap <leader>x :x<cr>

nnoremap <leader>b :NERDTreeToggle<cr>

nnoremap <c-b> :CtrlPBuffer<cr>

nnoremap <leader>r :TagbarOpenAutoClose<cr>
nnoremap <leader>t :TagbarToggle<cr>

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>se :Errors<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

augroup ft_php
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
let g:ctrlp_user_command = 'ag %s -l --nocolor --skip-vcs-ignores --hidden -g ""'

hi! CtrlPMatch ctermfg=10 ctermbg=03
hi! CtrlPMode1 ctermfg=02 ctermbg=10
hi! CtrlPMode2 ctermfg=00 ctermbg=02

" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['/vendor/', '/Tests/', '/tests/']

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

" Vdebug {{{
let g:vdebug_options = {
\    "port" : 9999
\}

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
