---@type NvPluginSpec
---
---
local M = {
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
}

function M.config()
  require("copilot_cmp").setup {
    suggestion = { enabled = false },
    panel = { enabled = false },
  }
end

return M
