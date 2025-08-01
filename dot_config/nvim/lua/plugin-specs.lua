-- TODO
-- breakpoints picker
-- stack frame picker
-- diagnostic code action is not there :/ TOP PRIORITY
--
-- leap keymap is not intuitive
-- codecompanion submit not intuitive <C-s> vs <C-enter>
-- df
--
-- <leader>d split between test and run is not intuitive
-- <leader>e tEst
-- <leader>ed test debug
-- <leader>ee test debug
--         dd debug last (smart)
--
-- Available keymaps groups
-- <leader>l
-- <leader>z
-- <leader>m

-- How to structure this?
--
-- lua/
--   ai/
--   plugins/
--     init.lua     -- low mainteinance plugins, set and forget
--     runnables.lua -- neotest and dap
--     dap/
--       init.lua
--     lsp/
--       init.lua
--   options.lua
-- init.lua -- all the misc bootstrap code, ugly, dont look at here

-- TODO
-- map q close window in normal mode (codecompanion)
--
-- remap scratch pad close to <C-c>
-- remap <C-c> on neotest run to kill neotest
-- remap <leader>dd ^
-- remap <C-c> on dap run to kill dap
-- remap <leader>dd ^

local state = {}

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "folke/flash.nvim",
    },
    ---@type snacks.Config
    config = true,
    opts = {
      bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = {
        indent = {
          char = "▏",
          hl = {
            bg = "#EEEEEE",
            fg = "#BCBCBC"
          },
        },
        scope = {
          char = "▏",
          -- hl = {
          --   ctermfg = 6,
          --   fg = "#444444",
          -- },
        },
        animate = {
          enabled = false,
        }
      },
      input = { enabled = true },
      bufdelete = { enabled = true },
      image = {
        enabled = true,
        force = true,
        inline = true,
        float = false,
        doc = {
          max_width = 20,
          max_height = 10,
        },
      },
      picker = {
        enabled = true,
        layout = {
          preset = "telescope",
        },
        win = {
          input = {
            keys = {
              ["s"] = { "flash", mode = { "n" } },
              ["<C-s>"] = { "flash", mode = { "i" } },
              ["<C-j>"] = { "preview_scroll_down", mode = { "n", "i" } },
              ["<C-k>"] = { "preview_scroll_up", mode = { "n", "i" } },
              ["<C-h>"] = { "preview_scroll_left", mode = { "n", "i" } },
              ["<C-l>"] = { "preview_scroll_right", mode = { "n", "i" } },
            },
          },
        },
        actions = {
          flash = function(picker)
            require("flash").jump({
              pattern = "^",
              label = { after = { 0, 0 } },
              search = {
                mode = "search",
                exclude = {
                  function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                  end,
                },
              },
              action = function(match)
                local idx = picker.list:row2idx(match.pos[1])
                picker.list:_move(idx, true, true)
              end,
            })
          end,
        },
      },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      scratch = {
        -- your scratch configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    keys = {
      { "U",          function() Snacks.picker.undo() end,                  desc = "Undo History" },

      -- -- Top Pickers & Explorer
      -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      -- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      -- { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>.",  function() Snacks.scratch() end,                      desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end,               desc = "Select Scratch Buffer" },

      -- find
      { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
      -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
      -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      -- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
      { "<leader>fw", function() Snacks.picker.grep() end,                  desc = "Grep" },

      -- git
      { "<leader>gg", function() Snacks.lazygit.open() end,                 desc = "Open LazyGit" },
      -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
      -- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
      -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },

      -- Grep
      -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

      -- search
      -- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end,            desc = "Highlights" },
      { "<leader>sJ", function() require('_.pickers.jira').search() end,    desc = "JIRA" },
      -- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      -- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      -- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      -- { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },

      -- UI
      { "<leader>un", function() Snacks.picker.notifications() end,         desc = "Notification History" },

      -- LSP
      { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
      { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
      { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
      { "gi",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
      { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
      { "gl",         function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
      { "gL",         function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    }
  },
  {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    opts = {
      surround = {
        mappings = {
          add = 'S',
          delete = 'ds',
          replace = 'cs'
        }
      },
      -- jump = {
      --   mappings = {
      --     forward_till = '',
      --     backward_till = '',
      --     repeat_jump = ';',
      --   },
      -- },
    },
    config = function(plugin, opts)
      require('mini.ai').setup(opts.ai)
      require('mini.surround').setup(opts.surround)
      -- require('mini.jump').setup(opts.jump)

      -- local indentscope = require("mini.indentscope")

      -- indentscope.setup({
      --   symbol = "▏",
      --   options = {
      --     try_as_border = true
      --   },
      --   draw = {
      --     animation = indentscope.gen_animation.none()
      --   },
      -- })
      --
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      --   callback = function()
      --     vim.b.miniindentscope_disable = true
      --   end,
      -- })
    end
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
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-p>"] = false,
        ["yp"] = "actions.copy_entry_path",
        ["yf"] = "copy_entry_filename",
        ["K"] = "actions.preview",
        ["g."] = "actions.toggle_hidden",
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
  },
  {
    "nvimtools/hydra.nvim",
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
      -- { "<leader>do", "", desc = "" },
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
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      picker = "snacks",
      pull_requests = {
        use_branch_name_as_title = true
      }
    },
    keys = {
      { "<leader>h/", "<cmd>Octo pr search<cr>",   desc = "Search Pull Request" },
      { "<leader>hc", "<cmd>Octo pr create<cr>",   desc = "Create Pull Request" },
      { "<leader>hC", "<cmd>Octo pr checkout<cr>", desc = "Checkout the Pull Request" },
      { "<leader>hx", "<cmd>Octo pr browser<cr>",  desc = "Open Pull Request in Browser" },
      { "<leader>ho", "<cmd>Octo comment add<cr>", desc = "Add comment" },
    },
    init = function()
      require("octo").setup()

      -- hydra
      -- <leader>H
      --
    end
  },
}
