---@type NvPluginSpec
---Better quickfix window in Neovim, polish old quickfix window.

local M = {
  "kevinhwang91/nvim-bqf",
  event = "LspAttach",
  ft = "qf",
}

function M.config()
  require("bqf").setup {}
end

return M
