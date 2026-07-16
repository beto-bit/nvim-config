-- This is experimental!
require('vim._core.ui2').enable({})

-- Numbered lines
vim.opt.number = true

-- True color
vim.opt.termguicolors = true

-- Spaces are better than tabs
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Scrolloff
vim.opt.scrolloff = 2

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''
vim.opt.foldlevel = 2

-- Leader key
vim.g.mapleader = ' '

-- Window style
vim.o.winborder = 'rounded'

-- Spell check
vim.opt.spelllang = { 'es', 'en' }
-- vim.opt.spell = true

require('keymaps')
