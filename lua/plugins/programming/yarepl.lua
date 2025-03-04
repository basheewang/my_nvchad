---@type NvPluginSpec
---All-in-one REPL and TUI App management tool. Offering flexible interaction paradigms, project-level configs, aider-chat integration, and native dot-repeat.

local M = {
  "milanglacier/yarepl.nvim",
  event = "InsertEnter",
  keys = {
    -- Pickers
    { "<leader>yr", "<Plug>(REPLStart)", desc = "Start a repl windows" },
    { "<leader>yh", "<Plug>(REPLHideOrFocus)", desc = "Hide current repl windows" },
  },
  config = true,
}

function M.config()
  require("yarepl").setup {
    metas = { aider = require("yarepl.extensions.aider").create_aider_meta() },
  }
end

return M
