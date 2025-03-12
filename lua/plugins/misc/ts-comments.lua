---@type NvPluginSpec
---Tiny plugin to enhance Neovim's native comments

local M = {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has "nvim-0.10.0" == 1,
}

return M
