vim.g.mapleader = ';'

-- Auto-install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print('Installing lazy.nvim...')
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    -- Colors & syntax
    { 'sainnhe/gruvbox-material' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/playground' },

    -- Git integration
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },

    -- Tmux integration
    { 'christoomey/vim-tmux-navigator' },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    { 'nvim-lualine/lualine.nvim' }, -- Nice status line

    -- LSP Zero, because I am lazy
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'}, -- Optional
            {'hrsh7th/cmp-path'}, -- Optional
            {'L3MON4D3/LuaSnip'}, -- Required
        },
    },

    -- Tpope's really useful plugins
    { 'tpope/vim-surround' },
    { 'tpope/vim-eunuch' },
    { 'tpope/vim-unimpaired' },

    { 'numToStr/Comment.nvim' },

    { 'subnut/nvim-ghost.nvim' }, -- Use Neovim, even in the browser
}

-- Set my favourite colorscheme, Gruvbox dark medium
vim.opt.termguicolors = true
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'
vim.opt.background = 'dark'
vim.cmd.colorscheme('gruvbox-material')

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

-- UI
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes:2'
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.scrolloff = 8
vim.opt.visualbell = true
vim.opt.wildmenu = true
vim.opt.splitbelow = true -- open horizontal splits below currect buffer
vim.opt.splitright = true -- open vertical splits to the right of current buffer
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '.' }
vim.opt.wrap = true
vim.opt.showbreak = '> '
vim.opt.diffopt:append('vertical')
vim.opt.completeopt = 'menu,menuone'

-- Searching
vim.opt.ignorecase = true -- Search case insensitive
vim.opt.smartcase = true  -- except when pattern contains uppercase letters
vim.opt.incsearch = true  -- Live update matches
vim.opt.hlsearch = true

-- Misc
vim.opt.undofile = true   -- Keep undo history
vim.opt.swapfile = false  -- living on the edge?

-- Decrease update time
vim.opt.updatetime = 350

vim.opt.path = { '.', '**' }
vim.opt.tags = { 'tags', '.git/tags', 'vendor/tags' }

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Mappings
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<C-b>', function ()
    require('telescope.builtin').buffers {
        sort_lastused = true
    }
end, {})
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {})
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>bs', function ()
    require('telescope.builtin').lsp_document_symbols {
        ignore_symbols = 'variable'
    }
end, {})

vim.keymap.set('n', '<leader>w', vim.cmd.w)
vim.keymap.set('n', '<leader>x', vim.cmd.x)
vim.keymap.set('n', '<leader>f', vim.cmd.Ex)
vim.keymap.set('n', '<leader>c', vim.cmd.nohlsearch)

vim.keymap.set('n', '<leader>gb', function () vim.cmd.Git('blame') end)
vim.keymap.set('n', '<leader>gb', vim.cmd.Gdiffsplit)
vim.keymap.set('n', '<leader>gr', function () vim.cmd(':Gdiffsplit!') end)

require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>ghs', gs.stage_hunk)
        map('n', '<leader>ghr', gs.reset_hunk)
        map('n', '<leader>ghu', gs.undo_stage_hunk)
        map('n', '<leader>gtb', gs.toggle_current_line_blame)
    end
}

-- Configure treesitter

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or 'all' (the first five listed parsers should always be installed)
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'html', 'css', 'scss', 'javascript', 'typescript', 'bash', 'php', 'astro' },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },
}

-- Configure Telescope

local telescope = require('telescope')
local telescopeConfig = require('telescope.config')

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) } -- Clone default Telescope configuration

table.insert(vimgrep_arguments, '--hidden') -- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--no-ignore') -- I want to search in ignored files.

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

telescope.setup {
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '--hidden', '--no-ignore', '--glob', '!**/.git/*' },
        },
    },
}

-- End Telescope

require('telescope').load_extension('fzf')

-- Configure LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function (client, bufnr)
    -- see :h lsp-zero-keybindings to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup {
    completion = {
        completeopt = "menu,menuone",
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}

-- End LSP

-- Configure Lualine

vim.opt.laststatus = 2

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
    },
    secions = {
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
    },
}

-- End Lualine

require('Comment').setup()
