---@type NvPluginSpec
---A cheatsheet plugin for neovim with bundled cheatsheets for the editor, multiple vim plugins, nerd-fonts, regex, etc. with a Telescope fuzzy finder interface !

local M = {
  "doctorfree/cheatsheet.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    { "<leader>?", "<cmd>Cheatsheet<CR>", desc = "open cheatsheet for reference" },
  },
}

function M.config()
  local ctactions = require "cheatsheet.telescope.actions"
  require("cheatsheet").setup {
    bundled_cheetsheets = {
      enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
      disabled = { "nerd-fonts" },
    },
    bundled_plugin_cheatsheets = {
      enabled = {
        "auto-session",
        "goto-preview",
        "octo.nvim",
        "telescope.nvim",
        "vim-easy-align",
        "vim-sandwich",
      },
      disabled = { "gitsigns" },
    },
    include_only_installed_plugins = true,
    telescope_mappings = {
      ["<CR>"] = ctactions.select_or_fill_commandline,
      ["<A-CR>"] = ctactions.select_or_execute,
      ["<C-Y>"] = ctactions.copy_cheat_value,
      ["<C-E>"] = ctactions.edit_user_cheatsheet,
    },
  }
end

return M
