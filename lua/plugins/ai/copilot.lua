---@type NvPluginSpec
---Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot

local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

function M.config()
  require("copilot").setup {}
end

return M
