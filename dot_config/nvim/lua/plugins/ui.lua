return {
  {
    "junegunn/goyo.vim",
    cmd = "Goyo"
  },
  { "nvim-tree/nvim-web-devicons" },
  -- { "marko-cerovac/material.nvim" },
  {
    "NLKNguyen/papercolor-theme",
    lazy = false
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<A-h>",      "<cmd>lua require('smart-splits').resize_left()<cr>",       desc = "Resize window left" },
      { "<A-j>",      "<cmd>lua require('smart-splits').resize_down()<cr>",       desc = "Resize window down" },
      { "<A-k>",      "<cmd>lua require('smart-splits').resize_up()<cr>",         desc = "Resize window up" },
      { "<A-l>",      "<cmd>lua require('smart-splits').resize_right()<cr>",      desc = "Resize window down" },
      -- moving between splits
      { "<C-h>",      "<cmd>lua require('smart-splits').move_cursor_left()<cr>",  desc = "Move to window left" },
      { "<C-j>",      "<cmd>lua require('smart-splits').move_cursor_down()<cr>",  desc = "Move to window below" },
      { "<C-k>",      "<cmd>lua require('smart-splits').move_cursor_up()<cr>",    desc = "Move to window above" },
      { "<C-l>",      "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "Move to window right" },
      -- swapping buffers between windows
      { "<leader>uh", "<cmd>lua require('smart-splits').swap_buf_left()<cr>",     desc = "Swap window with left" },
      { "<leader>uj", "<cmd>lua require('smart-splits').swap_buf_down()<cr>",     desc = "Swap window with down" },
      { "<leader>uk", "<cmd>lua require('smart-splits').swap_buf_up()<cr>",       desc = "Swap window with up" },
      { "<leader>ul", "<cmd>lua require('smart-splits').swap_buf_right()<cr>",    desc = "Swap window with right" },
    }
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    ft = require("ft"),
    opts = function()
      local indentscope = require("mini.indentscope")

      return {
        symbol = vim.g.symbol_indent,
        options = {
          try_as_border = true
        },
        draw = {
          animation = indentscope.gen_animation.none()
        },
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    ft = require("ft"),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    event = "InsertEnter",
    init = function()
      require("mini.surround").setup({
        n_lines = 40,
        mappings = {
          add = "",
          delete = "ds",
          find = "",
          find_left = "",
          highlight = "",
          replace = "cs",
          update_n_lines = "",
          suffix_last = "",
          suffix_next = "",
        },
      })
      vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
      { "JoosepAlviste/nvim-ts-context-commentstring" }
    },
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,
      },
      incremental_selection = {
        enable = true
      },
      indent = {
        enable = true
      },
      autotag = {
        enable = true
      },
    },
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
      },
    },
    config = function(plugin, opts)
      require("lspkind").init(opts)
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    opts = { user_default_options = { names = false } },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = false,
      animate = false,

      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 1000 })
      end
    },
    config = function(_, opts)
      require("notify").setup(opts)

      -- vim.notify = notify
    end,
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',            -- Only needed if you have another plugin named markdown.nvim
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- Mandatory
      'nvim-tree/nvim-web-devicons',     -- Optional but recommended
    },
    config = function()
      require('render-markdown').setup({})
    end,
  },
  --{
  --  "kevinhwang91/nvim-ufo",
  --  dependencies = { "kevinhwang91/promise-async" },
  --  opts = {
  --    close_fold_kinds = { 'imports', 'comment' },

  --    provider_selector = function()
  --      return { 'treesitter', 'indent' }
  --    end
  --  },
  --  keys = function()
  --    local ufo = require('ufo')

  --    return {
  --      { 'zR', ufo.openAllFolds,         desc = "Open all folds" },
  --      { 'zM', ufo.closeAllFolds,        desc = "Close all folds" },
  --      { 'zr', ufo.openFoldsExceptKinds, desc = "Open all folds except kinds" },
  --      { 'zm', ufo.closeFoldsWith,       desc = "Close folds with" },
  --    }
  --  end,
  --  config = function(_, opts)
  --    local ufo = require('ufo')

  --    vim.o.foldcolumn = '0' -- '0' is not bad
  --    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
  --    vim.o.foldlevelstart = 99
  --    vim.o.foldenable = true

  --    ufo.setup(opts)
  --  end
  --},
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufEnter",
    cmd = { "TodoTelescope" },
    config = true,
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]]
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]]
      }
    }
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    config = true
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   dependencies = {
  --     {
  --       "jay-babu/mason-null-ls.nvim",
  --       cmd = { "NullLsInstall", "NullLsUninstall" },
  --       opts = { handlers = {} },
  --     },
  --   },
  --   opts = function() return { on_attach = require("astronvim.utils.lsp").on_attach } end,
  -- },
  --   {
  --     "folke/noice.nvim",
  --     event = "VeryLazy",
  --     dependencies = {
  --       -- which key integration
  --       {
  --         "folke/which-key.nvim",
  --         opts = function(_, opts)
  --           if require("lazyvim.util").has("noice.nvim") then
  --             opts.defaults["<leader>sn"] = { name = "+noice" }
  --           end
  --         end,
  --       },
  --     },
  --     opts = {
  --       lsp = {
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       routes = {
  --         {
  --           filter = {
  --             event = "msg_show",
  --             find = "%d+L, %d+B",
  --           },
  --           view = "mini",
  --         },
  --       },
  --       presets = {
  --         bottom_search = true,
  --         command_palette = true,
  --         long_message_to_split = true,
  --         inc_rename = true,
  --       },
  --     },
  --     -- stylua: ignore
  --     keys = {
  --       { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
  --       { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
  --       { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
  --       { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
  --       { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  --       { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
  --       { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  --     },
  --   },

}
