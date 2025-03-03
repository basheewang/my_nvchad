---@type NvPluginSpec
---Debug Adapter Protocol client implementation for Neovim

local M = {
  "mfussenegger/nvim-dap",
  event = "LspAttach",
  dependencies = {
    -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
    "theHamsta/nvim-dap-virtual-text",
    -- A UI for nvim-dap
    "rcarriga/nvim-dap-ui",
    {
      -- Add syntax highlighting to the nvim-dap REPL buffer using treesitter.
      "LiadOz/nvim-dap-repl-highlights",
      config = true,
      build = function()
        if not require("nvim-treesitter.parsers").has_parser "dap_repl" then
          vim.cmd ":TSInstall dap_repl"
        end
      end,
    },
    -- A library for asynchronous IO in Neovim
    "nvim-neotest/nvim-nio",
    -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together.
    "jay-babu/mason-nvim-dap.nvim",
  },
  -- stylua: ignore
  keys={
    {"<leader>B", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint"},
    {"<leader>du", function() require("dapui").toggle() end, desc = "Toggle DapUI"},
    {"<F5>", function() require("dap").continue() end, desc = "Continue/Start Debug"},
    {"<F4>", function() require("dap").close() end, desc = "Close/Stop Debug"},
    {"<F10>", function() require("dap").step_over() end, desc = "DAP Step Over"},
    {"<F11>", function() require("dap").step_into() end, desc = "DAP Step Into"},
    {"<F12>", function() require("dap").step_out() end, desc = "DAP Step Out"},
    {"<leader>dh", function() require("dapui").eval() end, desc = "DapUI Evaluate"},
    {"<leader>dp", function() require("dapui").float_element('scopes', { enter = true }) end, desc = "DapUI Scopes Floating"},
  }
,
}

function M.config()
  local dap = require "dap"
  local dap_vt = require "nvim-dap-virtual-text"
  local dapui = require "dapui"
  local dapmason = require "mason-nvim-dap"

  dapmason.setup {
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  }

  dap_vt.setup {
    -- enabled = true, -- enable this plugin (the default)
    -- enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    -- highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    -- highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    -- show_stop_reason = true, -- show stop reason when stopped for exceptions
    -- commented = false, -- prefix virtual text with comment string
    -- only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
    -- all_references = false, -- show virtual text on all all references of the variable (not only definitions)
    -- filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- -- Experimental Features:
    -- virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
    -- all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    -- virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    -- virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
  }

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ DAP Setup                                                │
  -- ╰──────────────────────────────────────────────────────────╯
  dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    -- expand_lines = vim.fn.has "nvim-0.7",
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "rounded", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    },
  }

  dap.set_log_level "TRACE"

  -- Automatically open UI
  dap.listeners.before.attach["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.launch["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  -- Set icons for nvim dap
  vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
  vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
  vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
  )
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
end

return M
