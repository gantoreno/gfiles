local lspconfig = require('lspconfig')

local cmp_lsp = require('cmp_nvim_lsp')

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
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded'
      }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded'
      }),
    },
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(evt)
    local opts = { buffer = evt.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  end
})

-- Icons
local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = ''
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type

  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
