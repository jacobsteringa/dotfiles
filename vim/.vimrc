" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" Plugins {{{

call plug#begin('~/.vim/plugged')

" IDE like functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Colors
Plug 'chriskempson/base16-vim'

" Syntax
Plug 'sheerun/vim-polyglot'

" Not categorized yet
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'

call plug#end()

" }}}

" Colors {{{

set background=dark
if filereadable(expand("~/.vimrc_background"))
    syntax on
    let base16colorspace=256
    source ~/.vimrc_background
endif

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
set tags=tags,.git/tags,vendor/tags

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
set signcolumn=yes
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

set diffopt+=vertical

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
set statusline+=%1*%=                             " reset color to normal
set statusline+=\ %{&ff}                          " file format
set statusline+=\ \|\ %{(&fenc!=''?&fenc:&enc)}   " encoding
set statusline+=\ \|\ %{&ft}                      " filetype
set statusline+=\ %2*%4p%%\ %0*%4l:%-3c           " cursor position
set statusline+=%4*%#warningmsg#
set statusline+=%4*%{SyntasticStatuslineFlag()}   " syntastic errors

" statusline neutral colors
hi User1 ctermfg=20 ctermbg=18
" statusline highligt colors
hi User2 ctermfg=20 ctermbg=19
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

nnoremap <leader>f :NERDTreeToggle<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <leader>t :Tags<cr>

nnoremap <leader>ba :TagbarOpenAutoClose<cr>
nnoremap <leader>bo :TagbarOpen<cr>
nnoremap <leader>bc :TagbarClose<cr>

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>se :Errors<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

nnoremap <leader>c :nohlsearch<cr>

nnoremap <leader>a :Ack <cword><cr>

augroup ft_php
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>us :Start! ctags --languages=PHP -f .git/tags src/<cr>
    autocmd FileType php nnoremap <buffer> <leader>uv :Start! ctags --languages=PHP -f vendor/tags vendor/<cr>
augroup END

" }}}

" fzf {{{
let g:fzf_buffer_jump = 1

" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['/vendor/', '/Tests/', '/tests/']

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

if findfile('phpcs', 'vendor/bin') != ''
    let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
endif

if findfile('phpcs', 'bin') != ''
    let g:syntastic_php_phpcs_exec = './bin/phpcs'
endif

if findfile('phpmd', 'vendor/bin') != ''
    let g:syntastic_php_phpmd_exec = './vendor/bin/phpmd'
endif

if findfile('phpmd', 'bin') != ''
    let g:syntastic_php_phpmd_exec = './bin/phpmd'
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

" }}}

" Other plugins {{{
let g:tmux_navigator_save_on_switch = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" }}}
