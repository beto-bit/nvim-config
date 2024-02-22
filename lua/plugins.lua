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
        -- build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup {
                highlight = {
                    enable = true
                },
                sync_install = false,
                ensure_installed = {
                    'lua',

                    -- Web
                    'css',
                    'html',
                    'json',
                    'javascript',
                    'typescript',

                    -- Low level shit
                    'c',
                    'cpp',
                    'cmake',
                    'rust',
                    'make',
                    'zig',
            
                    -- Other
                    'bash',
                    'diff',
                    'gitignore',
                    'gitattributes',
                    'python',
                    'toml'
                }
            }
        end
    },
}
