-- Close all buffers with "BufOnly"
-- No longer using this because of extension
-- vim.api.nvim_command("command! BufOnly execute '%bd | edit# | bd# | normal `\"'")

local M = {}

-- Custom keymaps
-- stealed from here: https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
