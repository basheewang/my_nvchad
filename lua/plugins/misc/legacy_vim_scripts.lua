---@type NvPluginSpec
---This is legacy plugins by vim script.
local M = {
  -- An calendar app for vim(neovim)
  -- Basic Usage:
  -- :Calendar
  -- :Calendar 2000 1 1
  -- :Calendar -view=year
  -- :Calendar -view=year -split=vertical -width=27
  -- :Calendar -view=year -split=horizontal -position=below -height=12
  -- :Calendar -first_day=monday
  -- :Calendar -view=clock
  -- You can switch between views with < and > keys.
  {
    "itchyny/calendar.vim",
    event = "VeryLazy",
  },

  --🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows
  {
    "lambdalisue/vim-suda",
    lazy = false,
  },

  -- A vim / nvim plugin that intelligently reopens files at your last edit position.
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },

  --Maximizes and restores the current window in Vim.
  -- {
  --   "szw/vim-maximizer",
  --   lay = false,
  --   cmd = "MaximizerToggle",
  -- },
}

return M
