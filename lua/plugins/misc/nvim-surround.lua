---@type NvPluginSpec
-- 1. Surround selections, stylishly 😎
-- some usage:
--     Old text                    Command         New text
--------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
-- There is a difference between ysiw( and ysiw). In particular,
-- the opening delimiter (e.g. ( or {) will add whitespace, while the closing delimiter does not.
local M = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup {}
end

return M
