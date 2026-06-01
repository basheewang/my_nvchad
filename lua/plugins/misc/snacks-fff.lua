---@type NvPluginSpec
---Snacks picker integration for fff.nvim

local M = {
  {
    "so1ve/snacks-fff.nvim",
    lazy = false,
    dependencies = {
      "folke/snacks.nvim",
      {
        "dmtrKovalenko/fff.nvim",
        build = function()
          require("fff.download").download_or_build_binary()
        end,
      },
    },
    keys = {
      {
        "<leader>ms",
        function()
          require("snacks-fff").find_files()
        end,
        desc = "FFFind files with Snacks",
      },
      {
        "<leader>mt",
        function()
          require("snacks-fff").live_grep()
        end,
        desc = "Live grep with Snacks",
      },
    },
  },
}

return M
