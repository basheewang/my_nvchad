require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber=true

-- Load colorscheme
vim.cmd.colorscheme "tokyonight"

-- diff setup.
-- o.diffopt = "internal,filler,closeoff,linematch:60"
o.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60"

-- Fold related.
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
