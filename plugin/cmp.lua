vim.pack.add {
    -- 'https://github.com/rafamadriz/friendly-snippets',
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('1.x')
    }
}

require('blink.cmp').setup {
    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        ghost_text = { enabled = true },
    },

    keymap = {
        preset = 'default',

        -- Super tab
        ['<Tab>'] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            'snippet_forward',
            'fallback'
        },

        -- Accept enter
        ['<CR>'] = { 'accept', 'fallback' },
    }
}
