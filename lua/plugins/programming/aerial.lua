---@type NvPluginSpec
---A code outline window for skimming and quick navigation
-- | Command            | Args             | Description                                                            |
-- |--------------------+------------------+------------------------------------------------------------------------|
-- | AerialToggle[!]    | left/right/float | Open or close the aerial window. With ! cursor stays in current window |
-- | AerialOpen[!]      | left/right/float | Open the aerial window. With ! cursor stays in current window          |
-- | AerialOpenAll      |                  | Open an aerial window for each visible window.                         |
-- | AerialClose        |                  | Close the aerial window.                                               |
-- | AerialCloseAll     |                  | Close all visible aerial windows.                                      |
-- | [count]AerialNext  |                  | Jump forwards {count} symbols (default 1).                             |
-- | [count]AerialPrev  |                  | Jump backwards [count] symbols (default 1).                            |
-- | [count]AerialGo[!] |                  | Jump to the [count] symbol (default 1).                                |
-- | AerialInfo         |                  | Print out debug info related to aerial.                                |
-- | AerialNavToggle    |                  | Open or close the aerial nav window.                                   |
-- | AerialNavOpen      |                  | Open the aerial nav window.                                            |
-- | AerialNavClose     |                  | Close the aerial nav window.                                           |
-- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
-- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
-- Additionally, if it is a string that matches "actions.<name>",
-- it will use the mapping at require("aerial.actions").<name>
-- Set to `false` to remove a keymap
-- keymaps = {
--   ["?"] = "actions.show_help",
--   ["g?"] = "actions.show_help",
--   ["<CR>"] = "actions.jump",
--   ["<2-LeftMouse>"] = "actions.jump",
--   ["<C-v>"] = "actions.jump_vsplit",
--   ["<C-s>"] = "actions.jump_split",
--   ["p"] = "actions.scroll",
--   ["<C-j>"] = "actions.down_and_scroll",
--   ["<C-k>"] = "actions.up_and_scroll",
--   ["{"] = "actions.prev",
--   ["}"] = "actions.next",
--   ["[["] = "actions.prev_up",
--   ["]]"] = "actions.next_up",
--   ["q"] = "actions.close",
--   ["o"] = "actions.tree_toggle",
--   ["za"] = "actions.tree_toggle",
--   ["O"] = "actions.tree_toggle_recursive",
--   ["zA"] = "actions.tree_toggle_recursive",
--   ["l"] = "actions.tree_open",
--   ["zo"] = "actions.tree_open",
--   ["L"] = "actions.tree_open_recursive",
--   ["zO"] = "actions.tree_open_recursive",
--   ["h"] = "actions.tree_close",
--   ["zc"] = "actions.tree_close",
--   ["H"] = "actions.tree_close_recursive",
--   ["zC"] = "actions.tree_close_recursive",
--   ["zr"] = "actions.tree_increase_fold_level",
--   ["zR"] = "actions.tree_open_all",
--   ["zm"] = "actions.tree_decrease_fold_level",
--   ["zM"] = "actions.tree_close_all",
--   ["zx"] = "actions.tree_sync_folds",
--   ["zX"] = "actions.tree_sync_folds",
-- },

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
