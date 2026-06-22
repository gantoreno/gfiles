-- /////////////////////
-- Config
-- /////////////////////
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.cc = { 120 }

vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'
vim.opt.completeopt = { 'menuone', 'noselect', 'fuzzy', 'nosort' }

vim.opt.shortmess:append('c')
vim.opt.mouse:append('a')
vim.opt.clipboard:append('unnamedplus')

vim.g.mapleader = ' '

-- /////////////////////
-- Plugins
-- /////////////////////
vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/kdheepak/lazygit.nvim',

  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/neovim/nvim-lspconfig',

  'https://github.com/stevearc/conform.nvim',
  'https://github.com/mfussenegger/nvim-lint',

  'https://github.com/nvim-treesitter/nvim-treesitter',
})

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')

-- /////////////////////
-- Mini
-- /////////////////////
local mini_packages = {
  'bufremove',
  'diff',
  'files',
  'git',
  'comment',
  'completion',
  'indentscope',
  'pairs',
  'pick',
  'notify',
  'statusline',
  'tabline',
}

local mini = {}

for _, package in ipairs(mini_packages) do
  mini[package] = require('mini.' .. package)
end

mini.bufremove.setup()
mini.git.setup()
mini.diff.setup({
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' },
  },
})
mini.files.setup({
  mappings = {
    go_in_plus = '<CR>',
  },
})
mini.completion.setup({
  lsp_completion = {
    auto_setup = true,
    process_items = function(items, base)
      return mini.completion.default_process_items(items, base, {
        filtersort = 'fuzzy',
      })
    end,
  },
})
mini.indentscope.setup({
  draw = {
    animation = mini.indentscope.gen_animation.none(),
  },
})
mini.pairs.setup()
mini.pick.setup()
mini.notify.setup()
mini.tabline.setup()
mini.statusline.setup()

mini.notify.make_notify()

vim.keymap.set('n', 'H', function()
  vim.cmd('bprev')
end, { desc = 'Switch to previous buffer' })
vim.keymap.set('n', 'L', function()
  vim.cmd('bprev')
end, { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<leader>bd', function()
  require('mini.bufremove').delete(0, false)
end, { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bD', function()
  require('mini.bufremove').delete(0, true)
end, { desc = 'Force delete current buffer' })

vim.keymap.set('n', '<leader>e', function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()

  mini.files.open(path, false)
  mini.files.reveal_cwd()
end)

vim.keymap.set('n', '[h', function()
  mini.diff.goto_hunk('prev')
end)
vim.keymap.set('n', ']h', function()
  mini.diff.goto_hunk('next')
end)

vim.keymap.set('n', '<leader>ff', function()
  mini.pick.builtin.cli({
    command = {
      'rg',
      '--files',
      '--hidden',
      '--glob',
      '!.git/*',
    },
  })
end)
vim.keymap.set('n', '<leader>fg', function()
  mini.pick.builtin.grep({
    pattern = vim.fn.expand('<cword>'),
    tool = 'rg',
  })
end)

-- /////////////////////
-- LazyGit
-- /////////////////////
vim.keymap.set('n', '<leader>gg', function()
  vim.cmd('LazyGit')
end)

-- /////////////////////
-- LSP
-- /////////////////////
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_installer = require('mason-tool-installer')

local lsp_servers = {
  'oxlint',
  'arduino_language_server',
  'astro',
  'clangd',
  'clojure_lsp',
  'eslint',
  'gopls',
  'jsonls',
  'lua_ls',
  'marksman',
  'vtsls',
}

local external_tools = {
  'cljfmt',
  'gofumpt',
  'goimports',
  'golangci-lint',
  'markdownlint-cli2',
  'prettier',
  'shfmt',
  'stylua',
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = lsp_servers,
  automatic_enable = false,
})
mason_tool_installer.setup({
  ensure_installed = external_tools,
})

vim.lsp.config('*', {
  capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    mini.completion.get_lsp_capabilities()
  ),
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.lsp.config('eslint', {
  settings = {
    workingDirectories = { mode = 'auto' },
  },
})

vim.lsp.enable(lsp_servers)

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
    })
  end,
})

-- /////////////////////
-- Linting
-- /////////////////////
local lint = require('lint')

lint.linters_by_ft = {
  go = { 'golangcilint' },
  markdown = { 'markdownlint-cli2' },
}

vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    lint.try_lint()
  end,
})

-- /////////////////////
-- Formatting
-- /////////////////////
require('conform').setup({
  formatters_by_ft = {
    clojure = { 'cljfmt' },
    go = { 'goimports', 'gofumpt' },
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    markdown = { 'prettier' },
    sh = { 'shfmt' },
  },
  format_on_save = {
    lsp_format = 'fallback',
  },
})

-- /////////////////////
-- Treesitter
-- /////////////////////
local treesitter = require('nvim-treesitter')

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
  ensure_installed = 'all',
})
