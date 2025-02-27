require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Snacks
-- map("n", "<leader>Sp", ":lua Snacks.picker() <CR>", { desc = "Open Snacks Picker" })
-- map("n", "<leader>Sf", ":lua Snacks.picker.files() <CR>", { desc = "Open Snacks to find file" })
map("n", "<leader>e", ":lua Snacks.explorer() <CR>", { desc = "File explorer" })

