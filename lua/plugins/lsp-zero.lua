local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}
    local wk = require('which-key')

    -- My keybinds
    wk.add {
        { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Inspect Item', opts },
        { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'Jump to Definition', opts },
        { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'Jump to Declaration', opts },
        { 'gi', 'cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'Jump to Implementation', opts },
        { 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = 'Jump to Type Definition', opts },
        { 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', desc = 'Find References', opts },
        { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', desc = 'Show Signature', opts },
        { '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename Item', opts },
        {
            '<F3>',
            '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            desc = 'Format Code',
            mode = {'n', 'x'},
            opts
        },
        { '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Apply Code Action', opts },
    }
end

-- Autocompletion
local cmp_nvim_lsp_config = function()
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp_format = require('lsp-zero').cmp_format{ details = true }

    require('luasnip.loaders.from_vscode').lazy_load()
    
    cmp.setup {
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },

        -- Preselect first item
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },

        -- Mappings
        mapping = cmp.mapping.preset.insert {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),

            -- Press enter to confirm selection
            ['<CR>'] = cmp.mapping.confirm{ select = false },

            ['<Tab>'] = cmp_action.luasnip_supertab(),
            ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

            -- Select next and previous item
            ['<C-K>'] = cmp_action.luasnip_jump_forward(),
            ['<C-J>'] = cmp_action.luasnip_jump_backward(),
            ['<C-E>'] = cmp_action.luasnip_next(),
        },

        --Completion menu borders
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },

        formatting = cmp_format,
    }
end

-- Config for LSP client
local nvim_lspconfig = function()
    lsp_zero = require('lsp-zero')
    
    lsp_zero.extend_lspconfig {
        sign_text = {
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»',
        },
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    
    require('mason-lspconfig').setup {
        ensure_installed = {},
        handlers = {
            function(server_name)
                require('lspconfig')[server_name].setup{}
            end
        }
    }
end


return {
    -- Snippet engine
    { 'L3MON4D3/LuaSnip' },

    -- LSP servers package manager
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        opts = {
            ui = { border = 'rounded' },
        },
    },

    -- Integration with lspconfig
    { 'williamboman/mason-lspconfig.nvim' },

    -- LSP Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
    },

    -- LSP Client
    { 'hrsh7th/cmp-nvim-lsp' },
    -- Nvim completion engine
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = cmp_nvim_lsp_config,
    },

    -- Configurations for LSP Client
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        config = nvim_lspconfig,
    },
}
