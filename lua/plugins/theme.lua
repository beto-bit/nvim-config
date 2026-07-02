return {
    { 'folke/tokyonight.nvim' },
    { 'rebelot/kanagawa.nvim' },
    { '0xstepit/flow.nvim' },
    { 'EdenEast/nightfox.nvim' },
    -- { 'olimorris/onedarkpro.nvim' },
    { 'Shatur/neovim-ayu' },
    {
        'olimorris/onedarkpro.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme onedark_dark]]
        end
    },
}
