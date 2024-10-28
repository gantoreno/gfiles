local servers = {
  'lua_ls',
  'ts_ls',
}

return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = servers,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    keys = {
      { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Hover' },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
}
