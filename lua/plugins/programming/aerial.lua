---@type NvPluginSpec
---A code outline window for skimming and quick navigation

local M = {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>la", "<cmd>AerialToggle!<cr>", desc = "Aerial" },
  },
}

function M.config()
  require("aerial").setup {
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  }
end

return M
