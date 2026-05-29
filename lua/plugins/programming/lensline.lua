---@type NvPluginSpec
---Modular nvim codelens support with inline references, git blame and more

local M = {

  "oribarilan/lensline.nvim",
  -- tag = "2.1.0", -- or: branch = 'release/2.x' for latest non-breaking updates
  branch = "release/2.x",
  event = "LspAttach",
  config = function()
    require("lensline").setup()
  end,
}

return M
