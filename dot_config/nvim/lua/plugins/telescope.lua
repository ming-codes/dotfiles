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
            ["<A-a>"] = function(...)
              require("telescope.actions").toggle_all(...)
            end,

            ["<C-v>"] = function(...)
              return require("extensions.telescope.actions").file_vsplit(...)
            end,
            ["<C-t>"] = function(...)
              return require("extensions.telescope.actions").file_tab(...)
            end,

            ["<C-q>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-q><C-q>"] = function(...)
              return require("telescope.actions").send_selected_to_qflist(...)
            end,
            ["<A-q>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<c-f>"] = function(prompt_bufnr)
              require("telescope.actions.generate").refine(prompt_bufnr, {
                prompt_to_prefix = true,
                sorter = false,
              })
            end,
            --["<a-i>"] = function()
            --  local action_state = require("telescope.actions.state")
            --  local line = action_state.get_current_line()
            --  Util.telescope("find_files", { no_ignore = true, default_text = line })()
            --end,
            --["<a-h>"] = function()
            --  local action_state = require("telescope.actions.state")
            --  local line = action_state.get_current_line()
            --  Util.telescope("find_files", { hidden = true, default_text = line })()
            --end,
            --["<C-Down>"] = function(...)
            --  return require("telescope.actions").cycle_history_next(...)
            --end,
            --["<C-Up>"] = function(...)
            --  return require("telescope.actions").cycle_history_prev(...)
            --end,
            --["<C-f>"] = function(...)
            --  return require("telescope.actions").preview_scrolling_down(...)
            --end,
            --["<C-b>"] = function(...)
            --  return require("telescope.actions").preview_scrolling_up(...)
            --end,
          },
          --n = {
          --  ["q"] = function(...)
          --    return require("telescope.actions").close(...)
          --  end,
          --},
        },
      },
      extensions = {
      },
    },
    config = true
  },
}
