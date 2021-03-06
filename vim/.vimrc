" vim:foldmethod=marker:foldlevel=0

set nocompatible

let mapleader = ';'

" Plugins {{{

call plug#begin('~/.vim/plugged')

" IDE like functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/syntastic'
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
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'tommcdo/vim-lion'
Plug 'majutsushi/tagbar'

call plug#end()

" }}}

" Colors {{{

set background=dark
if filereadable(expand("~/.vimrc_background"))
    syntax on
    let base16colorspace=256
    source ~/.vimrc_background

    " Better linenr and signcolumn colors
    hi LineNr ctermbg=00 ctermfg=08
    hi SignColumn ctermbg=00 ctermfg=08
    hi GitGutterAdd ctermbg=00 ctermfg=02
    hi GitGutterChange ctermbg=00 ctermfg=04
    hi GitGutterDelete ctermbg=00 ctermfg=01
    hi GitGutterChangeDelete ctermbg=00 ctermfg=05
    hi SyntasticWarningSign ctermbg=00 ctermfg=03
    hi SyntasticErrorSign ctermbg=01 ctermfg=00
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
set complete-=i

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

set wrap
set sbr=\

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

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

command! -nargs=+ Ag execute 'silent grep! <args>' | botright copen | redraw!

" }}}

" Spellcheck {{{
augroup ft_spell
    autocmd!
    autocmd FileType text setlocal spelllang=nl
    autocmd FileType mail setlocal spelllang=nl
    autocmd FileType markdown setlocal spelllang=nl
augroup END
" }}}

" Mappings {{{
nnoremap <leader>w :update<cr>
nnoremap <leader>x :x<cr>

nnoremap <leader>f :20Lexplore<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <leader>t :Tags<cr>

nnoremap <leader>ba :TagbarOpenAutoClose<cr>
nnoremap <leader>bo :TagbarOpen<cr>
nnoremap <leader>bc :TagbarClose<cr>

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gr :Gdiffsplit!<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>se :Errors<cr>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

nnoremap <leader>c :nohlsearch<cr>

nnoremap <leader>a :Ag <cword><cr>

augroup ft_php
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>us :Start! ctags --languages=PHP -f .git/tags src/<cr>
    autocmd FileType php nnoremap <buffer> <leader>uv :Start! ctags --languages=PHP -f vendor/tags vendor/<cr>
    autocmd FileType php nnoremap <buffer> <leader>h :!firefox "https://www.php.net/manual-lookup.php?pattern=<cword>"<cr>
augroup END

augroup ft_xml
    autocmd!
    autocmd FileType xml nnoremap <buffer> <leader>pp :%!xmllint --format -<cr>
augroup END

augroup ft_json
    autocmd!
    autocmd FileType json nnoremap <buffer> <leader>pp :%!jq .<cr>
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

let g:syntastic_html_checkers = []
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

" Netrw {{{
let g:netrw_banner=0
let g:netrw_liststyle=3
" }}}

" Other plugins {{{
let g:tmux_navigator_save_on_switch = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}
