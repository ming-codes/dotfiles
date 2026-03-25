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
        require('hover.providers.highlight')
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
    -- config = function(plugin, opts)
    --   require("nvim-treesitter.configs").setup(opts)
    -- end
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
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- keys = {
    --   {
    --     "<leader>cf",
    --     function()
    --       require("conform").format({ async = true, lsp_fallback = true })
    --     end,
    --     mode = "",
    --     desc = "Format buffer",
    --   },
    -- },
    opts = {
      formatters_by_ft = {
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        python = { "black" },
        scss = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        less = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Exclude node_modules
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want to format on save, uncomment below
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
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
  {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    dependencies = {
      "mfussenegger/nvim-dap",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      'thenbe/neotest-playwright',
    },
    keys = {
      { "<leader>ut", "<cmd>Neotest summary<cr>", desc = "Toggle Neotest summary" },
      { "<leader>et", "<cmd>Neotest summary<cr>", desc = "Toggle Neotest summary" },
      {
        "<leader>ef",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run test suite in file"
      },
      {
        "<leader>ee",
        function()
          require('neotest').run.run()
        end,
        desc = "Test debug closest"
      },
      {
        "<leader>ed",
        function()
          require('neotest').run.run({ strategy = 'dap' })
        end,
        desc = "Test debug closest"
      },
      { "<leader>eo", "<cmd>Neotest output<cr>", desc = "Toggle Neotest output" },
      {
        "<leader>dd",
        function()
          local neotest = require('neotest')
          local dap = require('dap')

          if state.last_run == 'debug test' then
            state.last_run = 'debug test'
            neotest.run.run_last({ strategy = 'dap' })
          elseif state.last_run == 'debug' then
            state.last_run = 'debug'
            dap.run_last()
          elseif neotest.run.get_last_run() ~= nil then
            state.last_run = 'debug test'
            neotest.run.run_last({ strategy = 'dap' })
          else
            state.last_run = 'debug test'
            neotest.run.run({ strategy = 'dap' })
          end
        end,
        desc = "Debug last test"
      },
      {
        "<leader>eu",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop last test"
      },
      {
        "<leader>du",
        function()
          if state.last_run == 'debug test' then
            require("neotest").run.stop()
          elseif state.last_run == 'debug' then
            require("dap").terminate()
          end
        end,
        desc = "Terminate Debugger"
      }
    },
    opts = function()
      return {
        summary = {
          mappings = {
            stop = "<C-c>",
          }
        },
        adapters = {
          require('neotest-vitest')({
            -- vitestCommand = "npx vitest -- -w"
          }),
          require('neotest-jest')({
            jestCommand = "npm test -- --runInBand --testTimeout=60000",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
          require('neotest-playwright').adapter({
          }),
        }
      }
    end,
    config = true
  },
}
