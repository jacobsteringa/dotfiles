execute pathogen#infect()

set nocompatible

let mapleader =  "\<space>"

" colors
syntax enable
set background=dark
colorscheme base16-eighties

" spaces & tabs
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype indent on  " load filetype-specific indent files
filetype plugin on  " load filetype-specific plugins

" ui
set number          " show current line number
set relativenumber  " show relative line numbers instead of absolute
set numberwidth=4   " default width of number column
set cursorline      " highlight current line
set ruler           " always show cursor
set showmatch       " highlight matching brackets, parenthesis, etc.
set wildmenu        " autocomplete command menu
set showcmd         " show last command in status bar
set lazyredraw      " only redraw when needed
set laststatus=2    " always show status line
set visualbell
set scrolloff=4     " start scrolling 4 lines before horizontal border

" searching
set ignorecase      " search case insensitive
set smartcase       " search case sensitive if search contains upper-case chars
set incsearch       " search as you type
set hlsearch        " highlight matches

" clear highligted matches
nnoremap <leader>c :nohlsearch<CR>

" misc
set ttyfast
set backspace=indent,eol,start
set updatetime=250
set autoread                   " reload buffer if file changed outside of vim
set autowrite                  " write buffer when navigating away

" ignore shit
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.min.js,*.min.css
" version control shit
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" javascript shit
set wildignore+=*/node_modules/*,*/bower_components/*
" php shit
set wildignore+=*/vendor/**/Tests/*,*/vendor/**/tests/*
" symfony shit
set wildignore+=*/app/cache/*,*/app/logs/*,*/bootstrap.php.cache
" random IDE shit
set wildignore+=*/.nbproject/*,*/.idea/*
" random folder shit
set wildignore+=*/log/*,*/tmp/*
" misc symfony shit
set wildignore+=*/web/js/*,*/web/css/*,*/web/uploads/*,*/web/ob_uploads/*,*/web/media/*

" quickly move through buffers
map gB :bprev<CR>
map gb :bnext<CR>

" quicksave
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" quickly close buffer
nmap <leader>x :bw<CR>

nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>b :TagbarToggle<CR>

function! PhpInsertAndSortUse()
    call PhpInsertUse()
    call PhpSortUse()
endfunction

autocmd FileType php noremap <leader>u :call PhpInsertAndSortUse()<CR>

" save file when switching to another pane
let g:tmux_navigator_save_on_switch = 1

" airline coniguration
let g:airline_theme = 'base16_eighties'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 350
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ar'

" always show gitgutter sign column
let g:gitgutter_sign_column_always = 1

" syntastic global options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files = ['/vendor/', '/Tests/']

" syntastic checker options
let g:syntastic_js_checkers = ['jshint', 'jscs']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

if findfile('phpcs', 'vendor/bin') != ''
    let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
endif

let g:syntastic_php_phpmd_args = 'text unusedcode'

" tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

" EditorConfig
" Play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" utilsnips configuration
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:ultiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit = 'vertical'
