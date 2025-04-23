---@type NvPluginSpec
--- Copilot LSP Configuration for Neovim
--- Key Features:
--
-- Next Edit Suggestions — Get context-aware suggestions for your next code edits, not just completions.
--
-- Completions through Blink — integrates with current blink completions for Copilot
--
-- Native Copilot Language Server — Uses the official Copilot language server for the best compatibility and performance. (This can be installed natively or through Mason)

local M = {
  "copilotlsp-nvim/copilot-lsp",
  init = function()
    vim.g.copilot_nes_debounce = 500
    vim.lsp.enable "copilot"
    vim.keymap.set("n", "<tab>", function()
      require("copilot-lsp.nes").apply_pending_nes()
    end)
  end,
}

return M
