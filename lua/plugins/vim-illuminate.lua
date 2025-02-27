---@type NvPluginSpec
--- 7. automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
-- You'll also get <a-n> and <a-p> as keymaps to move between references and <a-i> as a textobject for
-- the reference illuminated under the cursor.
return {
  "RRethy/vim-illuminate",
  -- event = "VeryLazy",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
    under_cursor = false,
    modes_allowlist = { "n", "no", "nt" },
    filetypes_denylist = {
      "DiffviewFileHistory",
      "DiffviewFiles",
      "fugitive",
      "git",
      "minifiles",
      "neo-tree",
      "Outline",
      "SidebarNvim",
    },
  },
}
