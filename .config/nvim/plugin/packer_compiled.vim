" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n«\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0K\0\1\0\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\25nvim_tree_update_cwd\25nvim_tree_auto_close\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\nÀ\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0001airline#extensions#tabline#show_close_button,airline#extensions#tabline#show_buffers+airline#extensions#tabline#show_splits'airline#extensions#tabline#enabled\28airline_powerline_fonts\14startrail\18airline_theme\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-prettier"] = {
    config = { "\27LJ\2\n’\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0K\0\1\0'prettier#autoformat_require_pragma\30prettier#quickfix_enabled\24prettier#autoformat\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\nÿ\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\3\0=\1\6\0006\0\0\0009\0\1\0'\1\3\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0\28signify_sign_show_count#signify_sign_delete_first_line\30signify_sign_changedelete\24signify_sign_change\24signify_sign_delete\bâ”ƒ\21signify_sign_add\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startrail"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-startrail"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n¬\2\0\0\2\0\n\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\5\0\0\thelp\tterm\vpacker\rNvimTree&indent_blankline_filetype_exclude\6  indent_blankline_space_char\bâ”‚\20indentLine_char\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Config for: vim-signify
time([[Config for vim-signify]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\3\0=\1\6\0006\0\0\0009\0\1\0'\1\3\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0\28signify_sign_show_count#signify_sign_delete_first_line\30signify_sign_changedelete\24signify_sign_change\24signify_sign_delete\bâ”ƒ\21signify_sign_add\6g\bvim\0", "config", "vim-signify")
time([[Config for vim-signify]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n«\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0K\0\1\0\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\25nvim_tree_update_cwd\25nvim_tree_auto_close\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-prettier
time([[Config for vim-prettier]], true)
try_loadstring("\27LJ\2\n’\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0K\0\1\0'prettier#autoformat_require_pragma\30prettier#quickfix_enabled\24prettier#autoformat\6g\bvim\0", "config", "vim-prettier")
time([[Config for vim-prettier]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\nÀ\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0001airline#extensions#tabline#show_close_button,airline#extensions#tabline#show_buffers+airline#extensions#tabline#show_splits'airline#extensions#tabline#enabled\28airline_powerline_fonts\14startrail\18airline_theme\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
