---@type NvPluginSpec
---✅ Highlight, list and search todo comments in your projects
---TODO:
---PERF:
---HACK:
---NOTE:
---FIX:
---WARNING:

local M = {
  "folke/todo-comments.nvim",
  event = "InsertEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}

return M
