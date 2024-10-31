return {
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({
        comment_empty = false,
      })
    end,
  },
}
