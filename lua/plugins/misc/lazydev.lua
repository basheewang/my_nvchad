---@type NvPluginSpec
---lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries.

local M = {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      -- { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { "nvim-dap-ui" },
    },
  },
}

return M
