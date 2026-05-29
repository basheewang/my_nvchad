---@type NvPluginSpec
---A plugin that displays a list of all the maps you have defined

local M = {
  "cmtonkinson/map-list.nvim",
  -- lazy = false,
  opts = {},
  keys = {
    { "<leader>ml", "<cmd>Map <lt>leader><CR>", desc = "List leader keymaps" },
  },
}

return M
