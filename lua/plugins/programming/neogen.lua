---@type NvPluginSpec
---A better annotation generator. Supports multiple languages and annotation conventions.

local M = {
  "danymat/neogen",
  event = "LspAttach",
  config = true,
  keys = {
    { "<leader>nd", "<cmd>Neogen<cr>", desc = "Neogen" },
  },
}

return M
