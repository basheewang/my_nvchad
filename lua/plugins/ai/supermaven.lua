---@type NvPluginSpec
---The official Neovim plugin for Supermaven

local M = {
  "supermaven-inc/supermaven-nvim",
  event = "LspAttach",
}

function M.config()
  require("supermaven-nvim").setup {
    disable_inline_completion = true, -- disables inline completion for use with cmp
  }
end

return M
