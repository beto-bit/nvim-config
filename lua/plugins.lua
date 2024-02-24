-- Copied directly from docs
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    -- Packer manages itself
    'wbthomason/packer.nvim',

    -- My color theme
    'navarasu/onedark.nvim',

    -- Cool status line
    'nvim-lualine/lualine.nvim',
    'kyazdani42/nvim-web-devicons',

    -- Tabs
    'akinsho/bufferline.nvim',

    -- Cool indentation lines
    'lukas-reineke/indent-blankline.nvim',

    -- Autoclose pairs ( '', "", [], {} )
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },

    -- Autoclose hidden buffers
    {
        'arithran/vim-delete-hidden-buffers',
        init = function() vim.cmd 'au TabEnter,TabLeave * :DeleteHiddenBuffers' end
    },

    -- Fine command line
    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('treesitter') end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- File Explorer
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup {}
        end
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' }
    },

    -- Mason
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' }
    }
}
