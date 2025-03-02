---@type NvPluginSpec
---This is legacy plugins by vim script.
return {
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
}
