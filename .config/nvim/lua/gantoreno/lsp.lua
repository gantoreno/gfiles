local fn = vim.fn
local diagnostic = vim.diagnostic

local navic = require('nvim-navic')
local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

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

-- Icons
diagnostic.config({
  float = {
    border = 'rounded',
    padding = { 0, 1 },
  },
})

local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}

for type, text in pairs(signs) do
  local texthl = 'DiagnosticSign' .. type
  local linehl = 'DiagnosticSign' .. type .. 'Line'

  fn.sign_define(texthl, { text = text, texthl = texthl, linehl = linehl })
end
