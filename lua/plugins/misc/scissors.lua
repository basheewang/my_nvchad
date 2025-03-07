---@type NvPluginSpec
---Automagical editing and creation of snippets.

local M = {
  "chrisgrieser/nvim-scissors",
  event = "InsertEnter",
  dependencies = "nvim-telescope/telescope.nvim",
  opts = {
    snippetDir = vim.fn.stdpath "config" .. "/lua/snips/vssnippets/",
  },
  --stylua: ignore
  keys={
    {"<leader>na", function() require("scissors").addNewSnippet() end, desc = "Snippets: Add"},
    {"<leader>ne", function() require("scissors").editSnippet() end, desc = "Snippets: Edit"},
  }
,
}

return M
