-- LSP Zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup {
    ui = { border = 'shadow' }
}
require('mason-lspconfig').setup {
    handlers =  { lsp_zero.default_setup },
}


-- Floating windows thingies?
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
    -- Select first item
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

    -- Completion menu borders
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert {
        -- `Enter` to confirm selection
        ['<CR>'] = cmp.mapping.confirm { select = false },

        -- Ctrl+Space like VSCode
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Super Tab
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scrolling through docs
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }
}

-- Search autocompletion
cmp.setup.cmdline('/',
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }
)

-- Command line autocompletion
cmp.setup.cmdline(':',
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'path' },
            {
                name = 'cmdline',
                option = {
                    ignore_cards = { 'Man', '!' }
                }
            }
        }
    }
)
