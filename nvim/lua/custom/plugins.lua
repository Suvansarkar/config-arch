local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = "BufEnter",
  --   config = function()
  --     require("ufo").setup()
  --   end,
  -- },
  --
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- lazy = false,
    event = "BufEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
      local conform = require("conform")
      vim.keymap.set({"n", "v"}, "<leader>mp", function ()
       conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500
        })
      end, { desc = "Format your dogshit code to make it readable."})
    end,
  },

  {
    "andweeb/presence.nvim",
    -- lazy = false,
    event = "UIEnter",
    config = function()
      -- require "custom.configs.presence"
      require("presence").setup()
    end,
  },

  {
    "barrett-ruth/live-server.nvim",
    -- build = "npm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
