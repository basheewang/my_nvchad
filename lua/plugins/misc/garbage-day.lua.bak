---@type NvPluginSpec
---Garbage collector that stops inactive LSP clients to free RAM

local M = {
  "zeioth/garbage-day.nvim",
  dependencies = "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    -- your options here
    -- Set it to true to stop all lsp clients except the current buffer, every time you enter a buffer.
    -- aggressive_mode ignores grace_period, and it only triggers when entering a buffer with a different
    -- filetype than the current buffer. Ensures the maximum RAM save.
    -- aggressive_mode = true,
  },
}

return M
