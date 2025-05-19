---@type NvPluginSpec
---An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.

local M = {
  "mfussenegger/nvim-lint",
  event = "LspAttach",
  dependencies = {
    "rshkarin/mason-nvim-lint",
  },
  --stylua: ignore
  keys={
    {"<leader>li", function() require('lint').try_lint() end, desc = "Lint"}
  }
,
}

function M.config()
  require("lint").linters_by_ft = {
    lua = { "luacheck" },
    cpp = { "cpplint" },
    json = { "jsonlint" },
    text = { "vale" },
    markdown = { "vale" },
    latex = { "vale" },
    python = { "flake8" },
  }
  require("mason-nvim-lint").setup {
    ignore_install = {
      "ruby",
      "janet",
      "inko",
      "clj-kondo",
      "hadolint",
      "tflint",
    },
  }

  -- Show linters for the current buffer's file type
  --stylua: ignore
  vim.api.nvim_create_user_command("LintInfo", function()
    local filetype = vim.bo.filetype
    local linters = require("lint").linters_by_ft[filetype]

    if linters then
      print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
    else
      print("No linters configured for filetype: " .. filetype)
    end
  end, {})
end

return M
