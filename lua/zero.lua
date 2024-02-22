-- LSP Zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup {}
require('mason-lspconfig').setup {
    handlers =  { lsp_zero.default_setup }
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
    mapping = cmp.mapping.preset.insert {
        -- `Enter` to confirm selection
        ['<CR>'] = cmp.mapping.confirm { select = false },

        -- Ctrl+Space like VSCode
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scrolling through docs
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }
}
