---@type NvPluginSpec
--- 11. improve lsp experences in neovim
-- Three ways to lazy load lspsaga:
--    1. Use event = 'LspAttach' (need latest lazy.nvim 2023-July-9)
--    2. Use ft = {filetype} like ft = {'c','cpp', 'lua', 'rust', 'go'},
--    3. As a depend on nvim-lspconfig
-- Avaiable commands:
--    :Lspsaga incoming_calls and :Lspsaga outgoing_calls.
--    :Lspsaga code_action to invoke.
--    :Lspsaga peek_definition and :Lspsaga peek_type_definition.
--    :Lspsaga diagnostic_jump_next and :Lspsaga diagnostic_jump_prev to jump around diagnostics.
--    :Lspsaga finder and you will see the finder window. By default it shows results for references and implementation.
--    :Lspsaga term_toggle for Float Terminal.
--    :Lspsaga hover_doc. If a hover window is opened, then the command would close it. Use :Lspsaga hover_doc ++keep if you want to keep the hover window.
--    :Lspsaga finder imp to search and preview implementation of interfaces.
--    Automatically show lightbulbs when the current line has available code actions.
--    :Lspsaga outline for Outline
--    :Lspsaga rename to rename

local M = {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  -- config = function()
  --   require("lspsaga").setup {}
  -- end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  keys = {
    { "<leader>lf", "<cmd>Lspsaga finder<cr>", desc = "Lspsaga Finder" },
    { "<leader>ld", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga Hover_doc" },
    -- { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
    { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga outline" },
  },
}

function M.config()
  require("lspsaga").setup {}
end

return M
