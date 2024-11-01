return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
          scrollbar = {
            winhighlight = 'PmenuSbar:CmpSbPmenuSbar,Scrollbar:CmpSbScrollbar,PmenuThumb:CmpSbPmenuThumb',
          },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = {
          -- Navigation
          ['<down>'] = cmp.mapping.select_next_item(),
          ['<up>'] = cmp.mapping.select_prev_item(),
          ['<left>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<esc>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),

          -- Interaction
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
        },
        formatting = {
          fields = { 'kind', 'abbr' },
          format = lspkind.cmp_format({
            mode = 'symbol',
          }),
        },
      })
    end,
  },
  {
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').setup({
        preset = 'codicons',
      })
    end,
  },
}
