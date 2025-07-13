return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    config = true,
    keys = {
      { "<leader>zm", "<cmd>Mason<cr>", desc = "Mason" },
      { "<leader>zl", "<cmd>Lazy<cr>",  desc = "Lazy" },
    },
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
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
    "lewis6991/hover.nvim",
    opts = {
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        require('hover.providers.jira')
        require('hover.providers.dap')
        require('hover.providers.fold_preview')
        require('hover.providers.diagnostic')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
        -- require('hover.providers.highlight')
      end,
      preview_opts = {
        border = 'single'
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        'LSP'
      },
      mouse_delay = 1000
    },
    keys = {
      { "K",     function() require("hover").hover() end,                  desc = "Hover" },
      { "gK",    function() require('hover').hover_select() end,           desc = "Hover (select)" },
      { "<C-p>", function() require('hover').hover_switch("previous") end, desc = "Hover (select previous)" },
      { "<C-n>", function() require('hover').hover_switch("next") end,     desc = "Hover (select next)" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufEnter" },
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
    'junnplus/lsp-setup.nvim',
    event = { "FileType" },
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    config = true,
    ---@type LspSetup.Options
    opts = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      return {
        default_mappings = false,
        capabilities = capabilities,
        on_attach = nil,
        servers = {
          eslint = {},
          lua_ls = {},
          tailwindcss = {},
          jsonls = {},
          ts_ls = {
            init_options = {
              typescript = {
                preferences = {
                  -- other preferences...
                  -- importModuleSpecifierPreference = 'relative',
                  -- importModuleSpecifierEnding = 'minimal',
                  importModuleSpecifier = 'project-relative',
                  -- includeCompletionsForModuleExports = true,
                  -- includeCompletionsForImportStatements = true,
                },
                experimental = {
                  expandableHover = true
                }
              },
            },
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                }
              }
            }
          }
          -- volar = {
          --   settings = {
          --     typescript = {
          --       inlayHints = {
          --         enumMemberValues = {
          --           enabled = true,
          --         },
          --         functionLikeReturnTypes = {
          --           enabled = true,
          --         },
          --         propertyDeclarationTypes = {
          --           enabled = true,
          --         },
          --         parameterTypes = {
          --           enabled = true,
          --           suppressWhenArgumentMatchesName = true,
          --         },
          --         variableTypes = {
          --           enabled = true,
          --         }
          --       }
          --     }
          --   }
          -- }
        }
      }
    end,
    init = function()
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
          },
          -- linehl = {
          --   [vim.diagnostic.severity.ERROR] = "NONE",
          --   [vim.diagnostic.severity.WARN] = "WarningMsg",
          --   [vim.diagnostic.severity.HINT] = "NONE",
          --   [vim.diagnostic.severity.INFO] = "NONE",
          -- },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          }
        },
      })
    end
  },
  {
    "elentok/format-on-save.nvim",
    opts = function()
      local formatters = require("format-on-save.formatters")

      return {
        experiments = {
          partial_update = 'diff', -- or 'line-by-line'
        },
        exclude_path_patterns = {
          "/node_modules/",
        },
        formatter_by_ft = {
          css = formatters.lsp,
          html = formatters.prettierd,
          java = formatters.lsp,
          javascript = formatters.prettierd,
          javascriptreact = formatters.prettierd,
          json = formatters.prettierd,
          lua = formatters.lsp,
          markdown = formatters.prettierd,
          python = formatters.black,
          scss = {
            formatters.lsp,
            formatters.prettierd,
          },
          sh = formatters.shfmt,
          typescript = {
            -- formatters.custom({
            --   format = function()
            --     vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
            --   end
            -- }),
            formatters.lazy_eslint_d_fix,
            formatters.prettierd,
          },
          typescriptreact = {
            -- formatters.custom({
            --   format = function()
            --     vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
            --   end
            -- }),
            formatters.lazy_eslint_d_fix,
            formatters.prettierd,
            formatters.remove_trailing_whitespace,
          },
          yaml = formatters.prettierd,
          vue = formatters.prettierd,
          less = formatters.prettierd,
        }
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    events = "BufEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = true,
    opts = function()
      local cmp = require('cmp')

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }, {
          { name = 'buffer' },
        })
      }
    end,
  },
}
