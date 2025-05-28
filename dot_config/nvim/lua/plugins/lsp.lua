HOME = "/Users/mliu4"
MASON_PATH = HOME .. "/.local/share/nvim/mason"
JDTLS_PATH = MASON_PATH .. "/packages/jdtls"

-- NOTE:
-- What did I do?
-- jdtls.py was hard coded to java 17
-- stil have gradle problem

return {
  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = { "java" },
  --   cond = function()
  --     -- /Users/mliu4/.local/share/nvim/mason/packages/jdtls
  --     return true
  --   end,
  --   config = function()
  --     local asdf = require("utils.asdf")
  --     local table = require("utils.table")
  --     local cwd = vim.fn.getcwd()

  --     require('jdtls').start_or_attach({
  --       cmd = {
  --         '/Users/mliu4/.asdf/installs/java/corretto-11.0.18.10.1/bin/java',
  --         '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  --         '-Dosgi.bundles.defaultStartLevel=4',
  --         '-Declipse.product=org.eclipse.jdt.ls.core.product',
  --         '-Dlog.protocol=true',
  --         '-Dlog.level=ALL',
  --         '-Xmx4g',
  --         '--add-modules=ALL-SYSTEM',
  --         '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  --         '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  --         -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
  --         --   '-javaagent:' .. HOME .. '/.local/share/eclipse/lombok.jar',

  --         --   -- The jar file is located where jdtls was installed. This will need to be updated
  --         --   -- to the location where you installed jdtls
  --         '-jar', vim.fn.glob('/opt/homebrew/Cellar/jdtls/1.18.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar'),
  --         -- '-jar', JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

  --         -- The configuration for jdtls is also placed where jdtls was installed. This will
  --         -- need to be updated depending on your environment
  --         '-configuration', JDTLS_PATH .. '/config_ss_mac',

  --         '-data', cwd .. ".jdtls"
  --       },

  --       -- flags = {
  --       --   debounce_text_changes = 80,
  --       -- },
  --       root_dir = require('jdtls.setup').find_root({ 'gradlew', 'mvnw', '.git' }),

  --       -- Here you can configure eclipse.jdt.ls specific settings
  --       -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
  --       -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  --       -- for a list of options
  --       settings = {
  --         java = {
  --           --    format = {
  --           --      settings = {
  --           --        -- Use Google Java style guidelines for formatting
  --           --        -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
  --           --        -- and place it in the ~/.local/share/eclipse directory
  --           --        url = "/.local/share/eclipse/eclipse-java-google-style.xml",
  --           --        profile = "GoogleStyle",
  --           --      },
  --           --    },
  --           --    signatureHelp = { enabled = true },
  --           --    contentProvider = { preferred = 'fernflower' }, -- Use fernflower to decompile library code
  --           --    -- Specify any completion options
  --           --    completion = {
  --           --      favoriteStaticMembers = {
  --           --        "org.hamcrest.MatcherAssert.assertThat",
  --           --        "org.hamcrest.Matchers.*",
  --           --        "org.hamcrest.CoreMatchers.*",
  --           --        "org.junit.jupiter.api.Assertions.*",
  --           --        "java.util.Objects.requireNonNull",
  --           --        "java.util.Objects.requireNonNullElse",
  --           --        "org.mockito.Mockito.*"
  --           --      },
  --           --      filteredTypes = {
  --           --        "com.sun.*",
  --           --        "io.micrometer.shaded.*",
  --           --        "java.awt.*",
  --           --        "jdk.*", "sun.*",
  --           --      },
  --           --    },
  --           --    -- Specify any options for organizing imports
  --           --    sources = {
  --           --      organizeImports = {
  --           --        starThreshold = 9999,
  --           --        staticStarThreshold = 9999,
  --           --      },
  --           --    },
  --           --    -- How code generation should act
  --           --    codeGeneration = {
  --           --      toString = {
  --           --        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
  --           --      },
  --           --      hashCodeEquals = {
  --           --        useJava7Objects = true,
  --           --      },
  --           --      useBlocks = true,
  --           --    },
  --           -- If you are developing in projects with different Java versions, you need
  --           -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
  --           -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  --           -- And search for `interface RuntimeOption`
  --           -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
  --           configuration = {
  --             runtimes = table.map(asdf.list("java"), function(entry)
  --               return {
  --                 name = "JavaSE-" .. entry.version.major,
  --                 path = entry.path,
  --               }
  --             end)
  --           }
  --         }
  --       },
  --     })
  --   end
  -- },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("lspconfig").jdtls.setup({
  --       cmd = {
  --         MASON_PATH .. "/bin/jdtls"
  --       }
  --     })
  --   end
  -- },
  {
    'Issafalcon/lsp-overloads.nvim',
  },
  {
    -- Optional
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonUpdate" },
    opts = {
      log_level = vim.log.levels.TRACE,
    },
    config = true,
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
  },
  {
    "apple/pkl-neovim",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    config = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    },
    opts = {
      lightbulb = {
        sign = false
      }
    }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    ft = require("ft"),
    dependencies = {
      -- "kevinhwang91/nvim-ufo",
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lsp = require("lsp-zero").preset({})
      local lspconfig = require('lspconfig')

      -- lsp.on_attach(function(client, bufnr)
      --   require("lsp-format-modifications").attach(client, bufnr, {
      --     format_on_save = true
      --   })
      --   --  vim.keymap.set("n", "K", function()
      --   --    local winid = require('ufo').peekFoldedLinesUnderCursor()
      --   --    if not winid then
      --   --      -- choose one of coc.nvim and nvim lsp
      --   --      vim.lsp.buf.hover()
      --   --      vim.diagnostic.open_float()
      --   --    end
      --   --  end, {
      --   --    buffer = bufnr or 0,
      --   --  })
      -- end)

      -- (Optional) Configure lua language server for neovim
      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
      -- jdtls
      lspconfig.ts_ls.setup({
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
          },
        },
        -- settings = {
        --   typescript = {
        --     tsserver = {
        --       useSyntaxServer = false,
        --     },
        --     inlayHints = {
        --       -- includeInlayParameterNameHints = 'all',
        --       -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --       -- includeInlayFunctionParameterTypeHints = true,
        --       -- includeInlayVariableTypeHints = true,
        --       -- includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        --       -- includeInlayPropertyDeclarationTypeHints = true,
        --       -- includeInlayFunctionLikeReturnTypeHints = true,
        --       -- includeInlayEnumMemberValueHints = true,
        --     },
        --   },
        -- },
      })

      lsp.setup()
    end
  },
}
