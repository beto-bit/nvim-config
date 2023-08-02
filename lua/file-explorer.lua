-- File Explorer
require('nvim-tree').setup({
    -- open_on_setup = true,
    -- open_on_setup_file = false,
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = false,
        width = 28,
    },
    renderer = {
        add_trailing = true,
    },
    git = { ignore = false },
    -- I do not put `open = true` here because of a strange bug :^)
    tab = {
        sync = { close = true }
    }
})

-- Open on Setup replacement
local function open_nvim_tree()
    require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({'VimEnter'}, {callback = open_nvim_tree})


require('sync-open-fix')

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
