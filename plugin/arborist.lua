vim.pack.add {
    'https://github.com/arborist-ts/arborist.nvim'
}

require('arborist').setup {
    ensure_installed = {
        'regex',
        'markdown',
        'markdown_inline',
    },
}
