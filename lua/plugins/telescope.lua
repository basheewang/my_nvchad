---@type NvPluginSpec
---All extensions for telescope.
local M = {
  "nvim-telescope/telescope.nvim",
  -- tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Sorter
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    -- Extensions:
    "nvim-telescope/telescope-frecency.nvim",
    {
      "jvgrootveld/telescope-zoxide",
      dependencies = { "nvim-lua/popup.nvim" },
    },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  -- Shortcuts
  keys = {
    { "<leader>tf", "<cmd>Telescope frecency<cr>", desc = "Telescope frecency" },
    {
      "<leader>tz",
      function()
        require("telescope").extensions.zoxide.list()
      end,
      desc = "Telescope zoxide",
    },
    {
      "<leader>tl",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Telescope live grep with args",
    },
  },
}

function M.config()
  local telescope = require "telescope"
  telescope.setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-t>"] = require("telescope-live-grep-args.actions").quote_prompt { postfix = " -t" },
            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt { postfix = " -g ''" },
            -- Use wildcat to match files/folders or pus !at beginning to exclude the file or folders
            -- or use -tfile_suffix to match files, or -Tfile_suffix to exclude files.
            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt { postfix = " --iglob **" },
          },
        },
      },
    },
  }
  -- load_extension, somewhere after setup function:
  telescope.load_extension "frecency"
  telescope.load_extension "fzf"
  telescope.load_extension "zoxide"
  telescope.load_extension "live_grep_args"
end

return M
