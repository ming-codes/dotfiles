return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- "rcarriga/cmp-dap",
      -- "williamboman/mason.nvim",
      -- "rcarriga/nvim-dap-ui",
      "folke/snacks.nvim",
      "nvimtools/hydra.nvim",
    },
    cmd = {
      "DapNew",
      "DapTerminate",
      "DapContinue",
      "DapBreakpointsClear",
      "DapToggleBreakpoint",
      "DapShowLog",
    },
    keys = {
      { "<leader>D", desc = "Control Debugger Hydra", icon = { icon = "", hl = "NONE" } },

      { "t", function() require('dap').toggle_breakpoint() end, desc = "Absolute path of current file" },
      { "T", function() require('dap').run_to_cursor() end, desc = "Run to Cursor" },

      -- better keymaps?
      -- gn = down
      -- tc = hc
      --
      -- ?o step over
      -- ?i step into
      --
      { "<Up>", function() require('dap').continue() end, desc = "Continue" },
      { "<Down>", function() require('dap').step_over() end, desc = "Step over" },
      { "<Right>", function() require('dap').step_into() end, desc = "Step into" },
      { "<Left>", function() require('dap').step_out() end, desc = "Step out" },

      { "]d", function() require('dap').down() end, desc = "Go down frame stack" },
      { "[d", function() require('dap').up() end, desc = "Go up frame stack" },

      { "<leader>dC", function() require('dap').continue() end, desc = "Continue" },

      { "<C-c>", "<cmd>DapTerminate<cr>", desc = "Terminate debug session" },

      {
        "<leader>df",
        function()
          local dap = require('dap')
          local items = {}

          for lang, configs in pairs(dap.configurations) do
            for _, config in ipairs(configs) do
              table.insert(items, config)
            end
          end

          Snacks.picker({
            items = items,
            format = function(item)
              return { { item.name } }
            end,
            preview = nil,
            confirm = function(picker, item)
              picker:close()
              state.last_run = 'debug'

              dap.run(item)
            end,
          })
        end,
        desc = "Debug current file"
      },
      {
        "<leader>sb",
        function()
          require('dap').list_breakpoints(false)
          Snacks.picker.qflist()
        end,
        desc = "List breakpoints"
      },

      -- { "gD", "<cmd>Telescope dap frames<cr>", desc = "Go to frame" },
      { "<leader>ud", function() require('dapui').toggle() end, desc = "Toggle DAP UI" },
      {
        "<leader>dE",
        function()
          require('dapui').float_element('repl',
            { ['width'] = 180, ['height'] = 40, ['position'] = 'center' })
        end,
        desc = "REPL as float"
      },
      {
        "<leader>dt",
        function()
          require('dapui').float_element('console',
            { ['width'] = 180, ['height'] = 40, ['position'] = 'center' })
        end,
        desc = "Console as float"
      },
      -- <leader>dfl -- float repl
      -- <leader>dfc -- float console
      -- breakpoints, stacks, scopes
    },
    init = function()
      local dap = require("dap")
      local registry = require("mason-registry")
      local home = vim.fn.expand("~")

      require('_.hacks.dap')

      dap.adapters = {
        ["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            -- command = "js-debug-adapter", -- As I'm using mason, this will be in the path
            -- TODO  need to look up mason path for ^
            -- require("./js-debug/src/dapDebugServer");
            -- :lua print(require("mason-registry").get_package("js-debug-adapter"):get_receipt())
            -- nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js
            -- commaond = "node" -- we probably want a fixed version of node
            -- args { "dapDebugServer", "${port}" }
            command = "node",
            args = {
              home .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
              "${port}"
            },
          }
        },
        bun = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "bun",
            args = {
              home .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
              "${port}"
            },
          }
        },

        nlua = function(callback, config)
          callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
        end
      }
      dap.configurations = {
        typescript = {
          {
            name = "Lanunch ts-node",
            type = "pwa-node",
            request = "launch",
            runtimeArgs = { "-r", "ts-node/register" },
            runtimeExecutable = "node",
            args = { "--inspect", "${file}" },
            skipFiles = { "node_modules/**" },
            console = "integratedTerminal",
          },
        },
        javascript = {
          {
            name = "Launch file using node",
            type = "pwa-node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            name = "Launch file using node",
            type = "pwa-node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            name = "Next.js: debug server-side",
            type = "pwa-node",
            request = "launch",
            runtimeExecutable = "node",
            runtimeArgs = { "./node_modules/.bin/next", "dev" },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          {
            name = "Next.js: debug client-side",
            type = "chrome",
            request = "launch",
            url = "http://localhost:3000"
          },
          {
            name = "jest",
            type = "pwa-node",
            request = "launch",
            runtimeExecutable = "npx",
            runtimeArgs = { "jest", "test:unit" },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          {
            name = "vitest run",
            type = "pwa-node",
            request = "launch",
            runtimeExecutable = "npx",
            runtimeArgs = { "vitest", "run" },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          {
            name = "Next.js: debug full stack",
            type = "node-terminal",
            request = "launch",
            command = "npm run dev",
            serverReadyAction = {
              pattern = "- Local:.+(https?://.+)",
              uriFormat = "%s",
              action = "debugWithChrome"
            }
          },
        },
        lua = {
          {
            type = 'nlua',
            request = 'attach',
            name = "Attach to running Neovim instance",
          },
        }
      }

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapStopped", {
        text = "󰁕",
        texthl = "",
        linehl = "",
        numhl = ""
      })

      require('hydra')({
        -- string? only used in auto-generated hint
        name = "Control Debugger Hydra",

        -- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
        mode = "n",

        -- string? key required to activate the hydra, when excluded, you can use
        -- Hydra:activate()
        body = "<leader>D",

        -- these are explained below
        hint = [[
             ^ ^Step^ ^ ^      ^ ^     Action
         ----^-^-^-^--^-^----  ^-^-------------------
             ^ ^back^ ^ ^     ^_t_: toggle breakpoint
             ^ ^ _K_^ ^        _T_: clear breakpoints
         out _H_ ^ ^ _L_ into  _c_: continue
             ^ ^ _J_ ^ ^       _u_: terminate
             ^ ^over ^ ^     ^^_r_: open repl
                               _]_: go down frame stack
                               _[_: go up frame stack

             ^ ^  _q_: exit
        ]],
        ---@type hydra.Config
        config = {
          color = 'pink',
          invoke_on_body = true,
          ---@type hydra.Hint
          hint = {
            type = 'window'
          },
        },
        heads = {
          { 'H', dap.step_out,          { desc = 'step out' } },
          { 'J', dap.step_over,         { desc = 'step over' } },
          { 'K', nil,                   { desc = 'step back' } },
          { 'L', dap.step_into,         { desc = 'step into' } },
          { 't', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
          { 'T', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
          { 'c', dap.continue,          { desc = 'continue' } },
          { 'E', dap.eval,              { desc = 'evaluate cursor' } },
          { "]", dap.down,              { desc = "Go down frame stack" } },
          { "[", dap.up,                { desc = "Go up frame stack" } },
          { 'u', function()
            if state.last_run == 'debug test' then
              require("neotest").run.stop()
            elseif state.last_run == 'debug' then
              require("dap").terminate()
            end
          end, { desc = 'terminate', exit = true } },
          { 'r', dap.repl.open, { exit = true, desc = 'open repl' } },
          { 'q', nil,           { exit = true, nowait = true, desc = 'exit' } },
        }
      })
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "nvim-dap" },
    cmd = { "DapInstall", "DapUninstall" },
    opts = { handlers = {} },
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
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
      floating = {
        border = "rounded"
      },
      -- layouts = {
      --   {
      --     elements = { {
      --       id = "repl",
      --       size = 0.5
      --     }, {
      --       id = "console",
      --       size = 0.5
      --     } },
      --     position = "bottom",
      --     size = 10
      --   }
      -- }
    },
    config = true
  },
}
