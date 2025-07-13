--
-- This module bundles ai related plugins
--
return {
  {
    {
      "ravitemer/mcphub.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      build = "bundled_build.lua",
      cmd = "MCPHub",
      opts = {
        use_bundled_binary = true
      },
      config = true,
      keys = {
        { "<leader>zh", "<cmd>MCPHub<cr>", desc = "MCP Hub" },
      },
    },
  },
  {
    "Davidyz/VectorCode",
    version = "*",      -- optional, depending on whether you're on nightly or release
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "VectorCode", -- if you're lazy-loading VectorCode
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim"
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd"
    },
    keys = {
      -- { "<leader>cc", "<cmd>CodeCompanion<cr>", desc = "Prompt" },
      -- { "<leader>cc", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>",    desc = "New Chat" },
      { "<leader>cs", "<cmd>CodeCompanionHistory<cr>", desc = "Chat History" },
      -- { "<leader>cc", "<cmd>CodeCompanionCmd<cr>", desc = "Prompt" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
          model = "claude-sonnet-4-20250514",
          -- keymaps = {
          --   send = {
          --     modes = { n = "<C-Enter>", i = "<C-Enter>" },
          --     opts = {},
          --   },
          --   close = {
          --     modes = { n = "q", i = "<C-c>" },
          --     opts = {},
          --   },
          --   -- Add further custom keymaps here
          -- },
        },
        inline = {
          adapter = "copilot",
        },
      },
      display = {
        action_palette = {
          provider = "snacks",
        },
        chat = {
          window = {
            layout = "float",
            width = 0.7,
          },
        },
      },
      prompt_library = {
        -- ["Docusaurus"] = {
        -- },
      },
      extensions = {
        history = {
          enabled = true,
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true,           -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          }
        },
        vectorcode = {
          ---@type VectorCode.CodeCompanion.ExtensionOpts
          opts = {
            enabled = true,
          },
        },
      }
    },
  },
}
