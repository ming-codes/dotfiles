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
      { "<leader>cc", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
      { "<leader>cC", "<cmd>CodeCompanionChat<cr>",    desc = "New Chat" },
      { "<leader>cs", "<cmd>CodeCompanionHistory<cr>", desc = "Chat History" },
      -- { "<leader>cc", "<cmd>CodeCompanionCmd<cr>", desc = "Prompt" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-sonnet-4",
            -- model = "gpt-4.1",  -- "claude-3.7-sonnet-thought", "claude-sonnet-4", "gpt-4o", "gemini-2.0-flash-001", "claude-3.5-sonnet", "o4-mini", "o3-mini", "gemini-2.5-pro", "claude-3.7-sonnet",
          },
          keymaps = {
            send = {
              modes = { n = "<CR>", i = "<C-CR>" },
              opts = {},
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
              opts = {},
            },
            -- Add further custom keymaps here
          },
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
          intro_message = "",
          window = {
            layout = "float",
            width = 0.7,
          },
        },
      },
      prompt_library = {
        ["Standup Report"] = {
          strategy = "chat",
          description = "Summarize Accomplishment From Previous Day",
          opts = {
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = [[
Use my system clock to establish current time with the date command @{cmd_runner}. Assumes working days are Monday, Tuesday, Wednesday, Thursday, and Friday. Exclude any public holidays for the US territory.

Use the `gh` command to fetch a list of merged PRs authored by me from the previous working day and today. Ensure to use `author:@me` as part of the search param. This is what I have done in previous day.

Use Atlassian @{mcp} to get tickets using the following jql `assignee = currentUser() AND Sprint in openSprints() AND resolution = Unresolved AND status != Done`. This is what I am planning to do today.

Generate a concise standup report with the following format:

```markdown
*Blockers*
- None

*Previous Day*
- [Summarized PR titles with status in the beginning]

*Today*
- [Summarized ticket titles with status in the beginning]
- Picking up new ticket
```

---

Requirements:
- Use summarized PR and ticket titles
- Omit PR numbers
- Put status at the beginning of the line with colon
- Keep format concise and consistent
              ]]
            },
          }
        },
        ["Test Prompt"] = {
          strategy = "chat",
          prompts = {
            {
              role = "user",
              content = "Use my system clock to establish current time with the date command. @{cmd_runner}",
              opts = {
                tools = {
                  ["cmd_runner"] = {
                    opts = {
                      requires_approval = false,
                    },
                  },
                }
              },
              requires_approval = false
            },
          }
        }
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
