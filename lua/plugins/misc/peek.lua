---@type NvPluginSpec
---Markdown preview plugin for Neovim

local M = {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
}

function M.config()
  require("peek").setup {
    -- Options for the markdown parser
    app = "browser",
    theme = "light", -- 'dark' or 'light'
  }
end

return M
