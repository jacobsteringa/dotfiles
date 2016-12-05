" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

filetype plugin indent on

" Colors {{{

set background=dark
syntax on
colorscheme minimalist

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
set noshowmode
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
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=00 ctermbg=02'
        exe 'hi! WildMenu ctermfg=02 ctermbg=00'
    elseif (mode() =~# '\v(v|V)' || g:modeMap[mode()] ==# 'Visual-Block' || get(g:modeMap, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=00 ctermbg=03'
        exe 'hi! WildMenu ctermfg=03 ctermbg=00'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=00 ctermbg=05'
        exe 'hi! WildMenu ctermfg=01 ctermbg=00'
    else
        exe 'hi! StatusLine ctermfg=00 ctermbg=04'
        exe 'hi! WildMenu ctermfg=04 ctermbg=00'
    endif

    return ''
endfunction

set laststatus=2

set statusline=
set statusline+=%{ChangeStatuslineColor()}        " change statusline color according to mode
set statusline+=\ %{toupper(g:modeMap[mode()])}\  " mode
set statusline+=%2*\ %<%f\ %1*                    " filename
set statusline+=\ %h%w%m%r                        " some flags
set statusline+=%3*%#warningmsg#
set statusline+=%1*%=                             " reset color to normal
set statusline+=\ %{&ff}                          " file format
set statusline+=\ \|\ %{(&fenc!=''?&fenc:&enc)}   " encoding
set statusline+=\ \|\ %{&ft}                      " filetype
set statusline+=\ %2*%4p%%\ %0*%4l:%-3c           " cursor position

" statusline neutral colors
hi User1 ctermfg=12 ctermbg=10
" statusline highligt colors
hi User2 ctermfg=12 ctermbg=11
" statusline error colors
hi User3 ctermfg=00 ctermbg=01

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

" }}}
