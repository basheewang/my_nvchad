---@type NvPluginSpec
---Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort

local M = {
  "echasnovski/mini.nvim",
  version = false,
  event = "InsertEnter",
}

function M.config()
  require("mini.ai").setup {
    -- Add your configuration here
  }
end

return M
