---@type NvPluginSpec
---✨ AI-powered coding, seamlessly in Neovim

local M = {
  "olimorris/codecompanion.nvim",
  event = "LspAttach",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- opts = {
  --   -- Set debug logging
  --   log_level = "DEBUG",
  -- },
}

function M.config()
  require("codecompanion").setup {
    log_level = "DEBUG",
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
  }
end

return M
