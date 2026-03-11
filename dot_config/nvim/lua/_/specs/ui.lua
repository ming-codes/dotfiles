--
--This module bundles plugins that enhances
--user interface
--
return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      experimental_watch_for_changes = true,
      columns = {
        "permissions",
        "icon",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-s>"] = false,
        ["<C-v>"] = false,
        ["<C-p>"] = false,
        ["<C-t>"] = false,
        ["yp"] = "actions.copy_entry_path",
        ["yf"] = "copy_entry_filename",
        ["K"] = "actions.preview",
        ["gl"] = { "actions.select", opts = { vertical = true } },
        ["gv"] = { "actions.select", opts = { vertical = true } },
        ["gj"] = { "actions.select", opts = { horizontal = true } },
        ["gs"] = { "actions.select", opts = { horizontal = true } },
        ["gt"] = { "actions.select", opts = { tab = true } },
        ["gS"] = { "actions.change_sort", mode = "n" },
        ["g."] = "actions.toggle_hidden",
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = {
        group = "",
        separator = ""
      },
      disable = {
        filetypes = { "lazy", "TelescopePrompt" }
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
      spec = {
        { "<leader>f", group = "Find", icon = { icon = "󰍉", hl = "NONE" } },
        { "<leader>g", group = "Git", icon = { icon = "󰊢", hl = "NONE" } },
        { "<leader>h", group = "GitHub", icon = { icon = "", hl = "NONE" } },
        { "<leader>w", group = "Window", icon = { icon = " ", hl = "NONE" } },
        { "<leader>d", group = "Debugger", icon = { icon = "", hl = "NONE" } },
        { "<leader>e", group = "Test (neotest)", icon = { icon = "", hl = "NONE" } },
        { "<leader>s", group = "Grep", icon = { icon = "󰍉", hl = "NONE" } },
        { "<leader>x", group = "External", icon = { icon = "", hl = "NONE" } },
        { "<leader>u", group = "UI" },
        { "<leader>c", group = "Chat/AI" },

        -- { "<C-n>", vim.lsp.buf.completion },
        { "<C-space>", vim.lsp.buf.code_action },

        { "<leader>y", group = "Yank" },
        { "<leader>yp", "<cmd>let @* = fnamemodify(expand('%'), ':~:.')<cr>", desc = "Path of current file" },
        { "<leader>yP", "<cmd>let @* = expand('%:p')<cr>", desc = "Absolute path of current file" },
        -- { "<leader>yf", "<cmd>echo 'Not implemented'<cr>", desc = "Name of current file" },
        -- { "<leader>yF", "<cmd>echo 'Not implemented'<cr>", desc = "Name of current file with extension" },
        -- { "<leader>yh", "<cmd>GBrowse!<cr>", desc = "Github path of current file" }, -- TODO  yank github path of current file
      },
    },
    config = true
  },
  {
    "mrjones2014/smart-splits.nvim",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    keys = {
      { "<leader>w", desc = "Control Window Hydra" },

      { "<A-h>",     "<cmd>lua require('smart-splits').resize_left()<cr>",       desc = "Resize window left" },
      { "<A-j>",     "<cmd>lua require('smart-splits').resize_down()<cr>",       desc = "Resize window down" },
      { "<A-k>",     "<cmd>lua require('smart-splits').resize_up()<cr>",         desc = "Resize window up" },
      { "<A-l>",     "<cmd>lua require('smart-splits').resize_right()<cr>",      desc = "Resize window down" },
      -- moving between splits
      { "<C-h>",     "<cmd>lua require('smart-splits').move_cursor_left()<cr>",  desc = "Move to window left" },
      { "<C-j>",     "<cmd>lua require('smart-splits').move_cursor_down()<cr>",  desc = "Move to window below" },
      { "<C-k>",     "<cmd>lua require('smart-splits').move_cursor_up()<cr>",    desc = "Move to window above" },
      { "<C-l>",     "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "Move to window right" },
      -- swapping buffers between windows
      { "<C-w>h",    "<cmd>lua require('smart-splits').swap_buf_left()<cr>",     desc = "Swap window with left" },
      { "<C-w>j",    "<cmd>lua require('smart-splits').swap_buf_down()<cr>",     desc = "Swap window with down" },
      { "<C-w>k",    "<cmd>lua require('smart-splits').swap_buf_up()<cr>",       desc = "Swap window with up" },
      { "<C-w>l",    "<cmd>lua require('smart-splits').swap_buf_right()<cr>",    desc = "Swap window with right" },
    },
    opts = {
      -- Enable tmux integration for seamless navigation between Neovim and tmux panes
      multiplexer_integration = 'tmux',
    },
    config = function(plugin, opts)
      local hydra = require("hydra")
      local ss = require('smart-splits');

      ss.setup(opts)

      hydra({
        name = "Control Window Hydra",
        mode = "n",
        body = "<leader>w",
        -- hint = [[
        --      ^ ^Step^ ^ ^      ^ ^     Action
        --  ----^-^-^-^--^-^----  ^-^-------------------
        --      ^ ^back^ ^ ^     ^_t_: toggle breakpoint
        --      ^ ^ _K_^ ^        _T_: clear breakpoints
        --  out _H_ ^ ^ _L_ into  _c_: continue
        --      ^ ^ _J_ ^ ^       _u_: terminate
        --      ^ ^over ^ ^     ^^_r_: open repl
        --                        _]_: move tab right
        --                        _[_: move tab left
        --
        --      ^ ^  _q_: exit
        -- ]],
        config = {
          color = 'blue',
          invoke_on_body = true,
          hint = {
            type = 'window'
          },
        },
        heads = {
          { "h", function() ss.resize_left(10) end,  { desc = "Resize window left (10)", exit = false } },
          { "H", function() ss.resize_left(1) end,   { desc = "Resize window left (1)", exit = false } },
          { "j", function() ss.resize_down() end,    { desc = "Resize window down", exit = false } },
          { "k", function() ss.resize_up() end,      { desc = "Resize window up", exit = false } },
          { "l", function() ss.resize_right(10) end, { desc = "Resize window down", exit = false } },
          { "L", function() ss.resize_right(1) end,  { desc = "Resize window down", exit = false } },
          { "]", "<cmd>tabm +1<cr>",                 { desc = "Move tab right", exit = false } },
          { "[", "<cmd>tabm -1<cr>",                 { desc = "Move tab left", exit = false } },
          { 'q', nil,                                { exit = true, nowait = true, desc = 'exit' } },
        }
      })
    end,
  },
  {
    "hakonharnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
    config = true,
  },
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    keys = {
      { "<leader>;", function() require('dropbar.api').pick() end,                "Navigate winbar (dropbar.nvim)" },
      { "[;",        function() require('dropbar.api').goto_context_start() end,  "Go to start of current context" },
      { "];",        function() require('dropbar.api').select_next_context() end, "Select next context" },
    },
    opts = {
      bar = {
        enable = function(buf, win, _)
          if
              not vim.api.nvim_buf_is_valid(buf)
              or not vim.api.nvim_win_is_valid(win)
              or vim.fn.win_gettype(win) ~= ''
              or vim.wo[win].winbar ~= ''
              or vim.bo[buf].ft == 'help'
          then
            return false
          end

          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if stat and stat.size > 1024 * 1024 then
            return false
          end

          return vim.bo[buf].ft == 'markdown'
              -- or vim.bo[buf].ft == 'oil'           -- enable in oil buffers
              or vim.bo[buf].ft == 'fugitive'      -- enable in fugitive buffers
              or vim.bo[buf].ft == 'fugitiveblame' -- enable in fugitive buffers
              or pcall(vim.treesitter.get_parser, buf)
              or not vim.tbl_isempty(vim.lsp.get_clients({
                bufnr = buf,
                method = 'textDocument/documentSymbol',
              }))
        end,
        sources = function(buf, _)
          local sources = require('dropbar.sources')
          local utils = require('dropbar.utils')
          if vim.bo[buf].ft == 'markdown' then
            return {
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == 'terminal' then
            return {
              sources.terminal,
            }
          end
          return {
            utils.source.fallback({
              sources.lsp,
              sources.treesitter,
            }),
          }
        end
      },
      sources = {
        path = {
          relative_to = function(buf, win)
            -- Show full path in oil or fugitive buffers
            local bufname = vim.api.nvim_buf_get_name(buf)
            if
                vim.startswith(bufname, 'oil://')
                or vim.startswith(bufname, 'fugitive://')
            then
              local root = bufname:gsub('^%S+://', '', 1)
              while root and root ~= vim.fs.dirname(root) do
                root = vim.fs.dirname(root)
              end
              return root
            end

            local ok, cwd = pcall(vim.fn.getcwd, win)
            return ok and cwd or vim.fn.getcwd()
          end,
        },
      },
    }
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('render-markdown').setup({})
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "tpope/vim-fugitive" },
    event = "VeryLazy",
    -- FugitiveHead
    opts = {
      extensions = { 'oil', 'nvim-dap-ui' },
      options = {
        theme = 'papercolor_light',
        -- theme = {
        --   normal = {
        --     a = "LualineNormalA",
        --     b = "LualineNormalB",
        --     c = "LualineNormalC"
        --   },
        --   insert = {
        --     a = "LualineInsertA",
        --     b = "LualineInsertB",
        --     c = "LualineInsertC"
        --   },
        --   visual = {
        --     a = "LualineVisualA",
        --     b = "LualineVisualB",
        --     c = "LualineVisualC"
        --   },
        --   replace = {
        --     a = "LualineReplaceA",
        --     b = "LualineReplaceB",
        --     c = "LualineReplaceC"
        --   },
        --   inactive = {
        --     a = "LualineInactiveA",
        --     b = "LualineInactiveB",
        --     c = "LualineInactiveC"
        --   }
        -- },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = { -- This sits inside a window
        lualine_a = { 'mode' },
        lualine_b = { "lsp_status" },
        lualine_c = { { "filename", path = 3 } },
        lualine_x = {},
        lualine_y = { "progress", "location" },
        lualine_z = { "diagnostics" },
      },
      --inactive_sections = {
      --  lualine_c = { "filename" },
      --  lualine_x = { "filetype" },
      --},
      tabline = {
        lualine_a = {},
        lualine_b = {
          {
            "tabs",
            mode = 2,
            max_length = vim.o.columns,

            tabs_color = {
              active = 'LualineTabActive',
              inactive = 'LualineTabInactive',
            },
            -- fmt = function(name, context)
            --   -- Show + if buffer is modified in tab
            --   local buflist = vim.fn.tabpagebuflist(context.tabnr)
            --   local winnr = vim.fn.tabpagewinnr(context.tabnr)
            --   local bufnr = buflist[winnr]
            --   local mod = vim.fn.getbufvar(bufnr, '&mod')
            --
            --   return name .. (mod == 1 and ' +' or '') .. '/'
            -- end
          }
        },
        --   --lualine_b = {
        --   --  {
        --   --    function()
        --   --      return ""
        --   --    end,
        --   --    padding = { left = 1, right = 0 },
        --   --  },
        --   --},
        --   --lualine_c = {
        --   --  {
        --   --    "gitbranch",
        --   --    icon = "󰊢",
        --   --  },
        --   --},
        lualine_z = { "FugitiveHead" },
      },
    },
  },
  {
    "NLKNguyen/papercolor-theme",
    event = "VimEnter",
    config = function()
      vim.cmd("colorscheme PaperColor")
      vim.cmd('hi NeotestDir guifg=#57979d')
      vim.cmd('hi NeotestFile guifg=#57979d')
      vim.cmd('hi NeotestSkipped guifg=#57979d')
      vim.cmd('hi NeotestPassed guifg=#5F8700')
      vim.cmd('hi NeotestRunning guifg=#E6C200')
      vim.cmd('hi NeotestWatching guifg=#E6C200')
      vim.cmd('hi TabLineSel guibg=#0087AF guifg=#EEEEEE')
      vim.cmd('hi TabLine guibg=#E4E4E4 guifg=#444444')
      vim.cmd('hi TabLineFill guibg=#E4E4E4 guifg=#444444')
      vim.cmd('hi DropBarMenuHoverEntry guibg=#005f87 guifg=#EEEEEE')
      vim.cmd('hi DropBarMenuCurrentContext guibg=#0087af guifg=#EEEEEE')

      require('_.colors');
    end
  },
}
