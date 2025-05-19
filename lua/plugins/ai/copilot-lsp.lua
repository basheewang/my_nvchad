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
  event = "LspAttach",
  init = function()
    vim.g.copilot_nes_debounce = 500
    vim.lsp.config("copilot", {
      on_init = function(client)
        vim.api.nvim_set_hl(0, "NesAdd", { link = "DiffAdd", default = true })
        vim.api.nvim_set_hl(0, "NesDelete", { link = "DiffDelete", default = true })
        vim.api.nvim_set_hl(0, "NesApply", { link = "DiffText", default = true })

        local au = vim.api.nvim_create_augroup("copilot-language-server", { clear = true })

        --NOTE: didFocus
        vim.api.nvim_create_autocmd("BufEnter", {
          callback = function()
            local td_params = vim.lsp.util.make_text_document_params()
            client:notify("textDocument/didFocus", {
              textDocument = {
                uri = td_params.uri,
              },
            })
          end,
          group = au,
        })

        vim.keymap.set("n", "<leader>rn", function()
          require("copilot-lsp.nes").request_nes(client)
        end)
      end,
    })
    vim.lsp.enable "copilot"
    vim.keymap.set("n", "<tab>", function()
      require("copilot-lsp.nes").apply_pending_nes()
    end)
  end,
}

return M
