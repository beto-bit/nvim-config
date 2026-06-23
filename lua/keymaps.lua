-- Telescope
vim.keymap.set('n', '<leader>f', '<cmd>Telescope<cr>', { desc = 'Telescope' })

-- Yazi
vim.keymap.set(
    'n',
    '<leader>s',
    function()
        require('yazi').yazi()
    end,
    { desc = 'Yazi' }
)
