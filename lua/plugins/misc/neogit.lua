---@type NvPluginSpec
--- 5. A git interface for Neovim, inspired by Magit.
-- You can either open Neogit by using the Neogit command:
--
-- :Neogit             " Open the status buffer in a new tab
-- :Neogit cwd=<cwd>   " Use a different repository path
-- :Neogit cwd=%:p:h   " Uses the repository of the current file
-- :Neogit kind=<kind> " Open specified popup directly
-- :Neogit commit      " Open commit popup
local M = {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    -- "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    -- "echasnovski/mini.pick", -- optional
  },
  config = true,
}

return M
