vim.pack.add {
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim',
}

-- Mason, because it's easier
require('mason').setup()
require('mason-lspconfig').setup()

-- Diagnostics icons
vim.diagnostic.config {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
        }
    }
}

-- LspAttach callback
local lsp_attach = function(args)
    local mapn = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = args.buf, desc = desc })
    end

    mapn('K', vim.lsp.buf.hover, 'LSP Hover')
    mapn('gK', vim.diagnostic.open_float, 'Show diagnostics')
    mapn('gd', vim.lsp.buf.definition, 'Go to definition')
    mapn('gD', vim.lsp.buf.declaration, 'Go to declaration')
    mapn('gi', vim.lsp.buf.implementation, 'Go to implementation')
    mapn('gr', vim.lsp.buf.references, 'References')
    mapn('<F2>', vim.lsp.buf.rename, 'Rename symbol')
    mapn('<F4>', vim.lsp.buf.code_action, 'Apply code action')
    
    mapn('gF', function()
        vim.lsp.buf.format({ async = true })
    end, 'Format buffer')
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = lsp_attach
})
