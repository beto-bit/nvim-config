return {
    {
        'romgrk/barbar.nvim',
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                NvimTree = true,
            }
        },
    },
    { 'nvim-tree/nvim-web-devicons' },
    { 'lewis6991/gitsigns.nvim', lazy = true },
}
