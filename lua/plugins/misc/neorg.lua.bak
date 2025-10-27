---@type NvPluginSpec
---Modernity meets insane extensibility. The future of organizing your life in Neovim.

local M = {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  -- version = "*", -- Pin Neorg to the latest stable release
  config = true,
}

function M.config()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/myproj/notes",
          },
          default_workspace = "notes",
        },
      },
    },
  }

  vim.wo.foldlevel = 99
  vim.wo.conceallevel = 2
end

return M
