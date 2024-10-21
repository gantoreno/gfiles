require('gitsigns').setup({
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '▸' },
    topdelete = { text = '▸' },
    changedelete = { text = '▸' },
    untracked = { text = '▎' },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    delay = 500,
    ignore_whitespace = false,
  },
})
