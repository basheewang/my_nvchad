---@type NvPluginSpec
---Markdown preview plugin for Neovim

local M = {
  "toppair/peek.nvim",
  event = "VeryLazy",
  build = "deno task --quiet build:fast",
  -- stylua: ignore
  keys={
    {"<leader>po", function() require("peek").open() end, desc="Open Peek preview window"},
    {"<leader>pc", function() require("peek").close() end, desc="Close Peek preview window"},
  }
,
}

function M.config()
  require("peek").setup {
    -- Options for the markdown parser
    app = "browser",
    theme = "light", -- 'dark' or 'light'
  }
end

return M
