return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- 1. 告诉 Treesitter 优先使用哪种编译器
    -- 放到 init 函数中，确保在 treesitter 加载前设置好
    init = function()
      require("nvim-treesitter.install").compilers = { "gcc", "zig", "clang" }
    end,

    -- 2. 告诉 Treesitter 使用哪些语言
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
