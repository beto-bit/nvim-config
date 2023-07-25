-- Tokyonight theme
-- vim.cmd[[colorscheme tokyonight]]


-- Ayu theme
-- require('ayu').setup({ mirage = true })
-- require('ayu').colorscheme()


-- One Dark
require('onedark').setup {
    style = 'darker',
}
require('onedark').load()


-- That bar down
require('lualine').setup {
    options = { theme = 'horizon' },
    -- options = { theme = 'dracula' }
    -- options = { theme = 'palenight' }
    -- options = { theme = 'solarized_dark' }
}
