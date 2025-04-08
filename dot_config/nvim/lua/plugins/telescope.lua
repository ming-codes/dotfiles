return {
  {
    "axkirillov/easypick.nvim"
    -- TODO: pick changed files
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope", "TodoTelescope" },
    version = false,
    dependencies = {
      -- { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-treesitter/nvim-treesitter",
        },
        config = true
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ['<C-d>'] = require('extensions/telescope/actions').delete_buffer,
            -- ["<C-f>"] = function(prompt_bufnr)
            --   require("telescope.actions.generate").refine(prompt_bufnr, {
            --     prompt_to_prefix = true,
            --     sorter = false,
            --   })
            -- end,
            --["<C-Down>"] = function(...)
            --  return require("telescope.actions").cycle_history_next(...)
            --end,
            --["<C-Up>"] = function(...)
            --  return require("telescope.actions").cycle_history_prev(...)
            --end,
          },
        },
      },
      extensions = {
      },
    },
    config = true
  },
}
