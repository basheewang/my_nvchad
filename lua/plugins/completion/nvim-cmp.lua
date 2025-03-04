---@type NvPluginSpec
---A completion plugin for neovim coded in Lua.

local M = {
  "hrsh7th/nvim-cmp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    -- "hrsh7th/cmp-path",
    -- "saadparwaiz1/cmp_luasnip",
    -- Above plugins have been added by default.
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    -- "f3fora/cmp-spell",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    "lukas-reineke/cmp-under-comparator",
    -- "kdheepak/cmp-latex-symbols",
    -- "micangl/cmp-vimtex",
    -- "ray-x/cmp-treesitter",
    -- "DasGandlaf/nvim-autohotkey",
    -- "gbprod/yanky.nvim",
    -- "chrisgrieser/cmp_yanky",
  },
}

function M.config()
  local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  }

  local compare = require "cmp.config.compare"
  local cmp = require "cmp"
  local MAX_ABBR_WIDTH = 30
  local MAX_MENU_WIDTH = 30
  -- local config = cmp.get_config()
  -- cmp.setup(config)

  cmp.setup {
    completion = {
      completeopt = "menu,menuone,preview,noselect",
    },

    formatting = {
      expandable_indicator = true,
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        if vim.api.nvim_strwidth(vim_item.abbr) > MAX_ABBR_WIDTH then
          vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, MAX_ABBR_WIDTH) .. "…"
        end
        if vim.api.nvim_strwidth(vim_item.menu or "") > MAX_MENU_WIDTH then
          vim_item.menu = vim.fn.strcharpart(vim_item.menu, 0, MAX_MENU_WIDTH) .. "…"
        end
        local kind = vim_item.kind
        vim_item.kind = " " .. (kind_icons[kind] or "?") .. ""
        local source = entry.source.name
        vim_item.menu = "[" .. source .. "]"

        return vim_item
      end,
    },

    sorting = {
      priority_weight = 1.0,
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        require("cmp-under-comparator").under,
        compare.kind,
      },
    },

    matching = {
      disallow_symbol_nonprefix_matching = true,
      disallow_fuzzy_matching = true,
      disallow_fullfuzzy_matching = true,
      disallow_partial_fuzzy_matching = true,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = true,
    },

    min_length = 0, -- allow for `from package import _` in Python

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),

      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    sources = {
      { name = "nvim_lsp", max_item_count = 5 },
      { name = "luasnip", max_item_count = 5 },
      { name = "buffer", max_item_count = 5 },
      { name = "nvim_lua", max_item_count = 5 },
      { name = "path", max_item_count = 5 },
      -- default above, and customize below
      { name = "lazydev" },
      --  type :smile, accept the suggestion from the popular menu, whitespace ahead!
      { name = "emoji", max_item_count = 5 },
    },
  }

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- `:` cmdline setup.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    -- matching = { disallow_symbol_nonprefix_matching = false },
  })
end

return M
