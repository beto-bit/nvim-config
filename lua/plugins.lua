return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- My color theme
    use 'navarasu/onedark.nvim'

    -- Cool status line
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Tabs
    use 'akinsho/bufferline.nvim'

    -- Cool indentation lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autoclose pairs ( '', "", [], {} )
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- Autoclose hidden buffers
    use {
        'arithran/vim-delete-hidden-buffers',
        config = function() vim.cmd 'au TabEnter,TabLeave * :DeleteHiddenBuffers' end
    }

    -- Fine command line
    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = { 'MunifTanjim/nui.nvim' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)

