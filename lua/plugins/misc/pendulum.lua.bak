---@type NvPluginSpec
---Track time spent coding in Neovim
---This plugin need Go lang to compile, disable it for now.

local M = {
  "ptdewey/pendulum-nvim",
  lazy = false,
}

function M.config()
  require("pendulum").setup {
    log_file = vim.fn.expand "$HOME/Documents/my_custom_log.csv",
    time_zone = "Asia/Shanghai",
  }
end

return M
