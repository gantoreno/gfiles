local loader = vim.loader

-- Module loader
loader.enable()

-- Plugins
require('gantoreno.plugins')

-- LSP & Completion
require('gantoreno.lsp')
require('gantoreno.completion')

-- UI
require('gantoreno.colors')
require('gantoreno.winbar')

-- Options
require('gantoreno.options')
require('gantoreno.autocommands')
require('gantoreno.keymaps')
