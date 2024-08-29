return {
    {
        'nvim-tree/nvim-tree.lua',
        keys = {
            { '<leader>s', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree' },
        },
        opts = {
            view = {
                width = 30,
            },
        },
    },
    { 'nvim-tree/nvim-web-devicons' },
}
