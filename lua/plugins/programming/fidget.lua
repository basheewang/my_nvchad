---@type NvPluginSpec
---Extensible UI for Neovim notifications and LSP progress messages.
local M = {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    -- options
  },
}

return M
