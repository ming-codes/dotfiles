return {
  -- {
  --   "tpope/vim-vinegar",
  --   event = "UIEnter",
  -- },
  -- {
  --   "prichrd/netrw.nvim",
  --   ft = "netrw",
  --   opts = {
  --     use_devicons = true,
  --     mappings = {
  --       ["D"] = function(payload)
  --         local path = string.format("%s/%s", payload.dir, payload.node)

  --         vim.loop.spawn("trash", {
  --           args = { path },
  --         }, vim.schedule_wrap(function(code, signal)
  --           vim.cmd('execute "normal \\<Plug>NetrwRefresh"')
  --         end))
  --       end
  --     }
  --   }
  -- },
  {
    'stevearc/oil.nvim',
    cmd = "Oil",
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      experimental_watch_for_changes = true,
      keymaps = {
        ["<C-h>"] = false,
        ["<C-s>"] = false,
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-p>"] = false,
        ["K"] = "actions.preview",
        ["g."] = "actions.toggle_hidden",
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
    },

    config = true,
  },
}
