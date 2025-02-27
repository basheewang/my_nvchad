---@type NvPluginSpec
---A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages
-- | Shorthand                   | Lua backend                              | <Plug> mapping            |
-- |-----------------------------+------------------------------------------+---------------------------|
-- | :SnipRun                    | lua require’sniprun’.run()               | <Plug>SnipRun             |
-- | (normal node)               | lua require’sniprun’.run(‘n’)            | <Plug>SnipRunOperator     |
-- | :’<,’>SnipRun (visual mode) | lua require’sniprun’.run(‘v’)            | <Plug>SnipRun             |
-- | :SnipInfo                   | lua require’sniprun’.info()              | <Plug>SnipInfo            |
-- | :SnipReset                  | lua require’sniprun’.reset()             | <Plug>SnipReset           |
-- | :SnipReplMemoryClean        | lua require’sniprun’.clear_repl()        | <Plug>SnipReplMemoryClean |
-- | :SnipClose                  | lua require’sniprun.display’.close_all() | <Plug>SnipClose           |
-- | :SnipLive                   | lua require’sniprun.live_mode’.toggle()  | <Plug>SnipLive            |
-- | ✖                           | lua require’sniprun.api’.run_range(..)   | ✖                         |
-- | ✖                           | lua require’sniprun.api’.run_string(..)  | ✖                         |
local M = {
  "michaelb/sniprun",
  branch = "master",
  event = "LspAttach",

  build = "sh install.sh",
  -- do 'sh install.sh 1' if you want to force compile locally
  -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
  keys = {
    { "<leader>rs", "<cmd>SnipRun<cr>", desc = "SnipRun!" },
  },
}

function M.config()
  require("sniprun").setup {}
end

return M
