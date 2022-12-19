require('bufferline').setup {
    options = {
        mode = 'buffers',
        numbers = 'ordinal',
        hover = {
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
