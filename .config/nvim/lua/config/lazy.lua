local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})

    vim.fn.getchar()

    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.o.mouse = 'a'
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamedplus'
vim.o.fillchars = vim.o.fillchars .. 'eob: '

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.showtabline = 2
vim.o.laststatus = 3

vim.o.hidden = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy').setup('plugins', {})
