vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 8

vim.opt.updatetime = 250

vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "noselect", "fuzzy", "nosort" }

vim.opt.shortmess:append("c")
vim.opt.mouse:append("a")
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = " "

vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')

-- Mini
local mini_packages = {
  "bufremove",
  "diff",
  "files",
  "git",
  "comment",
  "completion",
  "indentscope",
  "pairs",
  "pick",
  "notify",
  "statusline",
  "tabline"
}

local mini = {}

for _, package in ipairs(mini_packages) do
  mini[package] = require("mini." .. package)
end

mini.bufremove.setup()
mini.git.setup()
mini.diff.setup({
  view = {
    style = "sign",
    signs = { add = '+', change = '~', delete = '-' },
  }
})
mini.files.setup({
  mappings = {
    go_in = "<CR>",
  }
})
mini.completion.setup({
  lsp_completion = {
    auto_setup = true,
    process_items = function(items, base)
      return mini.completion.default_process_items(items, base, {
        filtersort = "fuzzy"
      })
    end
  }
})
mini.indentscope.setup({
  draw = {
    animation = mini.indentscope.gen_animation.none()
  }
})
mini.pairs.setup()
mini.pick.setup()
mini.notify.setup()
mini.tabline.setup()
mini.statusline.setup()

mini.notify.make_notify()

vim.keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete current buffer" })

vim.keymap.set("n", "<leader>bD", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Force delete current buffer" })

vim.keymap.set('n', '<leader>e', mini.files.open)

vim.keymap.set('n', '[h', function()
  mini.diff.goto_hunk("prev")
end)
vim.keymap.set('n', ']h', function()
  mini.diff.goto_hunk("next")
end)

vim.keymap.set('n', '<leader>ff', function()
  mini.pick.builtin.files()
end)
vim.keymap.set('n', '<leader>fg', function()
  mini.pick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end)

-- LSP
local mason = require("mason")

mason.setup()

vim.lsp.enable({
  "clangd",
  "lua_ls",
  "ts_ls"
})

vim.lsp.config("*", {
  capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(),
    mini.completion.get_lsp_capabilities())
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
    })
  end,
})

-- Treesitter
local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
  ensure_installed = "all"
})
