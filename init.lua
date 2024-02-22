-- Mouse
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Show line numbers
vim.opt.number = true

-- True color
vim.opt.termguicolors = true

-- Space are way better than tabs
vim.opt.tabstop = 4 	-- Tabs are four (just in case)
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Disable Vim native file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')

require('loox')

require('treesitter')

-- Fine command line
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
