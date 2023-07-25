-- Mouse
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Show line numbers
vim.opt.number = true

-- True color
vim.opt.termguicolors = true

-- Space are way better than tabs
vim.opt.tabstop = 4 	-- Tabs are four (just in case)
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Disable Vim native file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local map = require("utils").map
map("n", "<C-s>", ":NvimTreeToggle<CR>", { silent = true })


-- Plugin manager 
require "paq" {
    -- Let Paq manage itself
    "savq/paq-nvim";

    -- Code analysis or something idk
    {
        "nvim-treesitter/nvim-treesitter",
        run = 'TSUpdate',
    };

    -- LaTeX for some reason
    { "lervag/vimtex", opt=true };

    -- Simple LSP
    "VonHeikemen/lsp-zero.nvim";

    -- Not so simple LSP dependencies
    -- LSP Support
    {'neovim/nvim-lspconfig'};
    {'williamboman/mason.nvim'};
    {'williamboman/mason-lspconfig.nvim'};

    -- Autocompletions
    {'hrsh7th/nvim-cmp'};
    {'hrsh7th/cmp-buffer'};
    {'hrsh7th/cmp-path'};
    {'saadparwaiz1/cmp_luasnip'};
    {'hrsh7th/cmp-nvim-lsp'};
    {'hrsh7th/cmp-nvim-lua'};

    -- Snippets
    {'L3MON4D3/LuaSnip'};
    {'rafamadriz/friendly-snippets'};


    -- ======== THEMES ========
    "navarasu/onedark.nvim";                -- One Dark Vim
    "TheMidnightShow/starry_night.nvim";    -- Midnight theme
    "Shatur/neovim-ayu";                    -- Ayu theme
    "folke/tokyonight.nvim";                -- Tokyonight


    -- ======== UTIL ========
    -- Tabs
    "akinsho/bufferline.nvim";

    -- Tree (Folder structure)
    "nvim-tree/nvim-tree.lua";

    -- Cool status line
    "kyazdani42/nvim-web-devicons";
    "nvim-lualine/lualine.nvim";

    -- Cool indentation lines
    "lukas-reineke/indent-blankline.nvim";

    -- I'm using a terminal program inside a terminal program
    {"akinsho/toggleterm.nvim", tag = '*'};

    -- The power of git
    -- "lewis6991/gitsigns.nvim";

    -- Close hidden buffers
    "arithran/vim-delete-hidden-buffers";

    -- Hope this makes Zig pretty
    "ziglang/zig.vim";
}


-- Auto delete hidden buffers
vim.cmd 'au TabEnter,TabLeave * :DeleteHiddenBuffers'

-- Color themes
require('colors')

-- File Explorer
require('file-explorer')

-- Cool tabs
require('tabs')

-- Cool indentation
require('indentation')

-- Ctrl + Ñ (I wish I could do Ctrl+ñ)
require('terminal')

-- require('gitsigns').setup()

-- plz hope this LSP works
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

-- Better treesitter works
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'lua',

        -- Web
        'css',
        'scss',
        'html',
        'json',
        'javascript',
        'typescript',
        'tsx',

        -- Low level shit
        'arduino',
        'c',
        'cpp',
        'cmake',
        'rust',
        'make',
        'zig',

        -- Graphics
        'glsl',
        'hlsl',

        -- Other
        'bash',
        'comment',
        'c_sharp',
        'diff',
        'gitignore',
        'gitattributes',
        'python',
        'toml',
        'java',
    },
}

