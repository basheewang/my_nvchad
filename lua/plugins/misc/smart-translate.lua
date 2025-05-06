---@type NvPluginSpec
--- `smart-translate.nvim` is a very fast and elegantly designed plugin that
--- provides you with an experience like no other translation plugin
---
local M = {
  "askfiy/smart-translate.nvim",
  cmd = { "Translate" },
  dependencies = {
    "askfiy/http.nvim", -- a wrapper implementation of the Python aiohttp library that uses CURL to send requests.
  },
}

function M.config()
  require("smart-translate").setup {
    default = {
      cmds = {
        source = "auto",
        target = "zh-CN",
        handle = "float",
        -- smart-translate.nvim uses Google translation by default. But you can change the default translation engine
        -- Multiple engine support (google, bing, deepl), more will be added in the future.
        -- engine = "google",
        engine = "bing",
      },
      cache = true,
    },
  }
end

return M
