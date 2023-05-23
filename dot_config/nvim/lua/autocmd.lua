return {
  {
    'User',
    {
      pattern = "LazyDone",
      callback = function()
        vim.cmd("colorscheme PaperColor")
        vim.cmd("highlight VertSplit guifg=24 guibg=255")
      end
    }
  },
  {
    "ColorScheme",
    {
      callback = function()
        vim.cmd("highlight VertSplit guifg=24 guibg=255")
      end
    }
  },
  -- {
  --   'BufWritePre',
  --   {
  --     pattern = '*',
  --     callback = function()
  --       -- vim.lsp.buf.format()
  --     end,
  --   },
  -- },
  {
    "BufEnter",
    {
      pattern = { "*.vue", "*.ts" },
      command = "LspStart"
    }
  },
  -- {
  --   "BufLeave",
  --   {
  --     callback = function()
  --       -- TODO delete unnamed hidden buffers
  --       -- vim.api.nvim_list_bufs()
  --     end
  --   }
  -- },
  {
    "CursorMoved",
    {
      callback = function()
        require('notify').dismiss()
      end
    }
  }
}
