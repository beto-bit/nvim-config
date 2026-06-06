-- User utilities for vim.pack

vim.api.nvim_create_user_command('PackAdd', function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = '+', desc = 'Add plugins' })

vim.api.nvim_create_user_command('PackUpdate', function()
    vim.pack.update()
end, { desc = 'Update all plugins' })

vim.api.nvim_create_user_command('PackDel', function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = '+', desc = 'Remove plugins' })
