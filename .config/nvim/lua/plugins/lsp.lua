local servers = {
  'ts_ls'
}

return {
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = servers
    }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup({})
      end
    end
  }
}
