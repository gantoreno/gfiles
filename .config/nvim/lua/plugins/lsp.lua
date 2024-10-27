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
    keys = {
      { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Hover' },
    },
    config = function()
      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup({})
      end
    end,
  },
}
