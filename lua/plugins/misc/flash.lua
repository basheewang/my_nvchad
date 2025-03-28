---@type NvPluginSpec
---Navigate your code with search labels, enhanced character motions and Treesitter integration

local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<C-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- opens flash in Treesitter mode: use a jump label, or use ; and , to increase/decrease the selection
    { "<M-s>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

return M
