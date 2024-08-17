local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

-- Setup language servers.
local servers = {
  'astro',
  'clangd',
  'eslint',
  'elixirls',
  'gopls',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tsserver',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
      document_formatting = false,
    },
    on_attach = function(client, bufnr)
      client.capabilities = cmp_lsp.default_capabilities()
    end,
  })
end

lspconfig['elixirls'].setup({
  cmd = { '/opt/homebrew/bin/elixir-ls' },
})

api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(evt)
    local opts = { buffer = evt.buf }

    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'r', lsp.buf.rename, opts)
    keymap.set('n', '.', lsp.buf.code_action, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
  end,
})

-- Icons
diagnostic.config({})

local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}

for type, text in pairs(signs) do
  local texthl = 'DiagnosticSign' .. type
  local linehl = 'DiagnosticSign' .. type .. 'Line'

  fn.sign_define(texthl, { text = text, texthl = texthl, linehl = linehl })
end
