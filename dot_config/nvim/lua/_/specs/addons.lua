return {
  {
    "dont-be-evil-company/kulala.nvim",
    event = { "SessionLoadPost" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- keys = {
    --   { "<leader>Rs", desc = "Send request" },
    --   { "<leader>Ra", desc = "Send all requests" },
    --   { "<leader>Rb", desc = "Open scratchpad" },
    -- },
    --   keys = {
    --     -- TODO we need a hydra for this
    --     { "<leader>R",  desc = "Run HTTP Request (kulala)" },
    --     { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>",     desc = "Run nearest" },
    --     { "<leader>Ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run all" },
    --     { "<leader>Rr", "<cmd>lua require('kulala').replay()<cr>",  desc = "Run last" },
    --   }
    ft = { "http", "rest", "javascript", "lua" },
    opts = {
      treesitter = {
        enable = false,
      }
    }
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    keys = {
      { "<leader>fo", "<cmd>Obsidian quick_switch<cr>", desc = "Search Obsidian notes" },
    },
    ---@module 'obsidian'
    ---@param opts obsidian.config
    opts = function(_, opts)
      local result = vim.system({ "obsidian", "vaults", "verbose" }):wait()
      local workspaces = {}
      for line in (result.stdout or ""):gmatch("[^\n]+") do
        local name, path = line:match("^([^\t]+)\t(.+)$")
        if name and path then
          table.insert(workspaces, { name = name, path = path })
        end
      end

      return vim.tbl_deep_extend("force", opts, {
        legacy_commands = false, -- this will be removed in the next major release
        frontmatter = { enabled = false },
        picker = { name = "snacks.picker" },
        workspaces = workspaces,
      })
    end,
  },
}
