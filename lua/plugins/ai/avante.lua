---@type NvPluginSpec
---Use your Neovim like using Cursor AI IDE!

local M = {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- "takeshid/avante-status.nvim", -- Provides a statusline component and provider setting function with priority.
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    -- add any opts here,default is claude.
    -- for example
    -- ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    -- provider = "copilot",
    -- copilot = {
    --   model = "claude-3.5-sonnet",
    -- },
    -- gemini = {
    -- model = "gemini-2.5-flash-preview-04-17",
    -- },
    -- provider = "openrouter",
    provider = "deepseek",
    providers = {
      openrouter_anthropic_claude_3_7_sonnet = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        -- model = "deepseek/deepseek-r1",
        -- model = "openai/gpt-4o-mini",
        model = "anthropic/claude-3.7-sonnet",
        -- model = "anthropic/claude-sonnet-4",
      },
      openrouter_anthropic_claude_4_0_sonnet = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        -- model = "deepseek/deepseek-r1",
        -- model = "openai/gpt-4o-mini",
        -- model = "anthropic/claude-3.7-sonnet",
        model = "anthropic/claude-sonnet-4",
      },
      openrouter_openai_gpt_4o_mini = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        -- model = "deepseek/deepseek-r1",
        model = "openai/gpt-4o-mini",
        -- model = "anthropic/claude-3.7-sonnet",
        -- model = "anthropic/claude-sonnet-4",
      },
      deepseekreasoner = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-reasoner",
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-chat",
        -- model = "deepseek-code",
      },
      xaigrok4 = {
        __inherited_from = "openai",
        api_key_name = "XAI_API_KEY",
        endpoint = "https://api.x.ai/v1",
        model = "grok-4-0709",
        -- model = "deepseek-code",
      },
      xaigrok3mini = {
        __inherited_from = "openai",
        api_key_name = "XAI_API_KEY",
        endpoint = "https://api.x.ai/v1",
        model = "grok-3-mini",
        -- model = "deepseek-code",
      },
      xaigrok3 = {
        __inherited_from = "openai",
        api_key_name = "XAI_API_KEY",
        endpoint = "https://api.x.ai/v1",
        model = "grok-3",
        -- model = "deepseek-code",
      },
      gemini25flashlite = {
        __inherited_from = "gemini",
        model = "gemini-2.5-flash-lite-preview-06-17",
      },
      gemini25flash = {
        __inherited_from = "gemini",
        model = "gemini-2.5-flash",
      },
      gemini25pro = {
        __inherited_from = "gemini",
        model = "gemini-2.5-pro",
      },
    },
    -- openai = {
    --   endpoint = "https://api.openai.com/v1",
    --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    --   timeout = 30000, -- timeout in milliseconds
    --   temperature = 0, -- adjust if needed
    --   max_tokens = 4096,
    -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    -- },
    -- To enable MCPHub.
    -- system_prompt = function()
    --   local hub = require("mcphub").get_hub_instance()
    --   ---@diagnostic disable-next-line: need-check-nil
    --   return hub:get_active_servers_prompt()
    -- end,
    -- custom_tools = function()
    --   return {
    --     require("mcphub.extensions.avante").mcp_tool(),
    --   }
    -- end,
  },
}

return M
