local loader = vim.loader

-- Module loader
loader.enable()

-- Plugins
require('gantoreno.plugins')

-- LSP & Completion
require('gantoreno.lsp')
require('gantoreno.completion')

-- Options
require('gantoreno.options')
require('gantoreno.autocommands')
require('gantoreno.keymaps')

-- UI
require('gantoreno.colors')
require('gantoreno.breadcrumbs')
