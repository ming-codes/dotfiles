--
-- This module bundles ai related plugins
--
return {
  {
    "yetone/avante.nvim",
    -- build = "make",
    event = "VeryLazy",
    version = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      provider = "opencode",
      mode = "agentic",
      behaviour = {
        enable_token_counting = false,
        auto_suggestions = false,
        auto_approve_tool_permissions = true,
        acp_follow_agent_locations = true,
      },
      selector = {
        provider = "fzf_lua",
      },
      windows = {
        position = "right",
        width = 35,
      },
      mappings = {
        submit = {
          normal = "<CR>",
          insert = "<S-CR>",
        },
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "ibhagwan/fzf-lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
      },
    },
    keys = {
      --{ "<leader>aa", "<cmd>AvanteAsk<cr>",    desc = "Avante Ask" },
      { "<leader>cc", "<cmd>AvanteToggle<cr>", desc = "Avante Toggle" },
      --{ "<leader>ae", "<cmd>AvanteEdit<cr>",   mode = { "n", "v" },   desc = "Avante Edit" },
    },
  },
  -- {
  --   "alsi-lawr/agent-term.nvim",
  --   main = "agent_term",
  --   dependencies = {
  --     { "folke/snacks.nvim", opts = {} },
  --   },
  --   opts = {
  --     float = {
  --       host = "snacks",
  --     },
  --     agents = {
  --       "opencode"
  --     }
  --   },
  -- }
  -- {
  --   'milanglacier/minuet-ai.nvim',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('minuet').setup {
  --       provider = 'openai_fim_compatible',
  --       n_completions = 1,
  --       context_window = 4096,
  --       request_timeout = 5,
  --       provider_options = {
  --         openai_fim_compatible = {
  --           api_key = function() return 'ollama' end,
  --           name = 'Ollama',
  --           end_point = 'http://localhost:11434/v1/completions',
  --           model = 'qwen2.5-coder:1.5b',
  --           stream = true,
  --           optional = {
  --             max_tokens = 64,
  --             top_p = 0.9,
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- }
  --   {
  --     {
  --       "ravitemer/mcphub.nvim",
  --       dependencies = {
  --         "nvim-lua/plenary.nvim",
  --       },
  --       build = "bundled_build.lua",
  --       cmd = "MCPHub",
  --       opts = {
  --         use_bundled_binary = true
  --       },
  --       config = true,
  --       keys = {
  --         { "<leader>zh", "<cmd>MCPHub<cr>", desc = "MCP Hub" },
  --       },
  --     },
  --   },
  --   {
  --     "Davidyz/VectorCode",
  --     version = "*",      -- optional, depending on whether you're on nightly or release
  --     dependencies = { "nvim-lua/plenary.nvim" },
  --     cmd = "VectorCode", -- if you're lazy-loading VectorCode
  --   },
  --   {
  --     "olimorris/codecompanion.nvim",
  --     dependencies = {
  --       "nvim-lua/plenary.nvim",
  --       "nvim-treesitter/nvim-treesitter",
  --       "ravitemer/codecompanion-history.nvim"
  --     },
  --     cmd = {
  --       "CodeCompanion",
  --       "CodeCompanionActions",
  --       "CodeCompanionChat",
  --       "CodeCompanionCmd"
  --     },
  --     keys = {
  --       -- { "<leader>cc", "<cmd>CodeCompanion<cr>", desc = "Prompt" },
  --       { "<leader>cc", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
  --       { "<leader>cC", "<cmd>CodeCompanionChat<cr>",    desc = "New Chat" },
  --       { "<leader>cs", "<cmd>CodeCompanionHistory<cr>", desc = "Chat History" },
  --       -- { "<leader>cc", "<cmd>CodeCompanionCmd<cr>", desc = "Prompt" },
  --     },
  --     opts = {
  --       strategies = {
  --         chat = {
  --           adapter = {
  --             name = "copilot",
  --             model = "claude-sonnet-4",
  --             -- model = "gpt-4.1",  -- "claude-3.7-sonnet-thought", "claude-sonnet-4", "gpt-4o", "gemini-2.0-flash-001", "claude-3.5-sonnet", "o4-mini", "o3-mini", "gemini-2.5-pro", "claude-3.7-sonnet",
  --           },
  --           keymaps = {
  --             send = {
  --               modes = { n = "<CR>", i = "<C-CR>" },
  --               opts = {},
  --             },
  --             close = {
  --               modes = { n = "<C-c>", i = "<C-c>" },
  --               opts = {},
  --             },
  --             -- Add further custom keymaps here
  --           },
  --         },
  --         inline = {
  --           adapter = "copilot",
  --         },
  --       },
  --       display = {
  --         action_palette = {
  --           provider = "snacks",
  --         },
  --         chat = {
  --           intro_message = "",
  --           window = {
  --             layout = "float",
  --             width = 0.7,
  --           },
  --         },
  --       },
  --       prompt_library = {
  --         ["Standup Report"] = {
  --           strategy = "chat",
  --           description = "Summarize Accomplishment From Previous Day",
  --           opts = {
  --             auto_submit = true,
  --           },
  --           prompts = {
  --             {
  --               role = "user",
  --               content = [[
  -- Use my system clock to establish current time with the date command @{cmd_runner}. Assumes working days are Monday, Tuesday, Wednesday, Thursday, and Friday. Exclude any public holidays for the US territory.
  --
  -- Use the `gh` command to fetch a list of merged PRs authored by me from the previous working day and today. Ensure to use `author:@me` as part of the search param. This is what I have done in previous day.
  --
  -- Use Atlassian @{mcp} to get tickets using the following jql `assignee = currentUser() AND Sprint in openSprints() AND resolution = Unresolved AND status != Done`. This is what I am planning to do today.
  --
  -- Generate a concise standup report with the following format:
  --
  -- ```markdown
  -- *Blockers*
  -- - None
  --
  -- *Previous Day*
  -- - [Summarized PR titles with status in the beginning]
  --
  -- *Today*
  -- - [Summarized ticket titles with status in the beginning]
  -- - Picking up new ticket
  -- ```
  --
  -- ---
  --
  -- Requirements:
  -- - Use summarized PR and ticket titles
  -- - Omit PR numbers
  -- - Put status at the beginning of the line with colon
  -- - Keep format concise and consistent
  --               ]]
  --             },
  --           }
  --         },
  --         ["Test Prompt"] = {
  --           strategy = "chat",
  --           prompts = {
  --             {
  --               role = "user",
  --               content = "Use my system clock to establish current time with the date command. @{cmd_runner}",
  --               opts = {
  --                 tools = {
  --                   ["cmd_runner"] = {
  --                     opts = {
  --                       requires_approval = false,
  --                     },
  --                   },
  --                 }
  --               },
  --               requires_approval = false
  --             },
  --           }
  --         }
  --       },
  --       extensions = {
  --         history = {
  --           enabled = true,
  --         },
  --         mcphub = {
  --           callback = "mcphub.extensions.codecompanion",
  --           opts = {
  --             show_result_in_chat = true, -- Show mcp tool results in chat
  --             make_vars = true,           -- Convert resources to #variables
  --             make_slash_commands = true, -- Add prompts as /slash commands
  --           }
  --         },
  --         vectorcode = {
  --           ---@type VectorCode.CodeCompanion.ExtensionOpts
  --           opts = {
  --             enabled = true,
  --           },
  --         },
  --       }
  --     },
  --   },
  -- {
  --   "nickjvandyke/opencode.nvim",
  --   version = "*", -- Latest stable release
  --   keys = {
  --     { "<leader>cs", function() require('opencode').select_server() end,                   desc = "Connect to Opencode Server" },
  --     { "<leader>cc", function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Prompt Opencode" },
  --   },
  --   -- dependencies = {
  --   --   {
  --   --     -- `snacks.nvim` integration is recommended, but optional
  --   --     ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
  --   --     "folke/snacks.nvim",
  --   --     optional = true,
  --   --     opts = {
  --   --       input = {}, -- Enhances `ask()`
  --   --       picker = {  -- Enhances `select()`
  --   --         actions = {
  --   --           opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
  --   --         },
  --   --         win = {
  --   --           input = {
  --   --             keys = {
  --   --               ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
  --   --             },
  --   --           },
  --   --         },
  --   --       },
  --   --     },
  --   --   },
  --   -- },
  --   -- config = function()
  --   --   ---@type opencode.Opts
  --   --   vim.g.opencode_opts = {
  --   --     -- Your configuration, if any; goto definition on the type or field for details
  --   --   }
  --   --
  --   --   -- Recommended/example keymaps
  --   --   vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
  --   --     { desc = "Ask opencode…" })
  --   --   vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
  --   --     { desc = "Execute opencode action…" })
  --   --   vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
  --   --
  --   --   vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
  --   --     { desc = "Add range to opencode", expr = true })
  --   --   vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
  --   --     { desc = "Add line to opencode", expr = true })
  --   --
  --   --   vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
  --   --     { desc = "Scroll opencode up" })
  --   --   vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
  --   --     { desc = "Scroll opencode down" })
  --   --
  --   --   -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
  --   --   vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
  --   --   vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  --   -- end,
  -- }
}
