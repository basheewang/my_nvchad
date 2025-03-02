---@type NvPluginSpec
---Find And Replace plugin for neovim

local M = {
  "MagicDuck/grug-far.nvim",
  event = "InsertEnter",
  keys = {
    { "<leader>gg", "<cmd>GrugFar<cr>", desc = "Open GrugFar to Replace" },
  },
}

function M.config()
  require("grug-far").setup {}
end

return M
