execute pathogen#infect()

set nocompatible

let mapleader =  "\<space>"

" colors
syntax enable
set background=dark
colorscheme solarized

" spaces & tabs
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype indent on  " load filetype-specific indent files
filetype plugin on  " load filetype-specific plugins

" ui
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

" ignore shit
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.min.js,*.min.css
" version control shit
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" javascript shit
set wildignore+=*/node_modules/*,*/bower_components/*
" php shit
set wildignore+=*/vendor/*
" symfony shit
set wildignore+=*/app/cache/*,*/app/logs/*,*/bootstrap.php.cache
" random IDE shit
set wildignore+=*/.nbproject/*,*/.idea/*
" random folder shit
set wildignore+=*/log/*,*/tmp/*

" quickly move through buffers
map gB :bprev<CR>
map gb :bnext<CR>

" quicksave
nmap <leader>w :w<CR>

" quickly close buffer
nmap <leader>x :bw<CR>

nmap <leader>t :NERDTreeToggle<CR>

" airline coniguration
let g:airline_theme = 'solarized'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = '\vapp/cache/|web/(js/|css/|components/|uploads/|ob_uploads/|media/)|node_modules/|vendor/|nbproject/|\.(swp|orig|min.js|min.css)$'

" always show gitgutter sign column
let g:gitgutter_sign_column_always = 1

" syntastic global options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic checker options
let g:syntastic_js_checkers = ['jshint', 'jscs']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_php_phpmd_args = 'text unusedcode'

" EditorConfig
" Play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
