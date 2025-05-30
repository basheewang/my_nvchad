---@type NvPluginSpec
---Plugin to improve viewing Markdown files in Neovim

local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  event = "InsertEnter",
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    { "<leader>pm", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown preview" },
  },
}

-- This plugin provides completions for both checkboxes and callouts provided you follow the relevant setup.
-- local cmp = require "cmp"
-- cmp.setup {
--   sources = cmp.config.sources {
--     { name = "render-markdown" },
--   },
-- }

return M
