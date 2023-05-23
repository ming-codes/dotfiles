return {
  { "nvim-tree/nvim-web-devicons" },
  { "tpope/vim-vinegar" },
  {
    "prichrd/netrw.nvim",
    opts = {
      use_devicons = true,
      mappings = {
        ["D"] = function(payload)
          local path = string.format("%s/%s", payload.dir, payload.node)

          vim.loop.spawn("trash", {
            args = { path },
          }, vim.schedule_wrap(function(code, signal)
            vim.cmd('execute "normal \\<Plug>NetrwRefresh"')
          end))
        end
      }
    }
  },
  -- { "marko-cerovac/material.nvim" },
  {
    "NLKNguyen/papercolor-theme",
    build = "colorscheme PaperColor",
    init = function()
      vim.cmd("colorscheme PaperColor")
      vim.cmd("highlight VertSplit ctermfg=24 ctermbg=255")
    end
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = function()
      local splits = require("smart-splits")

      return {
        { "<A-h>", splits.resize_left, desc = "Resize window left" },
        { "<A-j>", splits.resize_down, desc = "Resize window down" },
        { "<A-k>", splits.resize_up, desc = "Resize window up" },
        { "<A-l>", splits.resize_right, desc = "Resize window down" },
        -- moving between splits
        { "<C-h>", splits.move_cursor_left, desc = "Move to window left" },
        { "<C-j>", splits.move_cursor_down, desc = "Move to window below" },
        { "<C-k>", splits.move_cursor_up, desc = "Move to window above" },
        { "<C-l>", splits.move_cursor_right, desc = "Move to window right" },
        -- swapping buffers between windows
        { "<leader>uh", splits.swap_buf_left, desc = "Swap window with left" },
        { "<leader>uj", splits.swap_buf_down, desc = "Swap window with down" },
        { "<leader>uk", splits.swap_buf_up, desc = "Swap window with up" },
        { "<leader>ul", splits.swap_buf_right, desc = "Swap window with right" },
      }
    end
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
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
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buftype_exclude = {
        "nofile",
        "terminal",
      },
      filetype_exclude = {
        "help",
        "startify",
        "aerial",
        "alpha",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
      },
      context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      char = vim.g.symbol_indent,
      context_char = vim.g.symbol_indent,
      show_current_context = true,
    },
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    init = function()
      require("mini.surround").setup({
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
    event = "VeryLazy",
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
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },
    },
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
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

}
