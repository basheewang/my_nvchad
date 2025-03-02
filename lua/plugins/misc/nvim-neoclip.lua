---@type NvPluginSpec
---Clipboard manager neovim plugin with telescope and fzf-lua integration
local M = {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {
      "kkharji/sqlite.lua",
      -- module = "sqlite",
    },
    -- you'll need at least one of these
    -- {'nvim-telescope/telescope.nvim'},
    { "ibhagwan/fzf-lua" },
  },
  -- stylua: ignore
  keys={
    {"<leader>fy", function() require("neoclip.fzf")() end, desc = "Neoclip history"}
  }
,
}

function M.config()
  require("neoclip").setup {}
end

return M
