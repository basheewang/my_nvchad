require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
-- o.ruler = true
-- o.rulerformat = "%l,%c/%P"

-- Load colorscheme
vim.cmd.colorscheme "tokyonight"
-- vim.cmd.colorscheme "kanagawa-paper"
-- o.cursorline = true
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3a5a3a" })

-- diff setup.
-- o.diffopt = "internal,filler,closeoff,linematch:60"
o.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60"

-- Fold related.
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

g.loaded_python3_provider = nil
g.python3_host_prog = "/home/coeus/myproj/python/venv/bin/python3"
