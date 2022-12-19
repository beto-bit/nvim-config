-- File Explorer
require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = false,
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = true,
        width = 20,
    },
    renderer = {
        add_trailing = true,
    },
    -- I do not put `open = true` here because of a strange bug :^)
    tab = {
        sync = {close = true }
    }
})

require('opensync-fix')

-- Auto close nvim-tree, may break later 
-- Here more approaches: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
            vim.cmd 'quit'
        end
    end
})
