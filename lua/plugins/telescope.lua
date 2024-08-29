return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        keys = {
            { '<leader>f', '<cmd>Telescope<cr>', desc = 'Telescope' },
        },
    },
    { 'nvim-lua/plenary.nvim', lazy = true }
}
