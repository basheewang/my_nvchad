---@type NvPluginSpec
---Search and replace in the current buffer with incremental preview, a convenient UI, and modern regex syntax.

local M = {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  opts = {},
  keys = {
    {
      "<leader>fs",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}

return M
