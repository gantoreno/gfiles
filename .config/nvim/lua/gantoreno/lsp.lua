local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local twoslash_queries = require('twoslash-queries')

-- Setup language servers.
local servers = {
  'astro',
  'clangd',
  'eslint',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tsserver',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    handlers = {
      ['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'rounded',
      }),
      ['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
        border = 'rounded',
      }),
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
    on_attach = function(client, bufnr)
      twoslash_queries.attach(client, bufnr)

      client.capabilities = cmp_lsp.default_capabilities()
      client.resolved_capabilities.document_formatting = false
    end,
  })
end

api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(evt)
    local opts = { buffer = evt.buf }

    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
  end,
})

-- Icons
diagnostic.config({
  virtual_text = {
    prefix = '',
    suffix = '',
  },
})

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
