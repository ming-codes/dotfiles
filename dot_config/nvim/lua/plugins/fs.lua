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
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
