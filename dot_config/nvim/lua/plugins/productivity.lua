return {
  {
    "debugloop/telescope-undo.nvim",

    keys = {
      { "<leader>uu", "<cmd>Telescope undo<cr>", desc = "Go to undotree" }
    },

    config = function()
      require("telescope").load_extension("undo")
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "gb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Go to breakpoints" },
      -- :Telescope dap commands
      -- :Telescope dap configurations
      -- :Telescope dap variables
      -- :Telescope dap frames
      { "<leader>dd", "<cmd>Telescope dap configurations<cr>", desc = "Debug last config" },
      { "<leader>dD", "<cmd>Telescope dap configurations<cr>", desc = "Debug" },
      -- { "<leader>dd", extensions.launch_last, desc = "Rerun last config" },
      -- { "<leader>dD", extensions.launch_options, desc = "Rerun last config" },
    },
    opts = function()
      local config = require('extensions.dap.configurations')

      return {
        configurations = config.load_configurations()
      }
    end,
    config = function(_, opts)
      require("telescope").load_extension("dap")

      require("dap").configurations.javascript = opts.configurations
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = function()
      local telescope = require("extensions.telescope")
      local builtin = require("telescope.builtin")

      return {
        { "<leader>f?", "<cmd>Telescope builtin<cr>", desc = "Find Telescope builtins" },

        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find word (grep)" },
        -- { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word (grep)" },

        { "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Find diagnostics" },
        { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics in workspace" },

        { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
        -- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
        -- { "gD", "<cmd>Telescope lsp_", desc = "" },
        { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
        { "go", "<cmd>Telescope lsp_type_definitions", desc = "Go to type definitions" },
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
        -- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
        -- { "gs", "<cmd>Telescope lsp_", desc = "" },

        -- 
        -- { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
        -- { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        -- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
        -- -- find
        -- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        -- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
        -- -- git
        -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
        -- -- search
        -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        -- { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
        -- { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
        -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        -- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        -- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
        -- { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
        -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
        -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
        -- {
        --   "<leader>ss",
        --   Util.telescope("lsp_document_symbols", {
        --     symbols = {
        --       "Class",
        --       "Function",
        --       "Method",
        --       "Constructor",
        --       "Interface",
        --       "Module",
        --       "Struct",
        --       "Trait",
        --       "Field",
        --       "Property",
        --     },
        --   }),
        --   desc = "Goto Symbol",
        -- },
        -- {
        --   "<leader>sS",
        --   Util.telescope("lsp_dynamic_workspace_symbols", {
        --     symbols = {
        --       "Class",
        --       "Function",
        --       "Method",
        --       "Constructor",
        --       "Interface",
        --       "Module",
        --       "Struct",
        --       "Trait",
        --       "Field",
        --       "Property",
        --     },
        --   }),
        --   desc = "Goto Symbol (Workspace)",
        -- },
      }
    end,
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { no_ignore = true, default_text = line })()
            end,
            ["<a-h>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { hidden = true, default_text = line })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
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
        filetypes = { "TelescopePrompt" }
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
      local extensions = require("extensions.which-key")

      vim.o.timeout = true
      vim.o.timeoutlen = 300

      wk.setup(opts)
      wk.register(extensions.sections, { prefix = "<leader>" })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "󰐊" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 1000 })
      end
    },
    config = function(_, opts)
      local notify = require("notify")

      notify.setup(opts)

      vim.notify = notify
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      close_fold_kinds = {'imports', 'comment'},

      provider_selector = function()
        return {'treesitter', 'indent'}
      end
    },
    keys = function()
      local ufo = require('ufo')

      return {
        { 'zR', ufo.openAllFolds, desc = "Open all folds" },
        { 'zM', ufo.closeAllFolds, desc = "Close all folds" },
        { 'zr', ufo.openFoldsExceptKinds, desc = "Open all folds except kinds" },
        { 'zm', ufo.closeFoldsWith, desc = "Close folds with" },
      }
    end,
    config = function(_, opts)
      local ufo = require('ufo')

      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      ufo.setup(opts)
    end
  }
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
