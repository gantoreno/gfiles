local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local lsp = vim.lsp

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

-- Setup language servers.
local servers = {
  'astro',
  'eslint',
  'jsonls',
  'lua_ls',
  'tsserver',
}

-- LSP settings (for overriding per client)
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = cmp_lsp.default_capabilities(),
    handlers = {
      ['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'rounded'
      }),
      ['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
        border = 'rounded'
      }),
    },
  })
end

api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(evt)
    local opts = { buffer = evt.buf }

    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
  end
})

-- Icons
local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = ''
}

for type, text in pairs(signs) do
  local texthl = 'DiagnosticSign' .. type

  fn.sign_define(texthl, { text = text, texthl = texthl })
end
