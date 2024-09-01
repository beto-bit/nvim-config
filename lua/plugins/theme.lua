return {
    { 'navarasu/onedark.nvim', opts = { style = 'darker', } },
    { 'folke/tokyonight.nvim' },
    { 'rebelot/kanagawa.nvim' },
    { '0xstepit/flow.nvim' },
    { 'EdenEast/nightfox.nvim' },
    {
        'Shatur/neovim-ayu',
        lazy = false,
        priority = 1000,
        config = function()
            require('ayu').colorscheme()
        end
    },
}
