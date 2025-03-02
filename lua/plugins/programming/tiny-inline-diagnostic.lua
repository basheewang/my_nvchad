---@type NvPluginSpec
---A Neovim plugin that display prettier diagnostic messages. Display diagnostic messages where the cursor is, with icons and colors.
---You need to set vim.diagnostic.config({ virtual_text = false }), to not have all diagnostics in the buffer displayed.

local M = {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- `VeryLazy` or `LspAttach`
  priority = 1000, -- needs to be loaded in first
}

function M.config()
  require("tiny-inline-diagnostic").setup {}
  vim.diagnostic.config { virtual_text = false }
end

return M
