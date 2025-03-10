---@type NvPluginSpec
---markdown preview plugin for (neo)vim

local M = {
  "iamcco/markdown-preview.nvim",
  event = "InsertEnter",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

return M
