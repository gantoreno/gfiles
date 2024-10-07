local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

local navic = require('nvim-navic')

local servers = require('gantoreno.lsp.servers')

local border = {
  { '', 'FloatBorder' },
  { '', 'FloatBorder' },
  { ' ', 'FloatBorder' },
  { ' ', 'FloatBorder' },
  { '', 'FloatBorder' },
  { '', 'FloatBorder' },
  { '', 'FloatBorder' },
  { ' ', 'FloatBorder' },
}

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    handlers = handlers,
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

    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'r', lsp.buf.rename, opts)
    keymap.set('n', '.', lsp.buf.code_action, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
    keymap.set('n', ';', function()
      vim.diagnostic.open_float(0, {
        scope = 'cursor',
        focusable = false,
        close_events = {
          'CursorMoved',
          'CursorMovedI',
          'BufHidden',
          'InsertCharPre',
          'WinLeave',
        },
      })
    end, opts)
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
