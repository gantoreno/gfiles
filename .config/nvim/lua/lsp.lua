local compe = require("compe")
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
  buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
  buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
  buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
  buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })

  return compe.on_attach
end

lspconfig.tsserver.setup({
  on_attach = on_attach
})

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
  on_attach = on_attach,
})
