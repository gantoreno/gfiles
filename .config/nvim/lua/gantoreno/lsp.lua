local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

local navic = require('nvim-navic')

local servers = require('gantoreno.lsp.servers')

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
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end

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

    keymap.set('n', '<leader>hs', lsp.buf.hover, opts)
    keymap.set('n', '<leader>rs', lsp.buf.rename, opts)
    keymap.set('n', '<leader>hd', vim.diagnostic.open_float, opts)
    keymap.set('n', '<leader>ca', lsp.buf.code_action, opts)
    keymap.set('n', '<leader>gd', lsp.buf.definition, opts)
    keymap.set('n', '<leader>gD', lsp.buf.declaration, opts)
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
