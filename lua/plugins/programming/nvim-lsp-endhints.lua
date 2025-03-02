---@type NvPluginSpec
---Display LSP inlay hints at the end of the line, rather than within the line.
---Looks doen't work?? why??

local M = {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  opts = {}, -- required, even if empty
}

function M.config()
  require("lsp-endhints").setup {}
end

-- require("lspconfig").lua_ls.setup {
--   settings = {
--     Lua = {
--       hint = { enable = true },
--     },
--   },
-- }

return M
