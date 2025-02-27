---@type NvPluginSpec
---🍨 Soothing pastel theme for (Neo)vim
return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "auto", -- latte, frappe, macchiato, mocha, gruvbox
    }
  end,
}
