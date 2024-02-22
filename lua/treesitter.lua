require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    sync_install = true,
    ensure_installed = {
        'lua',

        -- Web
        'css',
        'html',
        'json',
        'javascript',
        'typescript',

        -- Low level shit
        'c',
        'cpp',
        'cmake',
        'rust',
        'make',
        'zig',

        -- Other
        'bash',
        'diff',
        'gitignore',
        'gitattributes',
        'python',
        'toml'
    }
}
