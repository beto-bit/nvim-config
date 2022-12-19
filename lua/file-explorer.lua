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

-- Auto Open
function tab_enter()
    local view = require("nvim-tree.view")
    if view.is_visible { any_tabpage = true } then
        view.open { focus_tree = false }
        require("nvim-tree.renderer").draw()
    end
end

local augroup_id = vim.api.nvim_create_augroup("NvimTree", { clear = true })
vim.api.nvim_create_autocmd("TabEnter", vim.tbl_extend("force", { group = augroup_id }, { callback = vim.schedule_wrap(tab_enter) }))


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
