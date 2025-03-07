---@type NvPluginSpec
--- 3. Enable a better fzf plugin
-- Fzf-lua aims to be as plug and play as possible with sane defaults, you can run any fzf-lua command like this:
--    :lua require('fzf-lua').files()
-- or using the `FzfLua` vim command:
--    :FzfLua files
-- or with arguments:
--    :lua require('fzf-lua').files({ cwd = '~/.config' })
-- or using the `FzfLua` vim command:
--    :FzfLua files cwd=~/.config
local M = {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  --stylua: ignore
  keys={
    {"<leader>fg", function() require("fzf-lua").live_grep_native({cwd=vim.fn.stdpath('config')}) end, desc = "Grep Config Files"},
  }
,
}

function M.config()
  require("fzf-lua").setup {}
end

return M
