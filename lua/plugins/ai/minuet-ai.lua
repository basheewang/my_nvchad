---@type NvPluginSpec
---💃 Dance with Intelligence in Your Code. Minuet offers code completion as-you-type from popular LLMs including OpenAI, Gemini, Claude, Ollama, Llama.cpp, Codestral, and more.

local M = {
  "milanglacier/minuet-ai.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("minuet").setup {
    virtualtext = {
      auto_trigger_ft = {},
      keymap = {
        -- accept whole completion
        accept = "<A-A>",
        -- accept one line
        accept_line = "<A-a>",
        -- accept n lines (prompts for number)
        -- e.g. "A-z 2 CR" will accept 2 lines
        accept_n_lines = "<A-z>",
        -- Cycle to prev completion item, or manually invoke completion
        prev = "<A-[>",
        -- Cycle to next completion item, or manually invoke completion
        next = "<A-]>",
        dismiss = "<A-e>",
      },
    },
    provider = "openai_compatible",
    request_timeout = 2.5,
    throttle = 1500, -- Increase to reduce costs and avoid rate limits
    debounce = 600, -- Increase to reduce costs and avoid rate limits
    provider_options = {
      openai_compatible = {
        api_key = "OPENROUTER_API_KEY",
        end_point = "https://openrouter.ai/api/v1/chat/completions",
        -- model = "deepseek/deepseek-chat-v3-0324",
        model = "openai/gpt-4o-mini",
        -- model = "anthropic/claude-3.7-sonnet",
        name = "Openrouter",
        optional = {
          max_tokens = 56,
          top_p = 0.9,
          provider = {
            -- Prioritize throughput for faster completion
            sort = "throughput",
          },
        },
      },
    },
  }
end

return M
