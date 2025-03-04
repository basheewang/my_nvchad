---@type NvPluginSpec
---Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

local M = {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = "LspAttach",
}

return M
