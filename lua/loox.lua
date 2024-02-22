-- Configure my theme
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- Status bar
require('lualine').setup {
    options = { theme = 'horizon' },
}

-- Tabs
require('bufferline').setup {
    options = {
        mode = 'buffers',
        numbers = 'ordinal',
        hove = {
            enabled = true,
            delay = 15,
            reveal = { 'close' }
        }
    },
    highlights = {
        buffer_selected = { italic = false },
        indicator_selected = {
            fg = { attribute = 'fg', highlight = 'Function' },
            italic = false
        }
    }
}

-- Indentation line
require('ibl').setup {
    scope = {
        enabled = false,
        show_start = false,
        show_end = false
    }
}
