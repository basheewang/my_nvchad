---@type NvPluginSpec
---Not UFO in the sky, but an ultra fold in Neovim.

local M = {
  "kevinhwang91/nvim-ufo",
  event = "InsertEnter",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  -- stylua: ignore
  keys = {
    {"zR", function() require("ufo").openAllFolds() end, desc="UFO open all folds"},
    {"zM", function() require("ufo").closeAllFolds() end, desc="UFO close all folds"},
    {"zp", function() require("ufo.preview"):peekFoldedLinesUnderCursor() end, desc="UFO preview"},
  },
}

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

function M.config()
  require("ufo").setup {
    -- Option 3: treesitter as a main provider instead
    -- (Note: the `nvim-treesitter` plugin is *not* needed.)
    -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
    -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
    ---@diagnostic disable-next-line: unused-local
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = handler,
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  }
end

return M
