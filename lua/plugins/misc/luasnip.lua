---@type NvPluginSpec
---This is config for luasnip.

local M = {
  "L3MON4D3/LuaSnip",
}

function M.config()
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").load { paths = vim.fn.stdpath "config" .. "/lua/snips/vssnippets/" }
  ---@diagnostic disable-next-line: assign-type-mismatch
  require("luasnip.loaders.from_lua").load { paths = vim.fn.stdpath "config" .. "/lua/snips/luasnippets/" }
end

return M
