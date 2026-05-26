---@type NvPluginSpec
---Chat with GitHub Copilot in Neovim

local M = {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = { "InsertEnter", "LspAttach" },
  -- dependencies = {
  --   { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
  --   { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  -- },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
}

return M
