require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n","<leader>x")
nomap("i","<C-k>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--fzf-lua
map("n", "<leader>fl", ":FzfLua <CR>", { desc = "Open fzf-lua commands list" })
map("n", "<leader>fd", ":FzfLua files <CR>", { desc = "Open fzf-lua to find files" })
map("n", "<leader>fv", ":FzfLua live_grep_native <CR>", { desc = "Grep by fzf-lua live grep native" })
map(
  "n",
  "<leader>fu",
  ":lua require('fzf-lua').oldfiles({cwd_only=true})<CR>",
  { desc = "search old files under current folder" }
)

-- Snacks
-- map("n", "<leader>Sp", ":lua Snacks.picker() <CR>", { desc = "Open Snacks Picker" })
-- map("n", "<leader>Sf", ":lua Snacks.picker.files() <CR>", { desc = "Open Snacks to find file" })
map("n", "<leader>e", ":lua Snacks.explorer() <CR>", { desc = "File explorer" })
map("n", "<leader>ff", ":lua Snacks.picker.files() <CR>", { desc = "Find Files" })
