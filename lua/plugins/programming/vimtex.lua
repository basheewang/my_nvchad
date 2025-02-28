---@type NvPluginSpec
---VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

local M = {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
  end,
}

function M.config()
  vim.g.vimtex_fold_enabled = 1
end

return M
