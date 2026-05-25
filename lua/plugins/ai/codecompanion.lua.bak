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
  -- Key mappings for CodeCompanion plugin
  -- <leader>mc: Toggle CodeCompanion Chat
  -- <leader>ma: Open CodeCompanion Actions
  keys = {
    { "<leader>mc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
    { "<leader>ma", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
  },
}

function M.config()
  require("codecompanion").setup {
    log_level = "DEBUG",
    strategies = {
      chat = {
        adapter = "copilot",
        -- To enable MCPHub.
        -- tools = {
        --   ["mcp"] = {
        --     -- Prevent mcphub from loading before needed
        --     callback = function()
        --       return require "mcphub.extensions.codecompanion"
        --     end,
        --     description = "Call tools and resources from the MCP Servers",
        --   },
        --   }
      },
    },
    inline = {
      adapter = "copilot",
    },
  }
end

return M
