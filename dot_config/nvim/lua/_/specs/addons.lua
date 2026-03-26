return {
  {
    "3rd/diagram.nvim",
    ft = { "md" },
    dependencies = {
      "3rd/image.nvim",
    },
    opts = {
      renderer_options = {
        mermaid = {
          -- background = nil, -- nil | "transparent" | "white" | "#hex"
          -- theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 5, --
          width = 800,
        }
      }
    }
  },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    config = true,
    keys = {
      { "<leader>R",  desc = "Run HTTP Request (kulala)" },
      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>",     desc = "Run nearest" },
      { "<leader>Ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run all" },
      { "<leader>Rr", "<cmd>lua require('kulala').replay()<cr>",  desc = "Run last" },
    }
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    keys = {
      { "<leader>cc", function() require('opencode').select_server() end, desc = "Connect to Opencode Server" },
    },
    -- dependencies = {
    --   {
    --     -- `snacks.nvim` integration is recommended, but optional
    --     ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
    --     "folke/snacks.nvim",
    --     optional = true,
    --     opts = {
    --       input = {}, -- Enhances `ask()`
    --       picker = {  -- Enhances `select()`
    --         actions = {
    --           opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
    --         },
    --         win = {
    --           input = {
    --             keys = {
    --               ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
    --             },
    --           },
    --         },
    --       },
    --     },
    --   },
    -- },
    -- config = function()
    --   ---@type opencode.Opts
    --   vim.g.opencode_opts = {
    --     -- Your configuration, if any; goto definition on the type or field for details
    --   }
    --
    --   -- Recommended/example keymaps
    --   vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
    --     { desc = "Ask opencode…" })
    --   vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
    --     { desc = "Execute opencode action…" })
    --   vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
    --
    --   vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
    --     { desc = "Add range to opencode", expr = true })
    --   vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
    --     { desc = "Add line to opencode", expr = true })
    --
    --   vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
    --     { desc = "Scroll opencode up" })
    --   vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
    --     { desc = "Scroll opencode down" })
    --
    --   -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    --   vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    --   vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    -- end,
  }
}
