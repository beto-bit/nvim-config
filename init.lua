-- Mouse
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Show line numbers
vim.opt.number = true

-- True color
vim.opt.termguicolors = true

-- Space are way better than tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4 	-- Tabs are four (just in case)

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Disable Vim native file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- I hate this
-- vim.opt.runtimepath:append(',~/.config/nvim/lua/')

local map = require("utils").map
map("n", "<C-s>", ":NvimTreeToggle<CR>", { silent = true })


-- Plugin manager 
require "paq" {
    "savq/paq-nvim";    -- Let Paq manage itself

    -- Code analysis or something idk
    {
        "nvim-treesitter/nvim-treesitter",
        run = function() vim.cmd "TSUpdate" end
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


    -- Cool status line
    "nvim-lualine/lualine.nvim";
    "kyazdani42/nvim-web-devicons";

    -- One Dark Vim
    "navarasu/onedark.nvim";

    -- Tabs
    "akinsho/bufferline.nvim";

    -- Tree (Folder structure)
    "nvim-tree/nvim-tree.lua";

    -- Cool indentation lines
    "lukas-reineke/indent-blankline.nvim";

    -- I'm using a terminal program inside a terminal program
    {"akinsho/toggleterm.nvim", tag = '*'};

    -- The power of git
    -- "lewis6991/gitsigns.nvim";

    -- Close hidden buffers
    "arithran/vim-delete-hidden-buffers";
}

-- That bar down
require('lualine').setup {
    options = { theme = 'horizon' }
    -- options = { theme = 'dracula' }
    -- options = { theme = 'palenight' }
    -- options = { theme = 'solarized_dark' }
}

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


-- Mah theme
require('onedark').setup {
    style = 'cool',
}
require('onedark').load()
