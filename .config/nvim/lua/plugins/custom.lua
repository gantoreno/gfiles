return {
  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      -- Colors derived from Ghostty's Default Style Dark theme
      require("onedark").setup({
        colors = {
          black = "#1d1f21",
          bg0 = "#282c34",
          bg1 = "#353a44",
          bg2 = "#404651",
          bg3 = "#4b5260",
          bg_d = "#1d1f21",
          bg_blue = "#7aa6da",
          bg_yellow = "#e7c547",
          fg = "#ffffff",
          purple = "#b294bb",
          green = "#b6bd68",
          orange = "#f0c674",
          blue = "#82a2be",
          yellow = "#f0c674",
          cyan = "#8abeb7",
          red = "#cc6566",
          grey = "#666666",
          light_grey = "#c4c8c6",
          dark_cyan = "#4f8f8a",
          dark_red = "#9f4e51",
          dark_yellow = "#b49350",
          dark_purple = "#896f91",
          diff_add = "#303826",
          diff_delete = "#3a2d31",
          diff_change = "#293847",
          diff_text = "#3b5068",
        },
        highlights = {
          ["@tag.jsx"] = { fg = "$blue" },
          ["@tag.tsx"] = { fg = "$blue" },
          ["@tag.delimiter.jsx"] = { fg = "$light_grey" },
          ["@tag.delimiter.tsx"] = { fg = "$light_grey" },
          ["@tag.attribute.jsx"] = { fg = "$yellow" },
          ["@tag.attribute.tsx"] = { fg = "$yellow" },
          ["@constructor.jsx"] = { fg = "$blue" },
          ["@constructor.tsx"] = { fg = "$blue" },
          ["@operator.jsx"] = { fg = "$purple" },
          ["@operator.tsx"] = { fg = "$purple" },
          ["@property.jsx"] = { fg = "$fg" },
          ["@property.tsx"] = { fg = "$fg" },
          ["@variable.parameter.jsx"] = { fg = "$fg" },
          ["@variable.parameter.tsx"] = { fg = "$fg" },
          ["@parameter.jsx"] = { fg = "$fg" },
          ["@parameter.tsx"] = { fg = "$fg" },

          SnacksIndentScope = { fg = "$cyan", fmt = "nocombine" },
          SnacksIndentChunk = { fg = "$cyan", fmt = "nocombine" },
          IblScope = { fg = "$cyan", fmt = "nocombine" },
          IndentBlanklineContextChar = { fg = "$cyan", fmt = "nocombine" },
        },
      })
      require("onedark").load()
    end,
  },

  -- LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

  -- Tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Sidekick
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
}
