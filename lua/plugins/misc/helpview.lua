---@type NvPluginSpec
---A hackable & fancy vimdoc/help file viewer for Neovim

local M = {
  "OXY2DEV/helpview.nvim",
  -- event = "VeryLazy",
  -- branch = "dev",
  -- In case you still want to lazy load
  ft = "help",
  -- lazy = false,
}

function M.config()
  require("helpview").setup {
    preview = {
      icon_provider = "mini", -- "mini" or "devicons"
    },
  }
end

return M
