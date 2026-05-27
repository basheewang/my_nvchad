---@type NvPluginSpec
---The fastest and the most accurate file search toolkit for AI agents, Neovim, Rust, C, and NodeJS

local M = {
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      -- downloads a prebuilt binary or falls back to cargo build
      require("fff.download").download_or_build_binary()
    end,
    -- for nixos:
    -- build = "nix run .#release",
    opts = {
      debug = {
        enabled = true,
        show_scores = true,
      },
    },
    lazy = false, -- the plugin lazy-initialises itself
    keys = {
      {
        "<leader>mf",
        function()
          require("fff").find_files()
        end,
        desc = "FFFind files",
      },
      {
        "<leader>mg",
        function()
          require("fff").live_grep()
        end,
        desc = "LiFFFe grep",
      },
      {
        "<leader>mz",
        function()
          require("fff").live_grep { grep = { modes = { "fuzzy", "plain" } } }
        end,
        desc = "Live fffuzy grep",
      },
      {
        "<leader>mc",
        function()
          require("fff").live_grep { query = vim.fn.expand "<cword>" }
        end,
        desc = "Search current word",
      },
    },
  },
}

return M
