return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      -- indent = { enabled = true },
      -- input = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          preset = "telescope",
        },
      },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
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
    "ofirgall/open.nvim",
    dependencies = {
      {
        "ofirgall/open-jira.nvim",
        opts = {
          url = os.getenv("JIRA_URL")
        }
      }
    },
    lazy = true,
    opts = {
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble", "TroublePrevious", "TroubleNext" },
    opts = { use_diagnostic_signs = true },
    config = function(_, opts)
      local ext = require("extensions.trouble")
      local trouble = require("trouble")

      trouble.setup(opts)

      vim.api.nvim_create_user_command("TroublePrevious", ext.prev, {
      })
      vim.api.nvim_create_user_command("TroubleNext", ext.next, {
      })
    end
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
    },
    config = function(_, opts)
      local wk = require("which-key")
      local table = require("utils.table")
      local mappings = require("mappings")

      vim.o.timeout = true
      vim.o.timeoutlen = 300

      wk.setup(opts)

      table.each(mappings, function(rargs)
        wk.add(rargs)
      end)
    end
  },
  {
    "Shatur/neovim-session-manager",
    event = "BufWritePost",
    cmd = "SessionManager",
  },
  {
    "stevearc/resession.nvim",
    config = true
    --opts = {
    --  buf_filter = function(bufnr) return require("astronvim.utils.buffer").is_valid(bufnr) end,
    --  tab_buf_filter = function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs, bufnr) end,
    --  extensions = { astronvim = {} },
    --},
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      mappings = {
        basic = true,
        extra = true,
      }
    }
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" }
  },
  {
    "github/copilot.vim",
    cmd = { "Copilot" }
  },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    config = true
    -- init = function()
    --   require('kulala').setup()
    -- end
  }
  -- {
  --   "jiaoshijie/undotree",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function(_, opts)
  --     require("undotree").setup()
  --   end
  -- }
}
-- return {
--   "nvim-telescope/telescope.nvim",
--   dependencies = {
--     { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
--   },
--   cmd = "Telescope",
--   opts = function()
--     local actions = require "telescope.actions"
--     local get_icon = require("astronvim.utils").get_icon
--     return {
--       defaults = {
--         prompt_prefix = string.format("%s ", get_icon "Search"),
--         selection_caret = string.format("%s ", get_icon "Selected"),
--         path_display = { "truncate" },
--         sorting_strategy = "ascending",
--         layout_config = {
--           horizontal = {
--             prompt_position = "top",
--             preview_width = 0.55,
--           },
--           vertical = {
--             mirror = false,
--           },
--           width = 0.87,
--           height = 0.80,
--           preview_cutoff = 120,
--         },
--
--         mappings = {
--           i = {
--             ["<C-n>"] = actions.cycle_history_next,
--             ["<C-p>"] = actions.cycle_history_prev,
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,
--           },
--           n = { ["q"] = actions.close },
--         },
--       },
--     }
--   end,
--   config = require "plugins.configs.telescope",
-- }
-- local get_icon = require("astronvim.utils").get_icon
-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   dependencies = { "MunifTanjim/nui.nvim" },
--   cmd = "Neotree",
--   init = function() vim.g.neo_tree_remove_legacy_commands = true end,
--   opts = {
--     auto_clean_after_session_restore = true,
--     close_if_last_window = true,
--     sources = { "filesystem", "buffers", "git_status" },
--     source_selector = {
--       winbar = true,
--       content_layout = "center",
--       sources = {
--         { source = "filesystem", display_name = get_icon "FolderClosed" .. " File" },
--         { source = "buffers", display_name = get_icon "DefaultFile" .. " Bufs" },
--         { source = "git_status", display_name = get_icon "Git" .. " Git" },
--         { source = "diagnostics", display_name = get_icon "Diagnostic" .. " Diagnostic" },
--       },
--     },
--     default_component_configs = {
--       indent = { padding = 0, indent_size = 1 },
--       icon = {
--         folder_closed = get_icon "FolderClosed",
--         folder_open = get_icon "FolderOpen",
--         folder_empty = get_icon "FolderEmpty",
--         default = get_icon "DefaultFile",
--       },
--       modified = { symbol = get_icon "FileModified" },
--       git_status = {
--         symbols = {
--           added = get_icon "GitAdd",
--           deleted = get_icon "GitDelete",
--           modified = get_icon "GitChange",
--           renamed = get_icon "GitRenamed",
--           untracked = get_icon "GitUntracked",
--           ignored = get_icon "GitIgnored",
--           unstaged = get_icon "GitUnstaged",
--           staged = get_icon "GitStaged",
--           conflict = get_icon "GitConflict",
--         },
--       },
--     },
--     commands = {
--       system_open = function(state) require("astronvim.utils").system_open(state.tree:get_node():get_id()) end,
--       parent_or_close = function(state)
--         local node = state.tree:get_node()
--         if (node.type == "directory" or node:has_children()) and node:is_expanded() then
--           state.commands.toggle_node(state)
--         else
--           require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
--         end
--       end,
--       child_or_open = function(state)
--         local node = state.tree:get_node()
--         if node.type == "directory" or node:has_children() then
--           if not node:is_expanded() then -- if unexpanded, expand
--             state.commands.toggle_node(state)
--           else -- if expanded and has children, seleect the next child
--             require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
--           end
--         else -- if not a directory just open it
--           state.commands.open(state)
--         end
--       end,
--       copy_selector = function(state)
--         local node = state.tree:get_node()
--         local filepath = node:get_id()
--         local filename = node.name
--         local modify = vim.fn.fnamemodify
--
--         local results = {
--           e = { val = modify(filename, ":e"), msg = "Extension only" },
--           f = { val = filename, msg = "Filename" },
--           F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
--           h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
--           p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
--           P = { val = filepath, msg = "Absolute path" },
--         }
--
--         local messages = {
--           { "\nChoose to copy to clipboard:\n", "Normal" },
--         }
--         for i, result in pairs(results) do
--           if result.val and result.val ~= "" then
--             vim.list_extend(messages, {
--               { ("%s."):format(i), "Identifier" },
--               { (" %s: "):format(result.msg) },
--               { result.val, "String" },
--               { "\n" },
--             })
--           end
--         end
--         vim.api.nvim_echo(messages, false, {})
--         local result = results[vim.fn.getcharstr()]
--         if result and result.val and result.val ~= "" then
--           vim.notify("Copied: " .. result.val)
--           vim.fn.setreg("+", result.val)
--         end
--       end,
--     },
--     window = {
--       width = 30,
--       mappings = {
--         ["<space>"] = false, -- disable space until we figure out which-key disabling
--         ["[b"] = "prev_source",
--         ["]b"] = "next_source",
--         o = "open",
--         O = "system_open",
--         h = "parent_or_close",
--         l = "child_or_open",
--         Y = "copy_selector",
--       },
--     },
--     filesystem = {
--       follow_current_file = true,
--       hijack_netrw_behavior = "open_current",
--       use_libuv_file_watcher = true,
--     },
--     event_handlers = {
--       {
--         event = "neo_tree_buffer_enter",
--         handler = function(_) vim.opt_local.signcolumn = "auto" end,
--       },
--     },
--   },
-- }
