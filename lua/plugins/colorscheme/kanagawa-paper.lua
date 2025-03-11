---@type NvPluginSpec
---Remixed light and dark Kanagawa color scheme with muted colors. For Neovim.
---kanagawa-paper-ink for late nights
-- kanagawa-paper-canvas for sunny days
-- kanagawa-paper for automatic theme switching based on vim.o.background

local M = {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

return M
