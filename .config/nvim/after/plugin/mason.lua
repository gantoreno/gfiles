local servers = require('gantoreno.lsp.servers')

require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = servers,
})
