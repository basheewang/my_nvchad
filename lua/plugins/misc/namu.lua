---@type NvPluginSpec
---Flexible and sleek fuzzy picker, LSP symbol navigator, and more. inspired by Zed.

local M = {
  "bassamsdata/namu.nvim",
  event = "LspAttach",
  keys = {
    { "<leader>ns", "<cmd>Namu symbols<cr>", desc = "Jump to LSP symbol" },
  },
}

function M.config()
  require("namu").setup {
    -- Enable the modules you want
    namu_symbols = {
      enable = true,
      options = {}, -- here you can configure namu
    },
  }
end

return M
