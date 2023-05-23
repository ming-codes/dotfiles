return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    config = function()
      -- if opts then require("luasnip").config.setup(opts) end
      vim.tbl_map(
        function(type)
          require("luasnip.loaders.from_" .. type).lazy_load()
        end,
        { "vscode", "snipmate", "lua" }
      )
    end
  },
  {
    "rcarriga/cmp-dap",
    ft = { "dap-repl", "dapui_watches", "dapui_hover" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end
  },
  --   require("cmp").setup({
  --   enabled = function()
  --     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
  --         or require("cmp_dap").is_dap_buffer()
  --   end
  -- })
  --
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    opts = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }),
      }
    end,
    config = function(plugin, opts)
      require('cmp').setup(opts)
    end
  }
}
--  {
--    "hrsh7th/nvim-cmp",
--    version = false, -- last release is way too old
--    event = "InsertEnter",
--    dependencies = {
--      "hrsh7th/cmp-nvim-lsp",
--      "hrsh7th/cmp-buffer",
--      "hrsh7th/cmp-path",
--      "saadparwaiz1/cmp_luasnip",
--    },
--    opts = function()
--      local cmp = require("cmp")
--      return {
--        mapping = cmp.mapping.preset.insert({
--          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--          ["<C-f>"] = cmp.mapping.scroll_docs(4),
--          ["<C-Space>"] = cmp.mapping.complete(),
--          ["<C-e>"] = cmp.mapping.abort(),
--          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--          ["<S-CR>"] = cmp.mapping.confirm({
--            behavior = cmp.ConfirmBehavior.Replace,
--            select = true,
--          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--        }),
--        formatting = {
--          format = function(_, item)
--            local icons = require("lazyvim.config").icons.kinds
--            if icons[item.kind] then
--              item.kind = icons[item.kind] .. item.kind
--            end
--            return item
--          end,
--        },
--        experimental = {
--          ghost_text = {
--            hl_group = "LspCodeLens",
--          },
--        },
--      }
--    end,
--  },
--   {
--     "hrsh7th/nvim-cmp",
--     commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
--     dependencies = {
--       "saadparwaiz1/cmp_luasnip",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     event = "InsertEnter",
--     opts = function()
--       local cmp = require "cmp"
--       local snip_status_ok, luasnip = pcall(require, "luasnip")
--       local lspkind_status_ok, lspkind = pcall(require, "lspkind")
--       if not snip_status_ok then return end
--       local border_opts = {
--         border = "single",
--         winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
--       }
--
--       local function has_words_before()
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
--       end
--
--       return {
--         enabled = function()
--           if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
--           return vim.g.cmp_enabled
--         end,
--         preselect = cmp.PreselectMode.None,
--         formatting = {
--           fields = { "kind", "abbr", "menu" },
--           format = lspkind_status_ok and lspkind.cmp_format(astronvim.lspkind) or nil,
--         },
--         snippet = {
--           expand = function(args) luasnip.lsp_expand(args.body) end,
--         },
--         duplicates = {
--           nvim_lsp = 1,
--           luasnip = 1,
--           cmp_tabnine = 1,
--           buffer = 1,
--           path = 1,
--         },
--         confirm_opts = {
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = false,
--         },
--         window = {
--           completion = cmp.config.window.bordered(border_opts),
--           documentation = cmp.config.window.bordered(border_opts),
--         },
--         mapping = {
--           ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
--           ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
--           ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--           ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--           ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--           ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--           ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
--           ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
--           ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--           ["<C-y>"] = cmp.config.disable,
--           ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
--           ["<CR>"] = cmp.mapping.confirm { select = false },
--         },
--       }
--     end,
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     build = (not jit.os:find("Windows"))
--         and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
--       or nil,
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--       config = function()
--         require("luasnip.loaders.from_vscode").lazy_load()
--       end,
--     },
--     opts = {
--       history = true,
--       delete_check_events = "TextChanged",
--     },
--     -- stylua: ignore
--     keys = {
--       {
--         "<tab>",
--         function()
--           return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
--         end,
--         expr = true, silent = true, mode = "i",
--       },
--       { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
--       { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
--     },
--   },
