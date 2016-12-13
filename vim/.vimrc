" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" Vundle {{{

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" IDE like functionality
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'lumiliet/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'

" Not categorized yet
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
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

set autoread
set autowrite
set backspace=2
set noswapfile
set ttyfast
set lazyredraw
set updatetime=350

set encoding=utf-8
set path=.,**
set tags=.git/tags,vendor/tags

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

set splitright
set splitbelow

set list
set listchars=tab:\ \ ,trail:\.

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
set statusline+=%{ChangeStatuslineColor()}        " change statusline color according to mode
set statusline+=\ %{toupper(g:modeMap[mode()])}\  " mode
set statusline+=%3*%{GitInfo()}                   " current branch, if any
set statusline+=%2*\ %<%f\ %1*                    " filename
set statusline+=\ %h%w%m%r                        " some flags
set statusline+=%4*%#warningmsg#
set statusline+=%4*%{SyntasticStatuslineFlag()}   " syntastic errors
set statusline+=%1*%=                             " reset color to normal
set statusline+=\ %{&ff}                          " file format
set statusline+=\ \|\ %{(&fenc!=''?&fenc:&enc)}   " encoding
set statusline+=\ \|\ %{&ft}                      " filetype
set statusline+=\ %2*%4p%%\ %0*%4l:%-3c           " cursor position

" statusline neutral colors
hi User1 ctermfg=12 ctermbg=10
" statusline highligt colors
hi User2 ctermfg=12 ctermbg=11
" statusline git colors
hi User3 ctermfg=00 ctermbg=06
" statusline error colors
hi User4 ctermfg=00 ctermbg=01

" }}}

" Searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch

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

nnoremap <leader>c :nohlsearch<cr>

augroup ft_php
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>us :Start! ctags --languages=PHP -f .git/tags src/<cr>
    autocmd FileType php nnoremap <buffer> <leader>uv :Start! ctags --languages=PHP -f vendor/tags vendor/<cr>
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

" UltiSnips {{{
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsSnippetDirectories=["ultisnips"]

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

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" }}}
